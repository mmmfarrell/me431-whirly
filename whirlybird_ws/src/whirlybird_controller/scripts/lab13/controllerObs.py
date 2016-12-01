import sys
import numpy as np 
import param as P
import rospy

class controllerObs:
	''' This class inherits other controllers in order to organize multiple controllers.'''

	def __init__(self):
		# Instantiates the SS_ctrl object
		self.ObsCtrl_long = Obs_ctrl_long(P.K_long,P.ki_long,P.L_long, P.theta0,P.F_max)
		self.ObsCtrl_lat = Obs_ctrl_lat(P.K_lat,P.ki_lat,P.L_lat,P.phi0,P.psi0,P.Tau_max)
		# K is the closed loop SS gains
		# ki is the integrator gain
		# y0 is the initial position of the state

	def getForces(self,y_r,y):
		# y_r is the referenced input
		# y is the current state  
		theta_r = y_r[0]
		psi_r = y_r[1]

		phi = y[0]
		theta = y[1]
		psi = y[2]

		F = self.ObsCtrl_long.Obs_loop(theta_r,theta) # Calculate the force output
		# rospy.logwarn(str(theta_r))
		# rospy.logwarn(str(theta))

		Tau = self.ObsCtrl_lat.Obs_loop(psi_r,psi,phi) # Calculate the torque output

		# rospy.logwarn(str(F))

		# Tau = 0.0

		return [F, Tau]

	def getObsStates(self):
		xhat_long = self.ObsCtrl_long.getObsStates()
		xhat_lat = self.ObsCtrl_lat.getObsStates()

		xhat = np.matrix([[0.0],  # phi 
					 [0.0],  # psi
					 [0.0],  # phidot
					 [0.0],  # psi
					 [0.0],  # phidot					 
					 [0.0]]) # psi dot
		return xhat


class Obs_ctrl_long:
	def __init__(self,K,ki,L,theta0,limit):
		self.xhat = np.matrix([[0.0],  # theta 
							 [0.0]]) # theta dot
		# self.thetadot = 0.0          # Difference term
		self.F_d1 = 0.0                # Delayed input 
		self.integrator = 0.0        # Integrator term
		# self.theta_d1 = theta0       # Last theta term
		self.error_d1 = 0.0
		self.K = K                   # Closed loop SS gains
		self.ki = ki                 # Integrator gain
		self.L = L                     # Obs Gain
		self.limit = limit           # Maxiumum force
		self.input_disturbance = 0.0 #0.5 # Input disturbance, N


	def Obs_loop(self,theta_r,theta):

		# Observer
		N = 10
		for i in range(N):
			self.xhat += P.Ts/N*(P.A_long*self.xhat + \
			P.B_long*(self.F_d1)+\
			self.L*(np.matrix([[theta]]) - P.C_long*self.xhat))      

		error = theta_r-self.xhat.item(0)

		self.integrator += (P.Ts/2.0)*(error+self.error_d1)

		# Update delays
		self.error_d1 = error

		# comput the equilibrium force F_e
		F_e = 5.223

		# Compute the state feedback controller
		F_unsat = F_e - self.K*self.xhat - self.ki*self.integrator 

		# Input disturbance. To motivate next weeks lab (disturbance observer)
		F_unsat = F_unsat + self.input_disturbance

		F_sat = self.saturate(F_unsat)

		self.F_d1 = F_sat 

		if self.ki !=0:
			self.integrator += P.Ts/self.ki*(F_sat-F_unsat)

		return F_sat.item(0)

	def getObsStates(self):
		return self.xhat.tolist()

	  # error = theta_r-theta
	  # # rospy.logwarn(str(error))

	  # # Update Differentiator
	  # a1 = (2*P.sigma - P.Ts)/(2*P.sigma+P.Ts)
	  # a2 = 2/(2*P.sigma+P.Ts)

	  # self.thetadot = a1*self.thetadot + a2*(theta-self.theta_d1)

	  # self.integrator += (P.Ts/2.0)*(error+self.error_d1)

	  # # Update delays
	  # self.theta_d1 = theta 
	  # self.error_d1 = error

	  # # Construct the state
	  # x = np.matrix([[theta],
	  #                [self.thetadot]])

	  # # comput the equilibrium force F_e
	  # F_e = 5.223

	  # # Compute the state feedback controller
	  # F_unsat = F_e-self.K*x -self.ki*self.integrator + self.input_disturbance

	  # F_sat = self.saturate(F_unsat)

	  # if self.ki !=0:
	  #   self.integrator += P.Ts/self.ki*(F_sat-F_unsat)
	  # return F_sat.item(0)

	def saturate(self,u):
		if abs(u) > self.limit:
			u = self.limit*np.sign(u)
		return u 

class Obs_ctrl_lat:
	def __init__(self,K,ki,L,phi0,psi0,limit):
		self.xhat = np.matrix([[0.0],  # phi 
							 [0.0],  # psi
							 [0.0],  # phidot
							 [0.0]]) # psi dot
		self.Tau_d1 = 0.0                # Delayed input 
		self.integrator=0.0            # Integrator term
		self.error_d1 = 0.0            # Delayed error
		self.limit = limit             # Max torque
		self.K = K                     # SS gains
		self.ki = ki                     # Integrator gain
		self.L = L                     # Obs Gain
		self.input_disturbance= 0.0 #0.05    # Input disturbance
		# self.phidot = 0.0              # Difference term
		# self.psidot = 0.0          # Difference term
		# self.integrator = 0.0        # Integrator term
		# self.phi_d1 = phi0               # Last z term
		# self.psi_d1 = psi0       # Last theta term
		# self.error_d1 = 0.0
		# self.K = K                   # Closed loop SS gains
		# self.ki = ki                 # Integrator gain
		# self.limit = limit           # Maxiumum force
		# self.input_disturbance = 0.0 #0.5 # Input disturbance, N


	def Obs_loop(self,psi_r,psi,phi):
		# Observer
		N = 10
		for i in range(N):
			self.xhat += P.Ts/N*(P.A_lat*self.xhat + \
				P.B_lat*(self.Tau_d1)+\
				self.L*(np.matrix([[phi],[psi]]) - P.C_lat*self.xhat))      

		error = psi_r-self.xhat.item(1)

		self.integrator += (P.Ts/2.0)*(error+self.error_d1)

		# Update delays
		self.error_d1 = error

		# Compute the state feedback controller
		Tau_unsat = -self.K*self.xhat - self.ki*self.integrator 

		# Input disturbance. To motivate next weeks lab (disturbance observer)
		Tau_unsat = Tau_unsat + self.input_disturbance

		Tau_sat = self.saturate(Tau_unsat)

		self.Tau_d1 = Tau_sat 

		if self.ki !=0:
			self.integrator += P.Ts/self.ki*(Tau_sat-Tau_unsat)

		return Tau_sat.item(0)

		# error = psi_r-psi

		# # Update Differentiator
		# a1 = (2*P.sigma - P.Ts)/(2*P.sigma+P.Ts)
		# a2 = 2/(2*P.sigma+P.Ts)

		# self.phidot = a1*self.phidot + a2*(phi-self.phi_d1)
		# self.psidot = a1*self.psidot + a2*(psi-self.psi_d1)

		# self.integrator += (P.Ts/2.0)*(error+self.error_d1)

		# # Update delays
		# self.phi_d1 = phi
		# self.psi_d1 = psi 
		# self.error_d1 = error

		# # Construct the state
		# x = np.matrix([[phi],
		# 			 [psi],
		# 			 [self.phidot],
		# 			 [self.psidot]])

		# # Compute the state feedback controller
		# Tau_unsat = -self.K*x -self.ki*self.integrator + self.input_disturbance

		# Tau_sat = self.saturate(Tau_unsat)

		# if self.ki !=0:
		# 	self.integrator += P.Ts/self.ki*(Tau_sat-Tau_unsat)
		# return Tau_sat.item(0)

	def getObsStates(self):
		return self.xhat.tolist()

	def saturate(self,u):
		if abs(u) > self.limit:
			u = self.limit*np.sign(u)
		return u







