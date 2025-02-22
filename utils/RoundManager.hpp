#pragma once

#include <vector>
#include <string>
#include <Enemy.hpp>
#include <nlohmann/json.hpp>

class RoundManager {
public:
    int currentRound;
    /// Stores the enemies for the current round
    std::vector<std::vector<int>> enemies;
    std::vector<std::vector<std::string>> rounds;

    RoundManager(const std::string& filename);

    void loadRounds(const std::string& filename);

    void loadRound(int round);
    
    void nextRound();
};
