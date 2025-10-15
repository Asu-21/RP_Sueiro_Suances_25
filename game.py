import pygame
import random
import sys
import math

# Initialize Pygame
pygame.init()

# Constants
SCREEN_WIDTH = 650
SCREEN_HEIGHT = 600
FPS = 60

# Colors
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
PURPLE = (128, 0, 128)
GREEN = (0, 255, 0)
RED = (255, 0, 0)
YELLOW = (255, 255, 0)
GRAY = (128, 128, 128)

# Game states
WELCOME = 0
PLAYING = 1
PAUSED = 2
GAME_OVER = 3
LEVEL_COMPLETE = 4

class Player:
    def __init__(self):
        self.width = 40
        self.height = 30
        self.x = SCREEN_WIDTH // 2 - self.width // 2
        self.y = SCREEN_HEIGHT - 60
        self.speed = 5
        self.bullets = []
        self.shoot_delay = 0
        self.max_shoot_delay = 10
        
    def update(self):
        # Handle movement
        keys = pygame.key.get_pressed()
        if keys[pygame.K_LEFT] and self.x > 0:
            self.x -= self.speed
        if keys[pygame.K_RIGHT] and self.x < SCREEN_WIDTH - self.width:
            self.x += self.speed
        if keys[pygame.K_UP] and self.y > 0:
            self.y -= self.speed
        if keys[pygame.K_DOWN] and self.y < SCREEN_HEIGHT - self.height:
            self.y += self.speed
            
        # Handle shooting
        if keys[pygame.K_SPACE] and self.shoot_delay <= 0:
            self.bullets.append(Bullet(self.x + self.width // 2, self.y, -8))
            self.shoot_delay = self.max_shoot_delay
            
        if self.shoot_delay > 0:
            self.shoot_delay -= 1
            
        # Update bullets
        for bullet in self.bullets[:]:
            bullet.update()
            if bullet.y < 0:
                self.bullets.remove(bullet)
    
    def draw(self, screen):
        # Draw purple spaceship
        pygame.draw.polygon(screen, PURPLE, [
            (self.x + self.width // 2, self.y),
            (self.x, self.y + self.height),
            (self.x + self.width, self.y + self.height)
        ])
        
        # Draw bullets
        for bullet in self.bullets:
            bullet.draw(screen)

class Alien:
    def __init__(self, x, y, speed, shoot_rate):
        self.width = 30
        self.height = 25
        self.x = x
        self.y = y
        self.speed = speed
        # Legacy fields kept for compatibility but not used for shooting anymore
        self.bullets = []
        self.shoot_timer = 0
        self.shoot_rate = shoot_rate
        
    def update(self):
        self.y += self.speed
        # Shooting handled globally per frame in Game.update()
    
    def draw(self, screen):
        # Draw alien (simple rectangular shape with details)
        pygame.draw.rect(screen, GREEN, (self.x, self.y, self.width, self.height))
        pygame.draw.rect(screen, RED, (self.x + 5, self.y + 5, 5, 5))
        pygame.draw.rect(screen, RED, (self.x + 20, self.y + 5, 5, 5))

class Bullet:
    def __init__(self, x, y, speed):
        self.x = x
        self.y = y
        self.speed = speed
        self.width = 3
        self.height = 8
        
    def update(self):
        self.y += self.speed
        
    def draw(self, screen):
        color = YELLOW if self.speed < 0 else RED
        pygame.draw.rect(screen, color, (self.x - self.width // 2, self.y, self.width, self.height))

class Game:
    def __init__(self):
        self.screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
        pygame.display.set_caption("Space Invaders")
        self.clock = pygame.time.Clock()
        self.font = pygame.font.Font(None, 36)
        self.big_font = pygame.font.Font(None, 72)
        
        self.reset_game()
        
    def reset_game(self):
        self.state = WELCOME
        self.player = Player()
        self.aliens = []
        self.enemy_bullets = []  # Separate list for all enemy bullets
        self.lives = 3
        self.score = 0
        self.level = 1
        self.kills = 0
        self.alien_spawn_timer = 0
        self.alien_spawn_rate = 160  # frames between spawns (slower spawn)
        self.alien_speed_min = 1
        self.alien_speed_max = 3
        self.alien_shoot_rate = 180  # frames between shots
        
    def draw_heart(self, screen, x, y, size=20):
        """Draw a purple heart at the given position"""
        # Heart shape using circles and a triangle
        heart_color = PURPLE
        
        # Two circles for the top of the heart
        pygame.draw.circle(screen, heart_color, (x - size//4, y), size//3)
        pygame.draw.circle(screen, heart_color, (x + size//4, y), size//3)
        
        # Triangle for the bottom of the heart
        pygame.draw.polygon(screen, heart_color, [
            (x - size//2, y + size//6),
            (x + size//2, y + size//6),
            (x, y + size//2)
        ])
        
    def spawn_alien(self):
        x = random.randint(0, SCREEN_WIDTH - 30)
        speed = random.uniform(self.alien_speed_min, self.alien_speed_max)
        alien = Alien(x, -30, speed, self.alien_shoot_rate)
        self.aliens.append(alien)
        
    def check_collisions(self):
        # Player bullets vs aliens
        for bullet in self.player.bullets[:]:
            for alien in self.aliens[:]:
                if (bullet.x >= alien.x and bullet.x <= alien.x + alien.width and
                    bullet.y >= alien.y and bullet.y <= alien.y + alien.height):
                    self.player.bullets.remove(bullet)
                    self.aliens.remove(alien)
                    self.score += 10
                    self.kills += 1
                    break
                    
        # Enemy bullets vs player
        for bullet in self.enemy_bullets[:]:
            if (bullet.x >= self.player.x and bullet.x <= self.player.x + self.player.width and
                bullet.y >= self.player.y and bullet.y <= self.player.y + self.player.height):
                self.enemy_bullets.remove(bullet)
                self.lives -= 1
                if self.lives <= 0:
                    self.state = GAME_OVER
                break
                    
        # Aliens vs player (collision)
        for alien in self.aliens[:]:
            if (alien.x < self.player.x + self.player.width and
                alien.x + alien.width > self.player.x and
                alien.y < self.player.y + self.player.height and
                alien.y + alien.height > self.player.y):
                self.aliens.remove(alien)
                self.lives -= 1
                if self.lives <= 0:
                    self.state = GAME_OVER
                break
                
        # Remove aliens that went off screen and lose life
        for alien in self.aliens[:]:
            if alien.y > SCREEN_HEIGHT:
                self.aliens.remove(alien)
                self.lives -= 1
                if self.lives <= 0:
                    self.state = GAME_OVER
                
    def update_level(self):
        target_score = self.level * 150
        if self.score >= target_score:
            self.state = LEVEL_COMPLETE
            
    def next_level(self):
        self.level += 1
        self.kills = 0
        self.aliens = []
        # Clear all bullets
        self.player.bullets = []
        self.enemy_bullets = []
        # Increase difficulty
        self.alien_spawn_rate = max(90, self.alien_spawn_rate - 10)
        self.alien_speed_min += 0.5
        self.alien_speed_max += 0.5
        self.alien_shoot_rate = max(60, self.alien_shoot_rate - 30)
        self.state = PLAYING
        
    def draw_welcome_screen(self):
        self.screen.fill(BLACK)
        
        title = self.big_font.render("SPACE INVADERS", True, WHITE)
        title_rect = title.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 - 100))
        self.screen.blit(title, title_rect)
        
        instruction = self.font.render("Press any key to play", True, WHITE)
        instruction_rect = instruction.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2))
        self.screen.blit(instruction, instruction_rect)
        
        controls1 = self.font.render("Use arrow keys to move, SPACE to shoot", True, GRAY)
        controls1_rect = controls1.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 + 50))
        self.screen.blit(controls1, controls1_rect)
        
        controls2 = self.font.render("Press ESC to pause (R=reset, Q=quit when paused)", True, GRAY)
        controls2_rect = controls2.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 + 80))
        self.screen.blit(controls2, controls2_rect)
        
    def draw_game_screen(self):
        self.screen.fill(BLACK)
        
        # Draw game objects
        self.player.draw(self.screen)
        for alien in self.aliens:
            alien.draw(self.screen)
        
        # Draw enemy bullets
        for bullet in self.enemy_bullets:
            bullet.draw(self.screen)
            
        # Draw UI - Lives as hearts
        lives_label = self.font.render("Lives:", True, WHITE)
        self.screen.blit(lives_label, (10, 10))
        for i in range(self.lives):
            self.draw_heart(self.screen, 110 + i * 35, 20)
        
        level_text = self.font.render(f"Level: {self.level}", True, WHITE)
        self.screen.blit(level_text, (10, 50))
        
        target_score = self.level * 150
        score_progress = self.font.render(f"Score: {self.score}/{target_score}", True, WHITE)
        self.screen.blit(score_progress, (10, 90))
        
    def draw_game_over_screen(self):
        self.screen.fill(BLACK)
        
        game_over = self.big_font.render("GAME OVER", True, RED)
        game_over_rect = game_over.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 - 50))
        self.screen.blit(game_over, game_over_rect)
        
        final_score = self.font.render(f"Final Score: {self.score}", True, WHITE)
        final_score_rect = final_score.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2))
        self.screen.blit(final_score, final_score_rect)
        
        restart = self.font.render("Press R to restart or ESC to quit", True, WHITE)
        restart_rect = restart.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 + 50))
        self.screen.blit(restart, restart_rect)
        
    def draw_paused_screen(self):
        # Draw game screen first (as background)
        self.draw_game_screen()
        
        # Draw semi-transparent overlay
        overlay = pygame.Surface((SCREEN_WIDTH, SCREEN_HEIGHT))
        overlay.set_alpha(128)
        overlay.fill(BLACK)
        self.screen.blit(overlay, (0, 0))
        
        # Draw pause text
        paused = self.big_font.render("PAUSED", True, WHITE)
        paused_rect = paused.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 - 80))
        self.screen.blit(paused, paused_rect)
        
        # Draw options
        resume = self.font.render("Press ESC to resume", True, WHITE)
        resume_rect = resume.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 - 20))
        self.screen.blit(resume, resume_rect)
        
        reset = self.font.render("Press R to reset", True, WHITE)
        reset_rect = reset.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 + 20))
        self.screen.blit(reset, reset_rect)
        
        exit_text = self.font.render("Press Q to quit", True, WHITE)
        exit_rect = exit_text.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 + 60))
        self.screen.blit(exit_text, exit_rect)
        
    def draw_level_complete_screen(self):
        self.screen.fill(BLACK)
        
        complete = self.big_font.render("LEVEL COMPLETE!", True, GREEN)
        complete_rect = complete.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 - 50))
        self.screen.blit(complete, complete_rect)
        
        score_text = self.font.render(f"Score: {self.score}", True, WHITE)
        score_rect = score_text.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2))
        self.screen.blit(score_text, score_rect)
        
        next_level = self.font.render("Press ENTER for next level", True, WHITE)
        next_level_rect = next_level.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2 + 50))
        self.screen.blit(next_level, next_level_rect)
        
    def handle_events(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return False
                
            if event.type == pygame.KEYDOWN:
                if self.state == WELCOME:
                    self.state = PLAYING
                elif self.state == PLAYING:
                    if event.key == pygame.K_ESCAPE:
                        self.state = PAUSED
                elif self.state == PAUSED:
                    if event.key == pygame.K_ESCAPE:
                        self.state = PLAYING
                    elif event.key == pygame.K_r:
                        self.reset_game()
                        self.state = PLAYING
                    elif event.key == pygame.K_q:
                        return False
                elif self.state == GAME_OVER:
                    if event.key == pygame.K_r:
                        self.reset_game()
                        self.state = PLAYING
                    elif event.key == pygame.K_ESCAPE:
                        return False
                elif self.state == LEVEL_COMPLETE:
                    if event.key == pygame.K_RETURN:
                        self.next_level()
                        
        return True
        
    def update(self):
        if self.state == PLAYING:
            self.player.update()
            
            # Spawn aliens
            self.alien_spawn_timer += 1
            if self.alien_spawn_timer >= self.alien_spawn_rate:
                self.spawn_alien()
                self.alien_spawn_timer = 0
                
            # Update aliens and perform per-frame random shooting (level-scaled)
            for alien in self.aliens:
                alien.update()
                # Level-scaled (reduced) shooting probability per frame
                base_prob = 0.005  # base 0.5% chance per frame
                level_bonus = min(0.01 * (self.level - 1), 0.08)  # +1% per level, capped
                shoot_prob = base_prob + level_bonus
                if random.random() < shoot_prob:
                    # Level-scaled (reduced) bullet speed
                    bullet_speed = 3 + min(0.5 * (self.level - 1), 3.0)
                    self.enemy_bullets.append(Bullet(alien.x + alien.width // 2, alien.y + alien.height, bullet_speed))
            
            # Update enemy bullets
            for bullet in self.enemy_bullets[:]:
                bullet.update()
                if bullet.y > SCREEN_HEIGHT:
                    self.enemy_bullets.remove(bullet)
                
            # Check collisions
            self.check_collisions()
            
            # Check level completion
            self.update_level()
            
    def draw(self):
        if self.state == WELCOME:
            self.draw_welcome_screen()
        elif self.state == PLAYING:
            self.draw_game_screen()
        elif self.state == PAUSED:
            self.draw_paused_screen()
        elif self.state == GAME_OVER:
            self.draw_game_over_screen()
        elif self.state == LEVEL_COMPLETE:
            self.draw_level_complete_screen()
            
        pygame.display.flip()
        
    def run(self):
        running = True
        while running:
            running = self.handle_events()
            self.update()
            self.draw()
            self.clock.tick(FPS)
            
        pygame.quit()
        sys.exit()

if __name__ == "__main__":
    game = Game()
    game.run()
