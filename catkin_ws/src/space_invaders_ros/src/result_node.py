#!/usr/bin/env python3
import rospy
from std_msgs.msg import Int64
from space_invaders_ros.msg import user_msg
from space_invaders_ros.srv import GetUserScore

class ResultNode(object):
    def __init__(self):
        self.username = "Unknown"
        
        self.sub_user = rospy.Subscriber('user_information', user_msg, self.user_callback)
        self.sub_res = rospy.Subscriber('result_information', Int64, self.result_callback)
        
    def user_callback(self, msg):
        self.username = msg.username
        
    def result_callback(self, msg):
        score = msg.data
        print("\n" + "="*20)
        print("GAME OVER - RESULT REPORT")
        print(f"Player: {self.username}")
        print(f"Final Score: {score}")
        
        rospy.wait_for_service('user_score')
        try:
            get_score = rospy.ServiceProxy('user_score', GetUserScore)
            resp = get_score(self.username)
            print(f"Score verification via Service: {resp.score}")
        except rospy.ServiceException as e:
            print(f"Service call failed: {e}")
        print("="*20 + "\n")

    def main(self):
        rospy.spin()

if __name__ == "__main__":
    try:
        rospy.init_node("result_node")
        node = ResultNode()
        rospy.loginfo("Result Node Started")
        node.main()
    except rospy.ROSInterruptException:
        pass