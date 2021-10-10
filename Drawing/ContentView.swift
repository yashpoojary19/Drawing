//
//  ContentView.swift
//  Drawing
//
//  Created by Yash Poojary on 07/10/21.
//

import SwiftUI


struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: CGFloat
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        if b != 0 {
            let temp = b
            b = b % a
            a = temp
        }
        
        return a
    }
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, outerRadius)
        let innerRadius = CGFloat(innerRadius)
        let outerRadius = CGFloat(outerRadius)
        let distance = CGFloat(distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil( 2 * CGFloat.pi * outerRadius / CGFloat(divisor)) * amount
        
        var path = Path()
        
        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
            
             x += rect.width / 2
             y += rect.height / 2
            
             if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        return path
    }
    
}

struct ContentView: View {
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount: CGFloat = 1.0
    @State private var hue = 0.6

    
    
    
    var body: some View {
        VStack(spacing: 0){
            Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
                .stroke(Color(hue: hue, saturation: 1, brightness: amount))
                .frame(width: 300, height: 300)
            
            Spacer()
            
            Group {
                Text("Inner Radius: \(Int(innerRadius))")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Outer Radius: \(Int(outerRadius))")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Distance: \(Int(distance))")
                Slider(value: $distance, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Amount: \(Int(amount))")
                Slider(value: $distance, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                
                Text("Color")
                Slider(value: $hue)
                    .padding(.horizontal)
            }
            
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//struct CheckerBoard: Shape {
//    var rows: Int
//    var columns: Int
//
//     public var animatableData: AnimatablePair<Double, Double> {
//        get {
//            AnimatablePair(Double(rows), Double(columns))
//        }
//        set {
//            rows = Int(newValue.first)
//            columns = Int(newValue.second)
//        }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        let rowSize = rect.height / CGFloat(rows)
//        let columnSize = rect.width / CGFloat(columns)
//
//
//        for row in 0..<rows {
//            for column in 0..<columns {
//                if (row + column).isMultiple(of: 2) {
//                    let startX = columnSize * CGFloat(column)
//                    let startY = rowSize * CGFloat(row)
//
//                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
//
//                    path.addRect(rect)
//                }
//            }
//        }
//
//        return path
//
//    }
//}
//
//struct ContentView: View {
//    @State private var rows = 4
//    @State private var columns = 4
//
//    var body: some View {
//        CheckerBoard(rows: rows, columns: columns)
//            .onTapGesture {
//                withAnimation(.linear(duration: 3)) {
//                    rows = 16
//                    columns = 16
//                }
//            }
//
//    }
//}

//struct Trapezoid: Shape {
//    var insetAmount: CGFloat
//
//    var animatableData: CGFloat {
//        get {  insetAmount }
//        set {  insetAmount = newValue  }
//    }
//
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: 0, y: rect.maxY))
//        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
//
//
//
//        return path
//    }
//}
//
//struct ContentView: View {
//    @State private var amount: CGFloat = 50
//
//    var body: some View {
//       Trapezoid(insetAmount: amount)
//            .frame(width: 300, height: 300)
//            .onTapGesture {
//                withAnimation {
//                    amount = CGFloat.random(in: 10...90)
//                }
//            }
//
//
//    }
//}



//struct ContentView: View {
//
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
//
//
//    var body: some View {
//        VStack {
//            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .fill(Color.red, style: FillStyle(eoFill: true))
//
//            Text("Offset")
//            Slider(value: $petalOffset, in: -40...40)
//                .padding([.horizontal, .bottom])
//
//            Text("Width")
//            Slider(value: $petalWidth, in: 0...100)
//                .padding(.horizontal)
//
//
//        }
//    }
//
//}




//struct Flower: Shape {
//    var petalOffset: Double = -20
//    var petalWidth: Double = 100
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 3) {
//            let rotation = CGAffineTransform(rotationAngle: number)
//
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height / 2))
//
//            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
//
//            let rotatedPetal = originalPetal.applying(position)
//
//            path.addPath(rotatedPetal)
//        }
//
//        return path
//    }
//}
