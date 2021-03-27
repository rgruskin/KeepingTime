//
//  ContentView.swift
//  KeepingTime WatchKit Extension
//
//  Created by Rich Gruskin on 3/24/21.
//

import SwiftUI

struct ContentView: View {
    
    var numOfRows : Int = 2
    @State var tabIndex = 0
    
    @ObservedObject var timerData = myTimers()
    
    var body: some View {
        TabView (selection: $tabIndex) {
            VStack (alignment: .center) {
                HStack (spacing: 55) {
                    Button (action: {
                        AddATimer()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                        
                    }
            
                    Button (action: {
                        OpenSettings()
                    }) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.blue)
                        
                    }
                }
                .padding(20)
                
                ScrollView {
                    ForEach (0..<Int(timerData.myTimers.count/2)) { index in
                        HStack {
                            ForEach (0..<numOfRows) { rIndex in
                                VStack {
                                    Button (action: {
                                        OpenATimer(timerIndex: index + rIndex)
                                    }) {
                                        Image(systemName: "timer")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(timerData.myTimers[(index*2) + rIndex].color)
                                    }
                                    Text(timerData.myTimers[(index*2) + rIndex].shortDescription)
                                        .font(.caption2)
                                }
                                .padding(5)
                            }
                        }
                    }
                }
            
            }
            .tabItem { }
            .tag(0)
            
            CurrentTimer()
                .tabItem {}
                .tag (1)
            
           // .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea()
    
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))

 
    }
    
    func OpenATimer(timerIndex : Int)  {
        
    }
    
    func AddATimer() {
        
    }
    
    func OpenSettings() {
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
