//
//  TimeCounter.swift
//  RGBullsEye
//
//  Created by Mihai Leonte on 9/18/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import Foundation
import Combine


class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var timer: Timer?
    var counter = 0
    
    @objc func updateCounter() {
        counter += 1
        objectWillChange.send(self)
    }
    
    init() {
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector:#selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
