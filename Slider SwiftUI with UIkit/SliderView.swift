//
//  ContentView.swift
//  Slider SwiftUI with UIkit
//
//  Created by Сергей Иванчихин on 26.04.2022.
//

import SwiftUI

struct SliderView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Float.random(in: 0...100)
    @State var showResult = false
    
    private var opacity: Double {
        Double(computeScore())/100
    }
        
    var body: some View {
        VStack{
           
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")

            SliderUIkit(sliderValue: $currentValue, target: opacity)
                .padding()
            
            Button("Проверь меня") {
                showResult = true
            }
                .padding()
                .alert("Ваш результат", isPresented: $showResult, actions: {}, message: {
                    Text("\(computeScore())")
                })
            
            Button("Начать заново", action: {
                    targetValue = Int.random(in: 0...100)
                    currentValue = Float.random(in: 0...100)
            })
                .padding()
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}


