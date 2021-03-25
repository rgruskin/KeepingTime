//
//  ContentView.swift
//  KeepingTime WatchKit Extension
//
//  Created by Rich Gruskin on 3/24/21.
//

import SwiftUI

struct ContentView: View {
    
    var numOfTimers : Int = 3
    var numOfRows : Int = 2
    
    var body: some View {
        TabView {
            VStack (alignment: .center) {
                HStack (spacing: 55) {
                    Button (action: {
                        let a = 4
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                        
                    }
            
                    Button (action: {
                        let a = 4
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
                    ForEach (0..<numOfTimers) { index in
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
                                            .foregroundColor(.white)
                                    }
                                    Text("Service")
                                        .font(.caption2)
                                }
                                .padding(5)
                            }
                        }
                    }
                }
            
            }
           // .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea()
    
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))

 
    }
    
    func OpenATimer(timerIndex : Int)  {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
