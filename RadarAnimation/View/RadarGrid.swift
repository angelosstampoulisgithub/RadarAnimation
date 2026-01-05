//
//  RadarGrid.swift
//  RadarAnimation
//
//  Created by Angelos Staboulis on 5/1/26.
//

import SwiftUI

struct RadarGrid: View {
    var body: some View {
        ZStack {
            // Inner circles
            ForEach(1..<4) { i in
                Circle()
                    .stroke(Color.green.opacity(0.3), lineWidth: 1)
                    .frame(width: CGFloat(i) * 75, height: CGFloat(i) * 75)
            }

            // Cross lines
            Rectangle()
                .fill(Color.green.opacity(0.3))
                .frame(width: 1, height: 300)

            Rectangle()
                .fill(Color.green.opacity(0.3))
                .frame(width: 300, height: 1)
        }
    }
}
