//
//  ContentView.swift
//  Drawing
//
//  Created by Yash Poojary on 07/10/21.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var steps = 100
    var amount = 0.0
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        color(for: value, brightness: 1),
                        color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
       var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}



struct ContentView: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: amount)
                .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//
//struct ArrowHead: Shape {
//
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY/4))
//        path.addLine(to: CGPoint(x: rect.maxX/3, y: rect.maxY/4))
//        path.addLine(to: CGPoint(x: rect.maxX/3, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX/1.5, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX/1.5, y: rect.maxY/4))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY/4))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//
//
//
//
//        return path
//
//    }
//}
//
//
//
//
//
//struct ContentView: View {
//    @State private var insetAmount: CGFloat = 80.0
//    var lineWidth = 5
//    @State private var isBold = false
//
//
//    var body: some View {
//        VStack {
//            ArrowHead()
//                .stroke(Color.red, style: StrokeStyle(lineWidth: CGFloat(isBold ? 20 : lineWidth), lineCap: .round, lineJoin: .round))
//            .onTapGesture {
//                withAnimation(.linear(duration: 1)) {
//                    isBold.toggle()
//                }
//            }
//            .frame(width: 150, height: 350)
//            Spacer()
//
//
//        }
//
//    }
//}


//
//struct ColorCyclingCircle: View {
//    var amount = 0.0
//    var steps = 100
//
//    var body: some View {
//        ZStack {
//            ForEach(0..<steps) { value in
//                Circle()
//                    .inset(by: CGFloat(value))
//                    .strokeBorder(LinearGradient(colors: [
//                        color(for: value, brightness: 1),
//                        color(for: value, brightness: 0.5)
//                    ], startPoint: .top, endPoint: .bottom), lineWidth: 10)
//            }
//        }
//        .drawingGroup()
//    }
//
//    func color(for value: Int, brightness: Double) -> Color {
//        var targetHue = Double(value) / Double(steps) + amount
//
//        if targetHue > 1 {
//            targetHue -= 1
//        }
//
//        return Color(hue: targetHue, saturation: 1, brightness: brightness)
//    }
//}


//
//struct ContentView: View {
//    @State private var ColorCycle = 0.0
//
//
//
//    var body: some View {
//        VStack {
//            ColorCyclingCircle(amount: ColorCycle)
//                .frame(width: 300, height: 300)
//
//            Slider(value: $ColorCycle)
//        }
//    }
//}
