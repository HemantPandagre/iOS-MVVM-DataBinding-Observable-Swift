//
//  CustomTimer.swift
//  iOS-MVVM-DataBinding-Observable-Swift
//
//  Created by Hemant Pandagre on 22/06/22.
//

import Foundation

class CustomTimer: NSObject {
    private var timer: Timer?
    private var duration: Int
    var isRunning: Bool
    var observable: Observable<Int> = Observable(0)
    
    private var count = 0 {
        didSet {
            self.observable.value = count
        }
    }
    
    init(duration: Int) {
        self.duration = duration
        self.isRunning = false
        super.init()
    }
    
    func startstop() {
        self.initializerAndDeinitializer()
    }

    private func initializerAndDeinitializer() {
        if !self.isRunning {
            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.duration), target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }else{
            self.timer?.invalidate()
            count = 0
            timer = nil
        }
        self.isRunning = !self.isRunning
    }
    
    @objc func timerAction() {
        count += 1
    }
}
