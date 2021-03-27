//
//  CurrentTimer.swift
//  KeepingTime WatchKit Extension
//
//  Created by Rich Gruskin on 3/27/21.
//

import SwiftUI

struct CurrentTimer: View {
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    
    @State var timer: Timer? = nil
    @State var timerIsPaused: Bool = true
    
    var body: some View {
        

        ZStack {
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                
                ZStack {
                    Pulsation()
                    Track()
                    Outline(seconds: seconds)
                    Label(hours: hours, minutes: minutes, seconds: seconds)
                }
                .padding(.top, 50.0)
            
                HStack {
                    Button (action: {
                        startTimer()
                    }) {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                    }
                
                    Button (action: {
                        stopTimer()
                        minutes = 0
                        seconds = 0
                        hours = 0
                    }) {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 20.0)
            }
        }
    }
    
    func stopTimer(){
      timerIsPaused = true
      timer?.invalidate()
      timer = nil
    }

    func startTimer(){
      timerIsPaused = false
      // 1. Make a new timer
      timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
        // 2. Check time to add to H:M:S
        if self.seconds == 59 {
          self.seconds = 0
          if self.minutes == 59 {
            self.minutes = 0
            self.hours = self.hours + 1
          } else {
            self.minutes = self.minutes + 1
          }
        } else {
          self.seconds = self.seconds + 1
        }
      }
    }
}


struct Pulsation : View {
    
    @State var pulsate  = false
    
    var colors: [Color] = [Color.pulsatingColor]
    
    var body: some View {
        Circle()
            .fill(Color.pulsatingColor)
            .frame(width: 95, height: 95)
            .scaleEffect(pulsate ? 1.3 : 1.0)
            .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true))
            .onAppear {
                self.pulsate.toggle()
            }
    }
}

struct Outline : View {
    var seconds : Int
    var colors : [Color] = [Color.outlineColor]
    var body: some View {

        ZStack {
            Circle()
                .fill(Color.clear)
                .frame(width: 100, height: 100)
                .overlay(
                    Circle()
                        .trim(from: 0, to: CGFloat(seconds) * 0.0165)
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                )
                //.animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
                .animation(seconds != 0 ? .spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0) : .none)
        }

  }
}

struct Track : View {
    var colors : [Color]  = [Color.trackColor]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.backgroundColor)
                .frame(width: 100, height: 100)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth:10))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                )
            }
    }
}

struct Label: View {
    var hours : Int
    var minutes : Int
    var seconds : Int
    
    var body : some View {
        ZStack {
            Text (String(format: "%02d:%02d:%02d", hours,minutes,seconds))
                .font (.system(size: 16))
                .fontWeight(.heavy)
        }
    }}

struct CurrentTimer_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTimer()
    }
}
