//
//  RadarBlip.swift
//  RadarAnimation
//
//  Created by Angelos Staboulis on 5/1/26.
//

import Foundation
struct RadarBlip: Identifiable {
    let id = UUID()
    let position: CGPoint
    let opacity: Double

    static func randomBlips(count: Int) -> [RadarBlip] {
        (0..<count).map { _ in
            RadarBlip(
                position: CGPoint(
                    x: CGFloat.random(in: 150...220),
                    y: CGFloat.random(in: 250...400)
                ),
                opacity: Double.random(in: 0.1...25.0)
            )
        }
    }
}
