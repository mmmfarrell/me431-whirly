
import numpy as np
from scipy.signal import place_poles as place 
import control as cnt

# System Parameters

g = 9.81               # Gravity, m/s**2
l1 = 0.85              # Distance between fulcrum and the head , m
l2 = 0.3048            # Distance between the fulcrum and end of Whirlybird's tail, m
m1 = 0.891             # Mass of whirlybird head, kg
m2 = 1.0                 # Mass of counter weight, kg
d = 0.178              # Crossbar Lengh, m
h = 0.65               # Post Height, m
r = 0.12               # Propeller Radius, m
Jx = 0.0047            # , kg-m**2
Jy = 0.0014            # , kg-m**2
Jz = 0.0041            # , kg-m**2
km = 5.8#6.293 #5.8               # , N/PWM

# Initial Conditions
phi0 =   0.0#-1.79#0.0*np.pi/180 # ,rads
theta0 = -.44 #0.0*np.pi/180 # ,rads
psi0 = 0.0*np.pi/180   # ,rads
phidot0 = 0.0          # ,rads/s
thetadot0 = 0.0        # ,rads/s
psidot0 = 0.0          # ,rads/s
F_eq = 5.223

# Simulation parameters
Ts = 0.01#0.005#33 #0.01                # Time step
sigma = 0.05


####################################################
#                 State Space
####################################################
# Set Maximums
F_max = 12#2*km
Tau_max = 6#2*km*d
theta_max = 60 * np.pi/180
phi_max = 60 * np.pi/180
psi_max = 60 * np.pi/180                   

error_max = 1                # Max step size,m
M = 3                        # Time scale separation between
					         # inner and outer loop

# State Space Equations
# xdot = A*x + B*u
# y = C*x

####################################################
############ Longitudinal ##########################
####################################################

A_long = np.matrix([[0.0, 1.0], [0.0, 0.0]])

B_long = np.matrix([[0.0], [l1/(m1*l1**2+m2*l2**2+Jy)]])

C_long = np.matrix([[1.0, 0.0]])
Cr_long = C_long

# Augmented Matrices
A1_long = np.concatenate((
	np.concatenate((A_long,np.zeros((2,1))),axis=1),
	np.concatenate((-Cr_long,np.matrix([[0.0]])),axis=1)),axis = 0)

B1_long = np.concatenate((B_long,np.matrix([[0.0]])),axis = 0)

# Desired Closed Loop tuning parameters
# S**2 + 2*zeta*wn*S + wn**2

th_tr = 2.0           # Rise time, s
th_zeta = 0.707       # Damping Coefficient
th_wn = 2.2/th_tr     # Natural frequency

# S**2 + alpha1*S + alpha0
th_alpha1 = 2.0*th_zeta*th_wn
th_alpha0 = th_wn**2 

integrator_pole_long = -10.0#-10.0


# Desired Poles
des_char_poly_long = np.convolve([1,th_alpha1,th_alpha0],
	np.poly(integrator_pole_long))
des_poles_long = np.roots(des_char_poly_long)
print 'des_poles_long'
print des_poles_long


# Controllability Matrix
if np.linalg.matrix_rank(cnt.ctrb(A1_long,B1_long))!=3:
	print("The longitudinal system is not controllable")
else:
	K1_long = cnt.acker(A1_long,B1_long,des_poles_long)
	K_long = K1_long[0,0:2]
	ki_long = K1_long[0,2]
	print('K1_long: ', K1_long)
	print('K_long: ', K_long)
	print('ki_long: ', ki_long)

###### OBSERVER #############
# Observer design
obs_th_wn = 5.0*th_wn 
obs_des_char_poly_long = [1,2.0*th_zeta*obs_th_wn,obs_th_wn**2]
obs_des_poles_long = np.roots(obs_des_char_poly_long)

if np.linalg.matrix_rank(cnt.obsv(A_long,C_long))!=2:
	print("The longitudinal system is not Observable")
else:
	print 'Long Observable'
	L_long = place(A_long.T,C_long.T,obs_des_poles_long).gain_matrix.T
	print('L_long:', L_long)
	# K1_long = cnt.acker(A1_long,B1_long,des_poles_long)
	# K_long = K1_long[0,0:2]
	# ki_long = K1_long[0,2]
	# print('K1_long: ', K1_long)
	# print('K_long: ', K_long)
	# print('ki_long: ', ki_long)

###############################################
############ Lateral ##########################
###############################################

A_lat = np.matrix([[0.0,	0.0,               1.0,      0.0],
			   [0.0,		0.0,               0.0,      1.0],
			   [0.0,		0.0,          		0.0,     0.0],
			   [l1*F_eq/(m1*(l1**2)+m2*(l2**2)+Jz),			0.0,				0.0, 	0.0]])

B_lat = np.matrix([[0.0],
			   [0.0],
			   [1.0/Jx],
			   [0.0]])

C_lat = np.matrix([[1.0,0.0,0.0,0.0],
			   [0.0,1.0,0.0,0.0]])
Cr_lat = np.matrix([[0.0, 1.0, 0.0, 0.0]])

# Augmented Matrices
A1_lat = np.concatenate((
	np.concatenate((A_lat,np.zeros((4,1))),axis=1),
	np.concatenate((-Cr_lat,np.matrix([[0.0]])),axis=1)),axis = 0)

B1_lat = np.concatenate((B_lat,np.matrix([[0.0]])),axis = 0)

# Desired Closed Loop tuning parameters
# S**2 + 2*zeta*wn*S + wn**2

psi_tr = 2.0#0.5           # Rise time, s
psi_zeta = 0.8#0.707       # Damping Coefficient
psi_wn = 2.2/psi_tr     # Natural frequency

# S**2 + alpha1*S + alpha0
psi_alpha1 = 2.0*psi_zeta*psi_wn
psi_alpha0 = psi_wn**2 

# Desired Closed Loop tuning parameters
# S**2 + 2*zeta*wn*S + wn**2

phi_tr = 1.5#0.66667#psi_tr/M      # Rise time, s
phi_zeta = 1.0#0.707      # Damping Coefficient
phi_wn = 2.2/phi_tr     # Natural frequency
integrator_pole_lat = -15.0

# S**2 + alpha1*S + alpha0
phi_alpha1 = 2.0*phi_zeta*phi_wn
phi_alpha0 = phi_wn**2 

# Desired Poles
des_char_poly_lat = np.convolve(
	np.convolve([1,psi_alpha1,psi_alpha0],[1,phi_alpha1,phi_alpha0]),
	np.poly(integrator_pole_lat))
des_poles_lat = np.roots(des_char_poly_lat)
print 'des_poles_lat'
print des_poles_lat


# Controllability Matrix
if np.linalg.matrix_rank(cnt.ctrb(A1_lat,B1_lat))!=5:
	print("The lateral system is not controllable")
else:
	K1_lat = cnt.acker(A1_lat,B1_lat,des_poles_lat)
	K_lat = K1_lat[0,0:4]
	ki_lat = K1_lat[0,4]
	print('K1_lat: ', K1_lat)
	print('K_lat: ', K_lat)
	print('ki_lat: ', ki_lat)

###### OBSERVER #############
# Observer design
obs_phi_wn = 5.0*phi_wn 
obs_psi_wn = 5.0*psi_wn 
obs_des_char_poly_lat = np.convolve([1,2.0*psi_zeta*obs_psi_wn,obs_psi_wn**2],
								 [1,2.0*phi_zeta*obs_phi_wn,obs_phi_wn**2])

obs_des_poles_lat = np.roots(obs_des_char_poly_lat)

# print 'HERE'
# print obs_des_poles_lat

if np.linalg.matrix_rank(cnt.obsv(A_lat,C_lat))!=4:
	print("The lateral system is not Observable")
else:
	# L_lat = place(A_lat.T,C_lat.T,obs_des_poles_lat).gain_matrix.T
	L_lat = np.matrix([[11.1614,	-1.0628],
			   [7.6664,		12.3053],
			   [31.1417,		-8.7392],
			   [62.2134,			36.4611]])
	print('L_lat:', L_lat)
		# K1_lat = cnt.acker(A1_lat,B1_lat,des_poles_lat)
		# K_lat = K1_lat[0,0:4]
		# ki_lat = K1_lat[0,4]
		# print('K1_lat: ', K1_lat)
		# print('K_lat: ', K_lat)
		# print('ki_lat: ', ki_lat)




# #################################################
# #          Uncertainty Parameters
# #################################################
# UNCERTAINTY_PARAMETERS = False #False
# if UNCERTAINTY_PARAMETERS:
# 	alpha = 0.2;                                    # uncertainty parameter
# 	l1 = 0.85*(1+2*alpha*np.random.rand()-alpha)    # Distance between fulcrum 
# 													# and the head , m
# 	l2 = 0.3048*(1+2*alpha*np.random.rand()-alpha)  # Distance between the fulcrum
# 													# and end of Whirlybird's tail, m
# 	m1 = 0.891*(1+2*alpha*np.random.rand()-alpha)   # Mass of whirlybird head, kg
# 	m2 = 1*(1+2*alpha*np.random.rand()-alpha)       # Mass of counter weight, kg
# 	d = 0.178*(1+2*alpha*np.random.rand()-alpha)    # Crossbar Lengh, m
# 	h = 0.65*(1+2*alpha*np.random.rand()-alpha)     # Post Height, m
# 	r = 0.12*(1+2*alpha*np.random.rand()-alpha)     # Propeller Radius, m
# 	Jx = 0.0047*(1+2*alpha*np.random.rand()-alpha)  # , kg-m**2
# 	Jy = 0.0014*(1+2*alpha*np.random.rand()-alpha)  # , kg-m**2
# 	Jz = 0.0041*(1+2*alpha*np.random.rand()-alpha)  # , kg-m**2

