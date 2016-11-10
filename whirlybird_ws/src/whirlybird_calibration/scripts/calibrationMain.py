#!/usr/bin/env python

import rospy
import param as P
import numpy as np 
import matplotlib.pyplot as plt
from whirlybird_msgs.msg import Command
from whirlybird_msgs.msg import Whirlybird 
from slider_input import Sliders 

# When a new message is sent to the topic 'whirlybird',
# this function will run.
# The function unpacks the message and prints the data.
def callback(data):
	phi = data.roll
	theta = data.pitch
	psi = data.yaw
	# print('theta',theta)
	PWM=user_input.getInputValues()[0]
	if PWM > 0.5:
		PWM = 0.5
	elif PWM < 0:
		PWM = 0

	command.left_motor = PWM
	command.right_motor = PWM
	command_pub.publish(command)

	# Calculate time elapsed since last function call, s
	global prev_time
	now = rospy.Time.now()
	dt = (now-prev_time).to_sec()
	prev_time = now               # Update prev_time , time
	F_e = (P.m1*P.l1-P.m2*P.l2)*P.g*np.cos(theta)/P.l1
	print('theta: ', theta*180.0/np.pi)
	#print("km: ",F_e/(2.0*PWM) )
	print("F_e: ", F_e)



if __name__ == '__main__':

	# Instantiate slider object
	user_input = Sliders()

	# Create the node
	rospy.init_node('whirlybird_calibration', anonymous=False)

	# Subscriber to topic 'whirlybird'
	rospy.Subscriber('whirlybird', Whirlybird, callback)

	# Publisher to topic 'command'
	command_pub = rospy.Publisher('command',Command,queue_size=5)

	# Command Message object
	command=Command()

	# Used to calculate the time between the callback function calls.
	global prev_time 
	prev_time= rospy.Time.now()            # Gets the current time, time

	try:

		# Keep node alive until ROS is shutdown.
		while not rospy.is_shutdown():			
			plt.show(block=True)
		# The ROSInterruptException is raised if the program is killed
		# while sleeping with rospy.sleep() or rospy.rate.sleep()
	except rospy.ROSInterruptException:
		pass
