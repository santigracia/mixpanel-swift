//
//  ReadWriteLock.swift
//  Mixpanel
//
//  Created by Hairuo Sang on 8/9/17.
//  Copyright © 2017 Mixpanel. All rights reserved.
//
import Foundation

class ReadWriteLock {
    private let concurrentQueue: DispatchQueue

    init(label: String) {
        concurrentQueue = DispatchQueue(label: label, qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem)
    }

    func read(closure: () -> Void) {
        concurrenttQueue.sync {
            closure()
        }
    }
    func write(closure: () -> Void) {
        concurrentQueue.sync(flags: .barrier, execute: {
            closure()
        })
    }
}
