;; Auto-generated. Do not edit!


(when (boundp 'space_invaders_ros::GetUserScore)
  (if (not (find-package "SPACE_INVADERS_ROS"))
    (make-package "SPACE_INVADERS_ROS"))
  (shadow 'GetUserScore (find-package "SPACE_INVADERS_ROS")))
(unless (find-package "SPACE_INVADERS_ROS::GETUSERSCORE")
  (make-package "SPACE_INVADERS_ROS::GETUSERSCORE"))
(unless (find-package "SPACE_INVADERS_ROS::GETUSERSCOREREQUEST")
  (make-package "SPACE_INVADERS_ROS::GETUSERSCOREREQUEST"))
(unless (find-package "SPACE_INVADERS_ROS::GETUSERSCORERESPONSE")
  (make-package "SPACE_INVADERS_ROS::GETUSERSCORERESPONSE"))

(in-package "ROS")





(defclass space_invaders_ros::GetUserScoreRequest
  :super ros::object
  :slots (_username ))

(defmethod space_invaders_ros::GetUserScoreRequest
  (:init
   (&key
    ((:username __username) "")
    )
   (send-super :init)
   (setq _username (string __username))
   self)
  (:username
   (&optional __username)
   (if __username (setq _username __username)) _username)
  (:serialization-length
   ()
   (+
    ;; string _username
    4 (length _username)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _username
       (write-long (length _username) s) (princ _username s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _username
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _username (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass space_invaders_ros::GetUserScoreResponse
  :super ros::object
  :slots (_score ))

(defmethod space_invaders_ros::GetUserScoreResponse
  (:init
   (&key
    ((:score __score) 0)
    )
   (send-super :init)
   (setq _score (round __score))
   self)
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:serialization-length
   ()
   (+
    ;; int64 _score
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _score
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _score (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _score) (= (length (_score . bv)) 2)) ;; bignum
              (write-long (ash (elt (_score . bv) 0) 0) s)
              (write-long (ash (elt (_score . bv) 1) -1) s))
             ((and (class _score) (= (length (_score . bv)) 1)) ;; big1
              (write-long (elt (_score . bv) 0) s)
              (write-long (if (>= _score 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _score s)(write-long (if (>= _score 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _score
#+(or :alpha :irix6 :x86_64)
      (setf _score (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _score (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass space_invaders_ros::GetUserScore
  :super ros::object
  :slots ())

(setf (get space_invaders_ros::GetUserScore :md5sum-) "ce20595763f2770f6e27a12a2546995d")
(setf (get space_invaders_ros::GetUserScore :datatype-) "space_invaders_ros/GetUserScore")
(setf (get space_invaders_ros::GetUserScore :request) space_invaders_ros::GetUserScoreRequest)
(setf (get space_invaders_ros::GetUserScore :response) space_invaders_ros::GetUserScoreResponse)

(defmethod space_invaders_ros::GetUserScoreRequest
  (:response () (instance space_invaders_ros::GetUserScoreResponse :init)))

(setf (get space_invaders_ros::GetUserScoreRequest :md5sum-) "ce20595763f2770f6e27a12a2546995d")
(setf (get space_invaders_ros::GetUserScoreRequest :datatype-) "space_invaders_ros/GetUserScoreRequest")
(setf (get space_invaders_ros::GetUserScoreRequest :definition-)
      "string username
---
int64 score
")

(setf (get space_invaders_ros::GetUserScoreResponse :md5sum-) "ce20595763f2770f6e27a12a2546995d")
(setf (get space_invaders_ros::GetUserScoreResponse :datatype-) "space_invaders_ros/GetUserScoreResponse")
(setf (get space_invaders_ros::GetUserScoreResponse :definition-)
      "string username
---
int64 score
")



(provide :space_invaders_ros/GetUserScore "ce20595763f2770f6e27a12a2546995d")


