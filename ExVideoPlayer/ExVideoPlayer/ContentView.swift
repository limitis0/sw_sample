//
//  ContentView.swift
//  ExVideoPlayer
//
//  Created by  Ting-Wei Lee on 2020/8/18.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
//        inbuild video
//        VideoPlayer(player: AVPlayer(
//                        url: Bundle.main.url(
//                            forResource: "sample_video",
//                            withExtension: "mp4")!))
//        internet vedio
        VideoPlayer(player: AVPlayer(
                        url:
                            URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")!))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
