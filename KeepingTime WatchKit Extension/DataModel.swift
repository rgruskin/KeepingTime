//
//  DataModel.swift
//  KeepingTime WatchKit Extension
//
//  Created by Rich Gruskin on 3/25/21.
//
import SwiftUI

// Timer States
let TimerOff = 0
let TimerRunning = 1

import Foundation

struct MyTimerClass : Identifiable /* , Decodable */ {
    var id : UUID
    var shortDescription = ""
    var longDescription = ""
    var color : Color
    var status : Int
}

class myTimers : ObservableObject {
    
    @Published var myTimers = [MyTimerClass] ()
    
    init() {
        myTimers.append(MyTimerClass(id: UUID(), shortDescription: "Develop", longDescription: "Sofware Development", color: Color.rgb(r: 255, g: 0, b: 0), status: TimerOff))
        myTimers.append(MyTimerClass(id: UUID(), shortDescription: "NMI", longDescription: "Nikon Metrology", color: Color.rgb(r: 0, g: 255, b: 0), status: TimerOff))
        myTimers.append(MyTimerClass(id: UUID(), shortDescription: "Support", longDescription: "Tech Support", color: Color.rgb(r: 0, g: 0, b: 255), status: TimerOff))
        myTimers.append(MyTimerClass(id: UUID(), shortDescription: "Service", longDescription: "Service Department", color: Color.rgb(r: 128, g: 128, b: 128), status: TimerOff))
        myTimers.append(MyTimerClass(id: UUID(), shortDescription: "Factory", longDescription: "Factory Contract", color: Color.rgb(r: 186, g: 66, b: 245), status: TimerOff))
        myTimers.append(MyTimerClass(id: UUID(), shortDescription: "IT", longDescription: "IT Services", color: Color.rgb(r: 245, g: 245, b: 66), status: TimerOff))
    }
}
