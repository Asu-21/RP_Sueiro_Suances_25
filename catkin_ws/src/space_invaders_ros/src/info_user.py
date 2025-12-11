#!/usr/bin/env python3
import rospy
from space_invaders_ros.msg import user_msg

class InfoUser(object):
    def __init__(self):
        self.pub = rospy.Publisher('user_information', user_msg, queue_size=10)
        
    def main(self):
        rospy.sleep(1)
        
        print("ENTER USER INFORMATION...")
        name = input("Enter your Name: ")
        username = input("Enter your Username: ")
        try:
            age = int(input("Enter your Age: "))
        except ValueError:
            age = 0

        msg = user_msg()
        msg.name = name
        msg.username = username
        msg.age = age

        rospy.loginfo(f"Sending User Info: {username}")
        self.pub.publish(msg)
        
        rospy.sleep(1)

if __name__ == "__main__":
    try:
        rospy.init_node("info_user")
        node = InfoUser()
        node.main()
    except rospy.ROSInterruptException:
        pass