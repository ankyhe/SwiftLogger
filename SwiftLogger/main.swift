//
//  main.swift
//  SwiftLogger
//
//  Created by AnkyHe on 3/4/15.
//

import Foundation

func foo() {
    SwiftLogger.sharedInstance.enter(__FUNCTION__)
    
    SwiftLogger.sharedInstance.info("just for test message")
    
    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
    dispatch_async(dispatch_get_global_queue(priority, 0)) {
        SwiftLogger.sharedInstance.enter("in another task thread")
        dispatch_async(dispatch_get_main_queue()) {
            // update some UI
        }
    }
    sleep(2)
    SwiftLogger.sharedInstance.rtn(__FUNCTION__)
}

func main() {
    SwiftLogger.sharedInstance.loggerLevelSetting = .ALL
    foo()
}

main()

