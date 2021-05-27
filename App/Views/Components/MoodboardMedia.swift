//
//  MoodBoardMedia.swift
//  App
//
//  Created by Pedro Sousa on 26/05/21.
//

import SwiftUI
import AVKit

enum MoodboardMedia {
    case image(title: String, url: String)
    case video(title: String, url: String)
    case text(title: String, poem: String)
}

extension MoodboardMedia: View {
    var body: some View {
        switch self {
        case .image(_, let url):
            return AnyView(RemoteImage(url: url).aspectRatio(contentMode: .fill))
        case .video(_, let url):
            return AnyView(VideoPlayer(player: AVPlayer(url: URL(string: url)!)))
        case .text(let title, let poem):
            return AnyView(VStack {
                Text(title).font(.title2)
                Text(poem)
            })
        }
    }
}
