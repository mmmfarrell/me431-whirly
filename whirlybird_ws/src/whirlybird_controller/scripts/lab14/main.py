import time
import sys
import numpy as np 
import matplotlib.pyplot as plt 
import param as P 
from signal_generator import Signals
from sim_plot import plotGenerator 
from controllerObsD import controllerObsD

# The Animation.py file is kept in the parent directory,
# so the parent directory path needs to be added.
sys.path.append('..')
from dynamics import WhirlybirdDynamics
from animation import WhirlybirdAnimation

t_start = 0.0   # Start time of simulation
t_end = 40.0    # End time of simulation
t_Ts = P.Ts     # Simulation time step
t_elapse = 0.1  # Simulation time elapsed between each iteration
t_pause = 0.01  # Pause between each iteration


sig_gen = Signals()                   # Instantiate Signals class
plotGen = plotGenerator()             # Instantiate plotGenerator class
ctrl = controllerObsD()               # Instantiate controllerPD class
simAnimation = WhirlybirdAnimation()  # Instantiate Animate class
dynam = WhirlybirdDynamics()          # Instantiate Dynamics class

t = t_start               # Declare time variable to keep track of simulation time elapsed

# Converts force and torque into the left and 
# right forces produced by the propellers.
def convertForces(u):
	F = u[0]         # Force, N
	tau = u[1]       # Torque, Nm
	# Convert Force and Torque to fl and fr
	# fl is the force created by the left propeller
	# fr is the force created by the right propeller
	ul = 1.0/(P.km*2.0)*(F+tau/P.d)
	ur = 1.0/(P.km*2.0)*(F-tau/P.d)
	u = saturatePWM([ul,ur])
	return u

# saturate the PWM to ensure that they are within the 
# range 0-1
def saturatePWM(u):
	ul = u[0]
	ur = u[1]

	ul = 1 if ul > 1 else 0 if ul < 0 else ul
	ur = 1 if ur > 1 else 0 if ur < 0 else ur
	return [ul,ur]


while t < t_end:

    # Get referenced inputs from signal generators
	ref_input = sig_gen.getRefInputs(t) 

	# The dynamics of the model will be propagated in time by t_elapse 
	# at intervals of t_Ts.
	t_temp = t +t_elapse
	while t < t_temp:
		
		states = dynam.Outputs()             # Get current states
		u = ctrl.getForces(ref_input,states) # Calculate the forces
		u = convertForces(u)                 # Convert force and torque to fl and fr		
		dynam.propagateDynamics([x*P.km for x in u]) # Propagate the dynamics of the model in time
		t = round(t +t_Ts,2)                 # Update time elapsed

	# plt.figure(simAnimation.fig.number) # Switch current figure to animation figure
	# simAnimation.drawWhirlybird(        # Update animation with current user input
	# 	dynam.Outputs())
	# plt.pause(0.0001)

	# Organizes the new data to be passed to plotGen
	new_data = [[ref_input[0],states[1]],  # theta_r/theta
				[states[0]],               # phi
				[ref_input[1],states[2]],  # psi_r/psi
			    [u[0],u[1]]]               # u_l,u_r

	plotGen.updateDataHistory(t, new_data)

	# plt.figure(plotGen.fig.number)		# Switch current figure to plotGen figure
	# plotGen.update_plots()              # Update the plot
	# plt.pause(0.0001) 
	
	# time.sleep(t_pause)


plt.figure(plotGen.fig.number)		
plotGen.update_plots()
plt.pause(0.001)

# Keeps the program from closing until the user presses a button.
print('done')
raw_input()


