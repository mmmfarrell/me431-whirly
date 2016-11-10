
import sys
import numpy as np 
import param as P
import math
import rospy
from whirlybird_msgs.msg import MyStates

class controllerPID:

	def __init__(self):
		# Instantiates the PID_ctrl object
		# Long Control
		self.thetaCtrl = thetaPID_ctrl(P.theta_kp,P.theta_kd,P.theta_ki,P.theta0,0.6*P.F_max)
		# Lateral Control
		self.psiCtrl = psiPID_ctrl(P.psi_kp,P.psi_kd,P.psi_ki,P.psi0,P.psi_max)
		self.phiCtrl = phiPD_ctrl(P.phi_kp,P.phi_kd,P.phi0,0.6*P.Tau_max) 

		self.my_pub = rospy.Publisher('/my_states', MyStates, queue_size=10 )
		self.my_state = MyStates()
		# kp is the proportional gain
		# kd is the derivative gain
		# ki is the integral gain
		# y0 is the initial position of the state

	def getForces(self,y_r,y):
		# y_r is the referenced input
		# y is the current state  
		# longitudinal
		theta_r = y_r[0]
		# lateral
		psi_r = y_r[1]
		# states
		phi = y[0]
		theta = y[1]
		psi = y[2]

		
		# longitudinal
		# for now add the equilibrium force and saturate in the control loop (line 74)
		F = self.thetaCtrl.thetaPID_loop(theta_r,theta) # Calculate the force output
		#F_eq = (P.m1*P.l1 - P.m2*P.l2)*(P.g/P.l1)*cos(theta)
		#F = F_tilde + F_eq
		# lateral
		phi_r = self.psiCtrl.psiPID_loop(psi_r,psi)
		
		# phi_r = y_r[1]
		Tau = self.phiCtrl.phiPD_loop(phi_r,phi)

		# custom output
		self.my_state.roll = phi
		self.my_state.pitch = theta
		self.my_state.yaw = psi

		self.my_state.roll_d = phi_r
		self.my_state.pitch_d = theta_r
		self.my_state.yaw_d = psi_r

		self.my_state.Force = F
		self.my_state.Tau = Tau

		#self.my_pub.publish(self.my_state)

		return [F, Tau]


class thetaPID_ctrl:
	def __init__(self,kp,kd,ki,theta0,limit):
		self.differentiator = 0.0    # Difference term
		self.integrator = 0.0
		self.theta_d1 = theta0       # Delayed y output
		self.error_d1 = 0.0          # Delayed error
		self.kp = kp                 # Proportional control gain
		self.kd = kd 				# Derivative control gain
		self.ki = ki                # Integral control gain
		self.limit = limit           # Maxiumum force


	def thetaPID_loop(self,theta_r,theta):
		# Compute the current error
		error = theta_r - theta  
		# rospy.logwarn(str(error))

		# UPIDate Differentiator
		a1 = (2*P.sigma - P.Ts)/(2*P.sigma+P.Ts)
		a2 = 2/(2*P.sigma+P.Ts)
		self.differentiator = a1*self.differentiator \
		                  + a2*(theta -self.theta_d1)
		# Update Integrator
		if abs(self.differentiator) <0.05:
			self.integrator = self.integrator + (P.Ts/2.0)*(error+self.error_d1)
			#rospy.logwarn(str(self.integrator))

		# UPIDate error_d1
		self.error_d1 = error
		self.theta_d1 = theta 

		# PID Control to calculate T
		F_eq = (P.m1*P.l1 - P.m2*P.l2)*(P.g/P.l1)*math.cos(theta)
		# rospy.logwarn(str(F_eq))

		F_unsat = self.kp*error - self.kd*self.differentiator + self.ki*self.integrator + F_eq


		F_sat = self.saturate(F_unsat)

		# anti windup
		if self.ki != 0:
			self.integrator += P.Ts/self.ki*(F_sat-F_unsat)

		# return F_sat
		return F_sat 

	def saturate(self,u):
		if abs(u) > self.limit:
			u = self.limit*np.sign(u)
			print 'Force Saturated'
			rospy.logwarn('Force Saturated')
		return u 

class psiPID_ctrl:
	def __init__(self,kp,kd,ki,psi0,limit):
		self.differentiator = 0.0    # Difference term
		self.integrator = 0.0        # Integral term
		self.psi_d1 = psi0               # Delayed y output
		self.error_d1 = 0.0          # Delayed error
		self.kp = kp                 # Proportional control gain
		self.kd = kd                 # Derivative control gain
		self.ki = ki                 # Integral controal gain
		self.limit = limit           # Maximum theta


	def psiPID_loop(self,psi_r,psi):
		# Compute the current error
		error = psi_r - psi  

		# UPIDate Differentiator
		a1 = (2*P.sigma - P.Ts)/(2*P.sigma+P.Ts)
		a2 = 2/(2*P.sigma+P.Ts)
		self.differentiator = a1*self.differentiator \
		                  + a2*(psi -self.psi_d1)

		# Update Integrator
		if abs(self.differentiator) <0.05:#0.05:
			self.integrator = self.integrator + (P.Ts/2.0)*(error+self.error_d1)
			rospy.logwarn(str(self.integrator))

		# UPIDate error_d1
		self.error_d1 = error
		self.psi_d1 = psi 

		# PID Control to calculate T
		phi_r_unsat = self.kp*error - self.kd*self.differentiator + self.ki*self.integrator

		phi_r_sat = self.saturate(phi_r_unsat)

		# if self.ki != 0:
		# 	self.integrator += P.Ts/self.ki*(phi_r_sat-phi_r_unsat)

		return phi_r_unsat

	def saturate(self,u):
		if abs(u) > self.limit:
			u = self.limit*np.sign(u)
		return u   

class phiPD_ctrl:
	def __init__(self,kp,kd,phi0,limit):
		self.differentiator = 0.0    # Difference term
		self.phi_d1 = phi0       # Delayed y output
		self.error_d1 = 0.0          # Delayed error
		self.kp = kp                 # Proportional control gain
		self.kd = kd 					# Derivative control gain
		self.limit = limit           # Maxiumum force

	def phiPD_loop(self,phi_r,phi):
		# Compute the current error
		error = phi_r - phi  

		# UPIDate Differentiator
		a1 = (2*P.sigma - P.Ts)/(2*P.sigma+P.Ts)
		a2 = 2/(2*P.sigma+P.Ts)
		self.differentiator = a1*self.differentiator \
		                  + a2*(phi-self.phi_d1)
		
		# UPIDate error_d1
		self.error_d1 = error
		self.phi_d1 = phi 

		# PID Control to calculate T
		Tau_unsat = self.kp*error - self.kd*self.differentiator 

		Tau_sat = self.saturate(Tau_unsat)

		return Tau_sat

	def saturate(self,u):
		if abs(u) > self.limit:
			u = self.limit*np.sign(u)
			print 'Tau Saturated'
			rospy.logwarn('Tau Saturated')
		return u 
