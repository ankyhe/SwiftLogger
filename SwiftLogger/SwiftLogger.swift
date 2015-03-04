//
//  SwiftLogger.swift
//  SwiftLogger
//
//  Created by AnkyHe on 3/3/15.
//  Copyright (c) 2015 Gery Studio. All rights reserved.
//

import Foundation


enum LoggerLevel : Int {
    case TINY = 10
    case DETAIL = 20
    case ENTER = 30
    case RETURN = 31
    case DEBUG = 40
    case INFO = 50
    case WARN = 60
    case ERROR = 70
    case TRACE0 = 75
    case FATAL = 80
}


enum LoggerLevelSetting : Int {
    case ALL = 0
    case MINOR = 45
    case MAJOR = 65
    case NONE = 1000
}


class SwiftLogger {
    
    var loggerLevelSetting = LoggerLevelSetting.MAJOR
    
    //MARK: - Singleton
    class var sharedInstance: SwiftLogger {
        struct Static {
            static let instance: SwiftLogger = SwiftLogger()
        }
        return Static.instance
    }
    /* END Singletone */
    
    //MARK: - Log methods
    func enter(message: String) {
        log(.ENTER, message: message)
    }
    
    func rtn(message: String) {
        log(.RETURN, message: message)
    }
    
    func dbg(message: String) {
        log(.DEBUG, message: message)
    }
    
    func info(message: String) {
        log(.INFO, message: message)
    }
    
    func warn(message: String) {
        log(.WARN, message: message)
    }
    
    func error(message: String) {
        log(.ERROR, message: message)
    }
    
    func trace0(message: String) {
        log(.TRACE0, message: message)
    }

    
    func log(loggerLevel: LoggerLevel, message: String) {
        if (loggerLevel.rawValue > loggerLevelSetting.rawValue) {
            println("TID:\(self.dynamicType.threadString()) FILE:\(__FILE__.lastPathComponent) LINE:\(__LINE__) [\(self.dynamicType.loggerLevelString(loggerLevel))] \(message)")
        }
    }

    //MARK: - Help Methods
    private class func loggerLevelString(loggerLevel:LoggerLevel) -> String {
        switch loggerLevel {
        case .TINY:    return "TINY"
        case .DETAIL : return "DETAIL"
        case .ENTER:   return "ENTER"
        case .RETURN:  return "RETURN"
        case .DEBUG:   return "DEBUG"
        case .INFO:    return "INFO"
        case .WARN:    return "WARN"
        case .ERROR:   return "ERROR"
        case .TRACE0:  return "TRACE0"
        case .FATAL:   return "FATAL"
        }
    }
    
    private class func threadString() -> String {
        if NSThread.currentThread().isMainThread {
            return "main"
        }
        return "\(NSThread.currentThread())"
    }
    
}
