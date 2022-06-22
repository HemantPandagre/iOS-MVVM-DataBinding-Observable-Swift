//
//  AnimateController.swift
//  iOS-MVVM-DataBinding-Observable-Swift
//
//  Created by Hemant Pandagre on 22/06/22.
//

import Foundation

protocol AnimateBussinessLogic {
    var animationObservable: Observable<(ColorType, Int)> { get  set }
    var buttonObservable: Observable<Bool> { get  set }
    func startStop()
}

class AnimateViewModel: AnimateBussinessLogic {
    private var timer: CustomTimer?
    var animationObservable: Observable<(ColorType, Int)> = Observable((.yellow, 0))
    var buttonObservable: Observable<Bool> = Observable(false)
    
    func startStop() {
        
        if let timerObj = timer, timerObj.isRunning {
            timer?.startstop()
            timer = nil
        } else {
            timer = CustomTimer(duration: 1)
            timer?.startstop()
            
            // Implemented 'CustomTimer' observable here for getting timer response
            timer?.observable.bind({ [weak self] seconds in
                if (seconds % 10 == 0) {
                    self?.animationObservable.value = (.red, seconds)
                } else if (seconds % 2 == 0) {
                    self?.animationObservable.value = (.yellow, seconds)
                } else {
                    self?.animationObservable.value = (.green, seconds)
                }
            })
        }
        
        // Set 'buttonObservable' value
        buttonObservable.value = !buttonObservable.value
    }
}
