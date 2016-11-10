import sys
import numpy as np 
import param as P

class controllerSSI:
  ''' This class inherits other controllers in order to organize multiple controllers.'''

  def __init__(self):
      # Instantiates the SS_ctrl object
      self.SSICtrl_long = SSI_ctrl_long(P.K_long,P.ki_long,P.theta0,P.F_max)
      self.SSICtrl_lat = SSI_ctrl_lat(P.K_lat,P.ki_lat,P.phi0,P.psi0,P.Tau_max)
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
      
      F = self.SSICtrl_long.SSI_loop(theta_r,theta) # Calculate the force output

      Tau = self.SSICtrl_lat.SSI_loop(psi_r,psi,phi) # Calculate the torque output

      return [F, Tau]


class SSI_ctrl_long:
  def __init__(self,K,ki,theta0,limit):
      self.thetadot = 0.0          # Difference term
      self.integrator = 0.0        # Integrator term
      self.theta_d1 = theta0       # Last theta term
      self.error_d1 = 0.0
      self.K = K                   # Closed loop SS gains
      self.ki = ki                 # Integrator gain
      self.limit = limit           # Maxiumum force
      self.input_disturbance = 0.0 #0.5 # Input disturbance, N


  def SSI_loop(self,theta_r,theta):

      error = theta_r-theta

      # Update Differentiator
      a1 = (2*P.sigma - P.Ts)/(2*P.sigma+P.Ts)
      a2 = 2/(2*P.sigma+P.Ts)

      self.thetadot = a1*self.thetadot + a2*(theta-self.theta_d1)

      self.integrator += (P.Ts/2.0)*(error+self.error_d1)

      # Update delays
      self.theta_d1 = theta 
      self.error_d1 = error

      # Construct the state
      x = np.matrix([[theta],
                     [self.thetadot]])

      # comput the equilibrium force F_e
      F_e = 5.223

      # Compute the state feedback controller
      F_unsat = F_e-self.K*x -self.ki*self.integrator + self.input_disturbance

      F_sat = self.saturate(F_unsat)

      if self.ki !=0:
        self.integrator += P.Ts/self.ki*(F_sat-F_unsat)
      return F_sat.item(0)

  def saturate(self,u):
    if abs(u) > self.limit:
      u = self.limit*np.sign(u)
    return u 


class SSI_ctrl_lat:
  def __init__(self,K,ki,phi0,psi0,limit):
      self.phidot = 0.0              # Difference term
      self.psidot = 0.0          # Difference term
      self.integrator = 0.0        # Integrator term
      self.phi_d1 = phi0               # Last z term
      self.psi_d1 = psi0       # Last theta term
      self.error_d1 = 0.0
      self.K = K                   # Closed loop SS gains
      self.ki = ki                 # Integrator gain
      self.limit = limit           # Maxiumum force
      self.input_disturbance = 0.0 #0.5 # Input disturbance, N


  def SSI_loop(self,psi_r,psi,phi):

      error = psi_r-psi

      # Update Differentiator
      a1 = (2*P.sigma - P.Ts)/(2*P.sigma+P.Ts)
      a2 = 2/(2*P.sigma+P.Ts)

      self.phidot = a1*self.phidot + a2*(phi-self.phi_d1)
      self.psidot = a1*self.psidot + a2*(psi-self.psi_d1)

      self.integrator += (P.Ts/2.0)*(error+self.error_d1)

      # Update delays
      self.phi_d1 = phi
      self.psi_d1 = psi 
      self.error_d1 = error

      # Construct the state
      x = np.matrix([[phi],
                     [psi],
                     [self.phidot],
                     [self.psidot]])

      # Compute the state feedback controller
      Tau_unsat = -self.K*x -self.ki*self.integrator + self.input_disturbance

      Tau_sat = self.saturate(Tau_unsat)

      if self.ki !=0:
        self.integrator += P.Ts/self.ki*(Tau_sat-Tau_unsat)
      return Tau_sat.item(0)

  def saturate(self,u):
    if abs(u) > self.limit:
      u = self.limit*np.sign(u)
    return u







