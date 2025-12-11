# ROS Space Invaders

## Prerequisites & Dependencies

  * **ROS Noetic**
  * **Python 3**
  * **Pygame**

### Install Pygame

To install Pygame, run the following command: `pip install pygame`

## Installation & Setup

1.  **Clone/Copy** the package into your catkin workspace (e.g., **~/catkin_ws/src/space_invaders_ros**).
2.  **Build the workspace** to generate message and service headers:  
    * `cd ~/catkin_ws` (or `roscd` if previously configured)  
    * `catkin_make`  
    * `source devel/setup.bash`

3.  **Make scripts executable**:  
    * `chmod +x src/space_invaders_ros/src/*.py`

## How to Run (Launch File)

The launch file **game.launch** starts the Game Node, Control Node, User Info Node, and Result Node simultaneously.

### Basic Launch

Start the game with default settings (Purple Ship (color 2), "Player1"):

Command to run the project:
* `roslaunch space_invaders_ros game.launch`

### Custom Launch (Change Color)

You can customize the player via terminal arguments without editing code:

  * **my_color**: **1** (Red), **2** (Purple - Default), **3** (Blue).

Command to run the project with custom color (blue in this case):
* `roslaunch space_invaders_ros game.launch my_color:=3`

## How to Play

### 1\. The Welcome Phase (Phase 1)

  * The game starts with a black screen saying **"WAITING FOR USER INFO..."**.
  * The **info_user** node should automatically send your data.
  * You can also manually adjust the difficulty during this phase using a ROS Service.

### 2\. The Game Phase (Phase 2)

  * **Controls:** Use the **Arrow Keys** to move and **Spacebar** to shoot.
  * **Objective:** Destroy aliens to gain points. Avoid collision.
  * **HUD:**
      * **Left:** Score & Lives.
      * **Right:** User Profile (Name, Username, Age).

### 3\. The End Phase (Phase 3)

  * When lives reach 0, the game displays **"GAME OVER"**.
  * The final score is published to the **result_node** and printed in the terminal.
  * Close the window to shut down all ROS nodes.

## Node Architecture & Communication

### 1\. **game_node.py** (Main Node)

  * **Role:** Runs the Pygame loop, renders graphics, and handles game logic.
  * **Subscribers:**
      * **/keyboard_control** (**std_msgs/String**): Receives "UP", "DOWN", "LEFT", "RIGHT", and "SHOOT".
      * **/user_information** (**space_invaders_ros/user_msg**): Receives Name, Username, and Age to start the game.
  * **Publishers:**
      * **/result_information** (**std_msgs/Int64**): Publishes final score on Game Over.
  * **Services:**
      * **difficulty** (**SetGameDifficulty**): Changes spawn rate. Only works in Phase 1.
      * **user_score** (**GetUserScore**): Returns current score on demand.
  * **Parameters:**
      * **change_player_color** (int): Sets ship color.
      * **user_name** (string): Sets display name.

### 2\. **control_node.py**

  * **Role:** Captures raw keyboard input and converts it to ROS messages.
  * **Publishes:** **/keyboard_control**.

### 3\. **info_user.py**

  * **Role:** Publishes user metadata (Name, Username, and Age) to transition the game from Phase 1 to Phase 2.
  * **Publishes:** **/user_information**.

### 4\. **result_node.py**

  * **Role:** Listens for the game over signal.
  * **Subscribes:** **/result_information**.

## Services

You can interact with the running game using ROS Services from a separate terminal.

**Change Difficulty (Only works in Phase 1):**

  * Set to Hard
    * `rosservice call /difficulty "change_difficulty: 'hard'"`
  * Set to Medium
    * `rosservice call /difficulty "change_difficulty: 'medium'"`
  * Set to Easy
    * `rosservice call /difficulty "change_difficulty: 'easy'"`