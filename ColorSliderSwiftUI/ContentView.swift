//
//  ContentView.swift
//  ColorSliderSwiftUI
//
//  Created by Lepestok Jora on 14.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    //@State private var viewSwiftUI: View
    
    @State private var sliderValueRed = Double.random(in: 0...250)
    @State private var sliderValueGreen = Double.random(in: 0...250)
    @State private var sliderValueBlue = Double.random(in: 0...250)
    
    @State var alertPresented = false
    
    let color: Color
    
    var body: some View {
        VStack(spacing: 40){
            
            RoundedRectangle(cornerRadius: 20)
            
                .foregroundColor(color)
                .frame(width: 350, height: 200)
                .shadow(radius: 10)
           
            
            ColorSliderView(value: $sliderValueRed, textColor: .black)
            ColorSliderView(value: $sliderValueGreen, textColor: .black)
            ColorSliderView(value: $sliderValueBlue, textColor: .black)
            
            //RoundedRectangle.background(<#T##self: RoundedRectangle##RoundedRectangle#>)
            
//            let customeColor: UIColor = UIColor.init(red: CGFloat(sliderRed.value),
//                                                     green: CGFloat(sliderGreen.value),
//                                                     blue: CGFloat(sliderBlue.value),
//                                                     alpha: 1)
                
           Spacer()
        }
        .padding()
    }
    private func checkTextFild() {
        if let $value > 250  {
            Slider(value: $value, in: 0...250,)
            alertPresented.toggle()
            return
        }
    }
}


struct ColorSliderView: View {
    @Binding var value: Double
    let textColor: Color
    
    @State private var valueAl = ""
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value, in: 0...250, step: 1)
                .cornerRadius(40)
            
            
            TextField("250", text: $valueAl).focused($nameIsFocused)
                .alert("Wrong Format", isPresented: alertPresented, actions: {}) {
                    Text("Enter your name")
                }
        }
       
        
        
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(color: .white)
        }
    }
}
