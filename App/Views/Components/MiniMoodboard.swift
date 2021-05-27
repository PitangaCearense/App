//
//  MiniMoodboard.swift
//  App
//
//  Created by Ronaldo Gomes on 27/05/21.
//

import SwiftUI

struct MiniMoodboard: View {
    let number: Int

    init(number: Int) {
        self.number = number
    }

    var body: some View {
        VStack {
            VStack(spacing: 4) {
                HStack(spacing: 4) {
                    MiniBoardImage(name: "", number: number)
                    MiniBoardImage(name: "", number: number)
                }
                HStack(spacing: 4) {
                    MiniBoardImage(name: "", number: number)
                    MiniBoardImage(name: "", number: number)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 26))
            Text("Favorite \(number)")
                .padding(.vertical, 1)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct MiniMoodboard_Previews: PreviewProvider {
    static var previews: some View {
        MiniMoodboard(number: 0)
    }
}

struct MiniBoardImage: View {
    var colors: [Color] = [.yellow, .purple, .green]
    var name: String
    var number: Int

    var body: some View {
        Image(systemName: name)
            .font(.system(size: 30))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
            .background(colors[number % colors.count])
    }
}
