//
//  MapAnnotations.swift
//  MapApp
//
//  Created by Bulut Sistem on 5.07.2023.
//

import SwiftUI

struct MapAnnotations : View {
    @State private var animation : Double = 0.0

    var body: some View {
        ZStack{
            Circle()
                .fill(Color.red)
                .frame(width: 15,height: 15,alignment: .center)
            Circle()
                .stroke(Color.red, lineWidth: 2)
                .frame(width: 13, height: 13, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
          
        }.onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}
