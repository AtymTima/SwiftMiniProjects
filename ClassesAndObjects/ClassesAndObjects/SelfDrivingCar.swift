//
//  SelfDrivingCar.swift
//  ClassesAndObjects
//
//  Created by  Тима on 3/11/21.
//

import Foundation

class SelfDrivingCar : Car {
    var destination : String = "1 Infinite Loop"
    
    override func DriveForward() {
        super.DriveForward()
        print("And now I stopped at " + destination)
    }
}
