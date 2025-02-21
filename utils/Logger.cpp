#include <Logger.hpp>

std::ofstream Logger::logFile;  
std::mutex Logger::logMutex;