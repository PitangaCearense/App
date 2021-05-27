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
        GeometryReader { geo in
            switch self {
            case .image(_, let url):
                RemoteImage(url: url)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .aspectRatio(contentMode: .fill)
            case .video(_, let url):
                VideoPlayer(player: AVPlayer(url: URL(string: url)!))
                    .frame(width: geo.size.width, height: geo.size.height)
            case .text(let title, let poem):
                VStack {
                    Text(title).font(.title2)
                    Text(poem)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }.onTapGesture {
            switch self {
            case .image(_,let url):
                fallthrough
            case .video(_,let url):
                fallthrough
            case .text(_,let url):
                print(url)
            }
        }
    }
}
