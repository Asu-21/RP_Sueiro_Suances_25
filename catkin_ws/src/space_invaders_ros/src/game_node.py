#!/usr/bin/env python3
import rospy
import pygame
import random
from std_msgs.msg import String, Int64
from space_invaders_ros.msg import user_msg
from space_invaders_ros.srv import GetUserScore, GetUserScoreResponse
from space_invaders_ros.srv import SetGameDifficulty, SetGameDifficultyResponse

SCREEN_WIDTH = 650
SCREEN_HEIGHT = 600
FPS = 60
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
PURPLE = (128, 0, 128)
GREEN = (0, 255, 0)
RED = (255, 0, 0)
BLUE = (0, 0, 255)
YELLOW = (255, 255, 0)

class Player(object):
    def __init__(self, color_code):
        self.width = 40
        self.height = 30
        self.x = SCREEN_WIDTH // 2 - self.width // 2
        self.y = SCREEN_HEIGHT - 60
        self.speed = 5
        self.bullets = []
        self.shoot_delay = 0
        self.max_shoot_delay = 10
        self.color = {1: RED, 3: BLUE}.get(color_code, PURPLE)

        self.move_left = False
        self.move_right = False
        self.move_up = False
        self.move_down = False
        self.shoot = False

    def update(self):
        if self.move_left and self.x > 0: self.x -= self.speed
        if self.move_right and self.x < SCREEN_WIDTH - self.width: self.x += self.speed
        if self.move_up and self.y > 0: self.y -= self.speed
        if self.move_down and self.y < SCREEN_HEIGHT - self.height: self.y += self.speed
            
        if self.shoot and self.shoot_delay <= 0:
            self.bullets.append(Bullet(self.x + self.width // 2, self.y, -8))
            self.shoot_delay = self.max_shoot_delay
            self.shoot = False
            
        if self.shoot_delay > 0: self.shoot_delay -= 1
            
        for bullet in self.bullets[:]:
            bullet.update()
            if bullet.y < 0: self.bullets.remove(bullet)
    
    def draw(self, screen):
        pygame.draw.polygon(screen, self.color, [
            (self.x + self.width // 2, self.y),
            (self.x, self.y + self.height),
            (self.x + self.width, self.y + self.height)
        ])
        for bullet in self.bullets: bullet.draw(screen)

class Alien(object):
    def __init__(self, x, y, speed):
        self.width = 30; self.height = 25; self.x = x; self.y = y; self.speed = speed
    def update(self): self.y += self.speed
    def draw(self, screen): pygame.draw.rect(screen, GREEN, (self.x, self.y, self.width, self.height))

class Bullet(object):
    def __init__(self, x, y, speed):
        self.width = 3; self.height = 8; self.x = x; self.y = y; self.speed = speed
    def update(self): self.y += self.speed
    def draw(self, screen):
        color = YELLOW if self.speed < 0 else RED
        pygame.draw.rect(screen, color, (self.x - self.width // 2, self.y, self.width, self.height))

class GameNode(object):
    def __init__(self):
        pygame.init()
        self.screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
        pygame.display.set_caption("ROS Space Invaders")
        self.clock = pygame.time.Clock()
        self.font = pygame.font.Font(None, 36)
        
        self.user_name = rospy.get_param('~user_name', "Unknown")
        self.color_param = rospy.get_param('~change_player_color', 2)
        self.real_name = "Unknown"
        self.user_age = 0
        self.screen_param = "phase1"
        rospy.set_param('~screen_param', self.screen_param)
        self.res_pub = rospy.Publisher('result_information', Int64, queue_size=10)
        self.sub_kb = rospy.Subscriber('keyboard_control', String, self.control_callback)
        self.sub_info = rospy.Subscriber('user_information', user_msg, self.user_info_callback)
        
        self.srv_score = rospy.Service('user_score', GetUserScore, self.handle_get_score)
        self.srv_diff = rospy.Service('difficulty', SetGameDifficulty, self.handle_set_difficulty)

        self.reset_game_logic()
        rospy.loginfo("Welcome phase started.")

    def reset_game_logic(self):
        self.player = Player(self.color_param)
        self.aliens = []
        self.lives = 3
        self.score = 0
        self.spawn_timer = 0
        self.spawn_rate = 160 
        self.alien_speed_max = 3.0

    def user_info_callback(self, msg):
        if self.screen_param == "phase1":
            self.real_name = msg.name
            self.user_name = msg.username
            self.user_age = msg.age
            
            rospy.set_param('~user_name', self.user_name)
            rospy.loginfo(f"Received Info -> Name: {self.real_name}, User: {self.user_name}, Age: {self.user_age}")
            self.screen_param = "phase2"
            rospy.set_param('~screen_param', "phase2")
            rospy.loginfo("Game phase started.")

    def control_callback(self, msg):
        cmd = msg.data
        if self.screen_param == "phase2":
            self.player.move_left = (cmd == "LEFT")
            self.player.move_right = (cmd == "RIGHT")
            self.player.move_up = (cmd == "UP")
            self.player.move_down = (cmd == "DOWN")
            if cmd == "SHOOT": self.player.shoot = True

    def handle_get_score(self, req):
        return GetUserScoreResponse(self.score)

    def handle_set_difficulty(self, req):
        if self.screen_param == "phase1":
            diff = req.change_difficulty
            if diff == "hard": self.spawn_rate = 100
            elif diff == "easy": self.spawn_rate = 200
            elif diff == "medium": self.spawn_rate = 160
            rospy.loginfo(f"Difficulty set to {diff}")
            return SetGameDifficultyResponse(True)
        return SetGameDifficultyResponse(False)

    def phase_welcome(self):
        self.screen.fill(BLACK)
        title = self.font.render("WAITING FOR USER INFO...", True, WHITE)
        self.screen.blit(title, (100, 250))
        name_text = self.font.render(f"User Param: {self.user_name}", True, GREEN)
        self.screen.blit(name_text, (100, 300))

    def phase_game(self):
        self.screen.fill(BLACK)
        self.player.update()
        self.player.draw(self.screen)
        
        self.spawn_timer += 1
        if self.spawn_timer >= self.spawn_rate:
            x = random.randint(0, SCREEN_WIDTH - 30)
            self.aliens.append(Alien(x, -30, random.uniform(1, self.alien_speed_max)))
            self.spawn_timer = 0
            
        for alien in self.aliens[:]:
            alien.update()
            alien.draw(self.screen)
            for bullet in self.player.bullets[:]:
                if (bullet.x >= alien.x and bullet.x <= alien.x + alien.width and
                    bullet.y >= alien.y and bullet.y <= alien.y + alien.height):
                    self.player.bullets.remove(bullet)
                    self.aliens.remove(alien)
                    self.score += 10
                    break
            
            if alien.y > SCREEN_HEIGHT or (alien.x < self.player.x + 40 and alien.x + 30 > self.player.x and alien.y < self.player.y + 30 and alien.y + 25 > self.player.y):
                self.lives -= 1
                self.aliens.remove(alien)

        if self.lives <= 0:
            self.screen_param = "phase3"
            rospy.set_param('~screen_param', "phase3")
            rospy.loginfo("Final phase reached, calculating score.")
            self.res_pub.publish(self.score)

        self.screen.blit(self.font.render(f"Score: {self.score}", True, WHITE), (10, 10))
        self.screen.blit(self.font.render(f"Lives: {self.lives}", True, WHITE), (10, 40))

        self.screen.blit(self.font.render(f"Name: {self.real_name}", True, WHITE), (SCREEN_WIDTH - 200, 10))
        self.screen.blit(self.font.render(f"User: {self.user_name}", True, WHITE), (SCREEN_WIDTH - 200, 40))
        self.screen.blit(self.font.render(f"Age: {self.user_age}", True, WHITE), (SCREEN_WIDTH - 200, 70))

    def phase_final(self):
        self.screen.fill(BLACK)
        self.screen.blit(self.font.render("GAME OVER", True, RED), (250, 250))
        self.screen.blit(self.font.render(f"Final Score: {self.score}", True, WHITE), (250, 300))

    def main(self):
        while not rospy.is_shutdown():
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    rospy.signal_shutdown("Quit")

            if self.screen_param == "phase1":
                self.phase_welcome()
            elif self.screen_param == "phase2":
                self.phase_game()
            elif self.screen_param == "phase3":
                self.phase_final()

            pygame.display.flip()
            self.clock.tick(FPS)

if __name__ == "__main__":
    try:
        rospy.init_node("game_node")
        node = GameNode()
        node.main()
    except rospy.ROSInterruptException:
        pass