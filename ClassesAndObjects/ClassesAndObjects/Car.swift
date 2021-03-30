//
//  Car.swift
//  ClassesAndObjects
//
//  Created by  Тима on 3/10/21.
//

import Foundation

enum CarType {
    case SEDAN
    case NISSAN
    case TOYOTA
}

enum CarColors {
    case BLACK
    case BLUE_SKY
    case DIAMOND
}

class Car {
    var color : CarColors = .BLACK
    var numberOfSeats : Int = 5
    var typeOfCar : CarType = .TOYOTA
    
    init() { }
    convenience init(initialColor : CarColors) {
        self.init()
        color = initialColor
    }
    
    func DriveForward() {
        print("Yeah I'm gonna take my horse to the old town road")
    }
}
