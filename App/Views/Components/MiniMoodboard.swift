//
//  MiniMoodboard.swift
//  App
//
//  Created by Ronaldo Gomes on 27/05/21.
//

import SwiftUI

struct MiniMoodboard: View {
    let imageUrls: [String]

    init(imageUrls: [String]) {
        self.imageUrls = imageUrls
    }

    var body: some View {
        VStack {
            VStack(spacing: 4) {
                HStack(spacing: 4) {
                    MiniBoardImage(name: imageUrls[1])
                    MiniBoardImage(name: imageUrls[2])
                }
                HStack(spacing: 4) {
                    MiniBoardImage(name: imageUrls[3])
                    MiniBoardImage(name: imageUrls[4])
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 26))
            Text(imageUrls[0])
                .padding(.vertical, 1)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct MiniMoodboard_Previews: PreviewProvider {
    static var previews: some View {
        MiniMoodboard(imageUrls: [""])
    }
}

struct MiniBoardImage: View {
    var name: String

    var body: some View {
        Image(systemName: name)
            .font(.system(size: 30))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
    }
}
