;; Auto-generated. Do not edit!


(when (boundp 'space_invaders_ros::SetGameDifficulty)
  (if (not (find-package "SPACE_INVADERS_ROS"))
    (make-package "SPACE_INVADERS_ROS"))
  (shadow 'SetGameDifficulty (find-package "SPACE_INVADERS_ROS")))
(unless (find-package "SPACE_INVADERS_ROS::SETGAMEDIFFICULTY")
  (make-package "SPACE_INVADERS_ROS::SETGAMEDIFFICULTY"))
(unless (find-package "SPACE_INVADERS_ROS::SETGAMEDIFFICULTYREQUEST")
  (make-package "SPACE_INVADERS_ROS::SETGAMEDIFFICULTYREQUEST"))
(unless (find-package "SPACE_INVADERS_ROS::SETGAMEDIFFICULTYRESPONSE")
  (make-package "SPACE_INVADERS_ROS::SETGAMEDIFFICULTYRESPONSE"))

(in-package "ROS")





(defclass space_invaders_ros::SetGameDifficultyRequest
  :super ros::object
  :slots (_change_difficulty ))

(defmethod space_invaders_ros::SetGameDifficultyRequest
  (:init
   (&key
    ((:change_difficulty __change_difficulty) "")
    )
   (send-super :init)
   (setq _change_difficulty (string __change_difficulty))
   self)
  (:change_difficulty
   (&optional __change_difficulty)
   (if __change_difficulty (setq _change_difficulty __change_difficulty)) _change_difficulty)
  (:serialization-length
   ()
   (+
    ;; string _change_difficulty
    4 (length _change_difficulty)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _change_difficulty
       (write-long (length _change_difficulty) s) (princ _change_difficulty s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _change_difficulty
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _change_difficulty (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass space_invaders_ros::SetGameDifficultyResponse
  :super ros::object
  :slots (_success ))

(defmethod space_invaders_ros::SetGameDifficultyResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass space_invaders_ros::SetGameDifficulty
  :super ros::object
  :slots ())

(setf (get space_invaders_ros::SetGameDifficulty :md5sum-) "9d6c7c12eefb5ab4ae8ce42c4c512e6f")
(setf (get space_invaders_ros::SetGameDifficulty :datatype-) "space_invaders_ros/SetGameDifficulty")
(setf (get space_invaders_ros::SetGameDifficulty :request) space_invaders_ros::SetGameDifficultyRequest)
(setf (get space_invaders_ros::SetGameDifficulty :response) space_invaders_ros::SetGameDifficultyResponse)

(defmethod space_invaders_ros::SetGameDifficultyRequest
  (:response () (instance space_invaders_ros::SetGameDifficultyResponse :init)))

(setf (get space_invaders_ros::SetGameDifficultyRequest :md5sum-) "9d6c7c12eefb5ab4ae8ce42c4c512e6f")
(setf (get space_invaders_ros::SetGameDifficultyRequest :datatype-) "space_invaders_ros/SetGameDifficultyRequest")
(setf (get space_invaders_ros::SetGameDifficultyRequest :definition-)
      "string change_difficulty
---
bool success
")

(setf (get space_invaders_ros::SetGameDifficultyResponse :md5sum-) "9d6c7c12eefb5ab4ae8ce42c4c512e6f")
(setf (get space_invaders_ros::SetGameDifficultyResponse :datatype-) "space_invaders_ros/SetGameDifficultyResponse")
(setf (get space_invaders_ros::SetGameDifficultyResponse :definition-)
      "string change_difficulty
---
bool success
")



(provide :space_invaders_ros/SetGameDifficulty "9d6c7c12eefb5ab4ae8ce42c4c512e6f")


