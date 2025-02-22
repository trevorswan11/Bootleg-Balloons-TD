#ifndef ENEMY_HPP
#define ENEMY_HPP

#include <iostream>

class Enemy {
public:
    std::pair<float, float> cord;
    int hp;
    float speed;
    std::string type;

    Enemy(std::pair<float, float> cord_, int hp_, float speed_, std::string type_);

    // Move enemy
    void update(float deltaTime);

    // Take damage
    void damage(int damage);

    // Check if alive
    bool isAlive() const;
};

#endif