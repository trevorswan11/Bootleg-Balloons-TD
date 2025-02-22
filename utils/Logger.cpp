#include <Logger.hpp>

std::ofstream Logger::logFile;  
std::mutex Logger::logMutex;

void main() {
    Logger::init();
    Logger::logInfo("Initializing Logger...");
    
}