#!/usr/bin/env python
import rospy
import numpy as np
import matplotlib.pyplot as plt 
import lab10.param as P 
from whirlybird_msgs.msg import Command
from whirlybird_msgs.msg import Whirlybird
from signal_generator import Signals
from slider_input import Sliders

# from lab7.controllerPD import controllerPD as ctrl
# from lab8.controllerPD import controllerPD as ctrl
#from lab10.controllerPID import controllerPID as ctrl 
# from lab11.controllerSS import controllerSS as ctrl
from lab12.controllerSSI import controllerSSI as ctrl
# from lab13.controllerObs import controllerObs as ctrl
# from lab14.controllerObsD import controllerObsD as ctrl

# If SLIDERS is false, then the input will be generated from 
# from the signal generators.
SLIDERS = True


# Converts force and torque into the left and 
# right forces produced by the propellers.
def convertForces(u):
    F = u[0]         # Force, N
    # rospy.logwarn(str(F))
    tau = u[1]       # Torque, Nm
    # rospy.logwarn(str(tau))
    
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

    ul = .6 if ul > .6 else 0 if ul < 0 else ul
    ur = .6 if ur > .6 else 0 if ur < 0 else ur
    return [ul,ur]

# When a new message is sent to the topic 'whirlybird',
# this function will run.
# The function unpacks the message and prints the data.
def callback(data):
    phi = data.roll
    theta = data.pitch
    psi = data.yaw

    states = [phi,theta,psi]

    # Calculate time elapsed since last function call, s
    global prev_time
    now = rospy.Time.now()
    dt = (now-prev_time).to_sec()
    prev_time = now               # Update prev_time , time
    global sim_time
    sim_time = round(sim_time+dt,6)

    # Get referenced inputs from signal generators or sliders
    ref_input = usr_input.getInputValues() if SLIDERS else usr_input.getRefInputs(sim_time)
    # ref_input = [0.0, 0.0]
    u = ctrl.getForces(ref_input,states) # Calculate the forces

    u = convertForces(u)                 # Convert forces to PWM



    command.left_motor = u[0]
    command.right_motor = u[1]
    command_pub.publish(command)



if __name__ == '__main__':

    usr_input = Sliders() if SLIDERS else Signals()

    ctrl = ctrl()                         # Instantiate controllerPD class

    # Create the node
    rospy.init_node('whirlybird_controller', anonymous=False)

    # Subscriber to topic 'whirlybird'
    rospy.Subscriber('whirlybird', Whirlybird, callback)

    # Publisher to topic 'command'
    command_pub = rospy.Publisher('command',Command,queue_size=5)

    # Command Message object
    command=Command()

    # Used to calculate the time between the callback function calls.
    global prev_time 
    prev_time= rospy.Time.now()            # Gets the current time, time
    global sim_time
    sim_time = 0

    try:

        # Keep node alive until ROS is shutdown.
        while not rospy.is_shutdown():
            plt.show(block=True) if SLIDERS else rospy.spin()
                
        # The ROSInterruptException is raised if the program is killed
        # while sleeping with rospy.sleep() or rospy.rate.sleep()
    except rospy.ROSInterruptException:
        pass
