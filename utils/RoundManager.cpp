#include "RoundManager.hpp"
#include <fstream>
#include <iostream>
#include <Logger.hpp>

using json = nlohmann::json;

RoundManager::RoundManager(const std::string& filename) : currentRound(0) {
    loadRounds(filename);
}

void RoundManager::loadRounds(const std::string& filename) {
    std::ifstream file(filename);
    json data = json::parse(file);
    if (!file) {
        Logger::logError("Failed to load rounds from file: " + filename);
        return;
    }
    json data;
    file >> data;

    for (const auto& roundData : data) {
        
    }
}
