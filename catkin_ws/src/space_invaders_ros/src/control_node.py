#!/usr/bin/env python3
import rospy
import sys, select, termios, tty
from std_msgs.msg import String

class ControlNode(object):
    def __init__(self):
        self.pub = rospy.Publisher('keyboard_control', String, queue_size = 10)
        self.settings = termios.tcgetattr(sys.stdin)
        self.rate = rospy.Rate(20)

    def get_key(self):
        tty.setraw(sys.stdin.fileno())
        rlist, _, _ = select.select([sys.stdin], [], [], 0.1)
        if rlist:
            key = sys.stdin.read(1)
            if key == '\x1b':
                key += sys.stdin.read(2)
        else:
            key = ''
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, self.settings)
        return key

    def main(self):
        print("CONTROL NODE...")
        print("Use Arrow Keys to move. Press 'q' to quit.")
        
        while not rospy.is_shutdown():
            key = self.get_key()
            command = ""
            
            if key == '\x1b[A': command = "UP"
            elif key == '\x1b[B': command = "DOWN"
            elif key == '\x1b[C': command = "RIGHT"
            elif key == '\x1b[D': command = "LEFT"
            elif key == ' ': command = "SHOOT"
            elif key == 'q': break

            if command:
                self.pub.publish(command)
                
            self.rate.sleep()

if __name__ == "__main__":
    try:
        rospy.init_node("control_node")
        node = ControlNode()
        node.main()
    except rospy.ROSInterruptException:
        pass