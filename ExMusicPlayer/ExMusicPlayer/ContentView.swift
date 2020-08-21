//
//  ContentView.swift
//  ExMusicPlayer
//
//  Created by  Ting-Wei Lee on 2020/8/18.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
//    change to one btn
    @State var isPlaying = false
    
    var body: some View {
        HStack{
            Button(action: {
                if audioPlayer.isPlaying{
                    audioPlayer.pause()
                    isPlaying = false
                }else{
                    audioPlayer.play()
                    isPlaying = true
                }
//                self.audioPlayer.play()
            }){
//                Image(systemName: "play.rectangle")
//                    .resizable()
//                    .frame(width: 100, height: 100, alignment: .center)
                Image(systemName: isPlaying ? "pause.rectangle": "play.rectangle")
                    .resizable()
                    .foregroundColor(isPlaying ? .yellow : .blue)
                    .frame(width: 200, height: 200, alignment: .center)
            }
//            Spacer()
//            Button(action: {
//                self.audioPlayer.pause()
//            }){
//                Image(systemName: "pause.rectangle")
//            }
        }.padding(.all, 60)
        .onAppear {
            let sound = Bundle.main.path(forResource: "sampleMusic", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
