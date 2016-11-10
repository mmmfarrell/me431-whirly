import numpy as np

# System Parameters

g = 9.81               # Gravity, m/s**2
l1 = 0.85            # Distance between fulcrum and the head , m
l2 = 0.3048          # Distance between the fulcrum and end of Whirlybird's tail, m
m1 = 0.891             # Mass of whirlybird head, kg
m2 = 1                 # Mass of counter weight, kg
d = 0.178              # Crossbar Lengh, m
h = 0.65               # Post Height, m
r = 0.12               # Propeller Radius, m
Jx = 0.0047            # , kg-m**2
Jy = 0.0014            # , kg-m**2
Jz = 0.0041            # , kg-m**2
km = 0.0546            # , N/PWM
sigma_gyro = 8.7266e-5 # , rad
sigma_pixel = 0.05     # , pixel

# Initial Conditions
phi0 =   0.0*np.pi/180 # ,rads
theta0 = 0.0*np.pi/180 # ,rads
psi0 = 0.0*np.pi/180   # ,rads
phidot0 = 0.0          # ,rads/s
thetadot0 = 0.0        # ,rads/s
psidot0 = 0.0          # ,rads/s

# Simulation parameters
Ts = 0.01                # Time step

# The following parameters are used in the 
# simulation to model bouncing when the whirlybird
# hits its physical limits.
theta_limit = 0.785398     # Max pitch state, rads
psi_limit = 1.5708         # Max yaw state, rads
phi_limit = 1.309          # Max roll state, rads


