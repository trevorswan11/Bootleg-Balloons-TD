#pragma once
#include <iostream>
#include <fstream>
#include <string>
#include <mutex>
#include <ctime>

class Logger {
private:
    enum LogType {
        LOG,
        WARNING,
        ERROR
    };

    static std::ofstream logFile;
    static std::mutex logMutex;

    /// @brief Get the current time in the format [YYYY-MM-DD HH:MM:SS]
    /// @return The current local time
    static std::string curr_time() {
        time_t now = time(0);
        struct tm timeInfo;
        localtime_s(&timeInfo, &now);
        char buf[80];
        strftime(buf, sizeof(buf), "[%Y-%m-%d %H:%M:%S]", &timeInfo);
        return std::string(buf);
    }

    static void log(LogType type, const std::string& message) {
        std::lock_guard<std::mutex> lock(logMutex);
        logFile << logTypeToString(type) << " " << curr_time() << ": " << message << std::endl;
    }

    static std::string logTypeToString(LogType type) {
        switch (type) {
            case LOG: return "LogInfo";
            case WARNING: return "LogWarning";
            case ERROR: return "LogError";
            default: return "UNKNOWN";
        }
    }

public:
    static void init() {
        if (!logFile.is_open()) {
            logFile.open("LogOutput.log", std::ios::trunc);
        }
    }

    static void logInfo(const std::string& message) {
        log(LOG, message);
    }

    static void logWarning(const std::string& message) {
        log(WARNING, message);
    }

    static void logError(const std::string& message) {
        log(ERROR, message);
    }

    static void close() {
        if (logFile.is_open()) logFile.close();
    }
};