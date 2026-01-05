//
//  ContentView.swift
//  RadarAnimation
//
//  Created by Angelos Staboulis on 5/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation: Double = 0
    @State private var blips: [RadarBlip] = RadarBlip.randomBlips(count: 10)

    var body: some View {
        ZStack {
            // Background
            Color.black.ignoresSafeArea()

            // Radar circle
            Circle()
                .stroke(Color.green.opacity(0.6), lineWidth: 2)
                .frame(width: 300, height: 300)

            // Grid lines
            RadarGrid()

            // Blips (airplanes)
            ForEach(blips) { blip in
                Circle()
                    .fill(Color.green)
                    .frame(width: 5, height: 5)
                    .position(blip.position)
                    .opacity(blip.opacity)
            }

            // Sweep line
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.green.opacity(0.6), .green.opacity(0.1), .clear],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 2, height: 150)
                .offset(y: -75)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: rotation)
        }
        .onAppear {
            rotation = 360
            animateBlips()
        }
    }

    private func animateBlips() {
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 1)) {
                blips = RadarBlip.randomBlips(count: 10)
            }
        }
    }
}

#Preview {
    ContentView()
}
