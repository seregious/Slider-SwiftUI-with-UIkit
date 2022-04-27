//
//  SliderUIkit.swift
//  Slider SwiftUI with UIkit
//
//  Created by Сергей Иванчихин on 26.04.2022.
//

import SwiftUI

struct SliderUIkit: UIViewRepresentable {
    
    @Binding var sliderValue: Float
    var target: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderMove),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        uiView.thumbTintColor = .red.withAlphaComponent(target)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }

}

extension SliderUIkit {
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            self._sliderValue = sliderValue
        }
        
        @objc func sliderMove(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

struct SliderUIkit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIkit(sliderValue: .constant(0.5), target: 50)
    }
}

