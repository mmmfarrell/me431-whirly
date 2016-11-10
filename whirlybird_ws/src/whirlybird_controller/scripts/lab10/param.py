
import numpy as np

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
phi0 =   0.0*np.pi/180 # ,rads
theta0 = 0.0#-.48632 #0.0*np.pi/180 # ,rads
psi0 = 0.0*np.pi/180   # ,rads
phidot0 = 0.0          # ,rads/s
thetadot0 = 0.0        # ,rads/s
psidot0 = 0.0          # ,rads/s

# Simulation parameters
Ts = 0.01                # Time step
sigma = 0.05

# Set Maximums
F_max = 12#2*km
Tau_max = 6#2*km*d
theta_max = 60 * np.pi/180
phi_max = 60 * np.pi/180
psi_max = 60 * np.pi/180

####################################################
#     PD Control: Design Time Strategy
####################################################
zeta = 0.707
Fe = 5.223#(m1*l1 - m2*l2)*(g/l1)
b0psi = (l1*Fe)/(m1*l1**2 + m2*l2**2 +Jz)# +Jx
b0phi = 1/Jx
b0th = l1/(m1*l1**2 + m2*l2**2 + Jy)#1.152



#==================================================
#                 Longitudinal
#==================================================
# Theta
th_zeta = 0.8
tr_th = 1.4
wn_th = 2.2/tr_th
theta_kp = (wn_th**2)/(b0th)
theta_kd = (2*th_zeta*wn_th)/b0th
theta_ki = 0.25#.25#0.5


#==================================================
#                 Lateral
#==================================================


#---------------------------------------------------
#                    Inner Loop
#---------------------------------------------------
# phi
zeta_phi = 1.0
tr_phi = 0.25#0.4#0.3
wn_phi = 2.2/tr_phi
phi_kp = (wn_phi**2)*Jx#/b0phi
phi_kd = (2*zeta_phi*wn_phi)*Jx#/(b0phi)


#---------------------------------------------------
#                  Outer Loop         
#---------------------------------------------------
# psi
zeta_psi = 0.8 # 1.0
tr_psi = tr_phi*8#3.0 # 3.0
wn_psi = 2.2/tr_psi
psi_kp = (wn_psi**2)/b0psi
psi_kd = (2*zeta_psi*wn_psi)/b0psi #.24491
psi_ki = 0.02#0.001#0.001#0.005#0.015#1.0

print("theta_kp: ", theta_kp)
print("theta_kd: ", theta_kd)
print("phi_kp: ", phi_kp)
print("phi_kd: ", phi_kd)
print("psi_kp: ", psi_kp)
print("psi_kd: ", psi_kd)
print("F_max: ", F_max)
print("Tau_max: ", Tau_max)

#################################################
#          Uncertainty Parameters
#################################################
UNCERTAINTY_PARAMETERS = False
if UNCERTAINTY_PARAMETERS:
	alpha = 0.2;                                    # uncertainty parameter
	l1 = 0.85*(1+2*alpha*np.random.rand()-alpha)    # Distance between fulcrum 
													# and the head , m
	l2 = 0.3048*(1+2*alpha*np.random.rand()-alpha)  # Distance between the fulcrum
													# and end of Whirlybird's tail, m
	m1 = 0.891*(1+2*alpha*np.random.rand()-alpha)   # Mass of whirlybird head, kg
	m2 = 1*(1+2*alpha*np.random.rand()-alpha)       # Mass of counter weight, kg
	d = 0.178*(1+2*alpha*np.random.rand()-alpha)    # Crossbar Lengh, m
	h = 0.65*(1+2*alpha*np.random.rand()-alpha)     # Post Height, m
	r = 0.12*(1+2*alpha*np.random.rand()-alpha)     # Propeller Radius, m
	Jx = 0.0047*(1+2*alpha*np.random.rand()-alpha)  # , kg-m**2
	Jy = 0.0014*(1+2*alpha*np.random.rand()-alpha)  # , kg-m**2
	Jz = 0.0041*(1+2*alpha*np.random.rand()-alpha)  # , kg-m**2

