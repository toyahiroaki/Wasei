//
//  SoundPlayer.swift
//  Wasei
//
//  Created by 外谷浩章 on 2025/09/10.
//
import Foundation

import UIKit
import AVFoundation


class SoundPlayer: NSObject {

    
    
    var music_player: AVAudioPlayer!

    // 音楽を再生
    func musicPlayer(filename: String){
        
        //let music_data=NSDataAsset(name: "Violin_B2")!.data   // 音源の指定
        let music_data=NSDataAsset(name: filename)!.data   // 音源の指定

        do{
            music_player=try AVAudioPlayer(data:music_data)   // 音楽を指定
            //music_player.stop()
            //music_player.currentTime = 0.0
            music_player.play();
        }catch{
            print("エラー発生.音を流せません")
        }

    }
    
    // 音楽を停止
    func stopAllMusic (){
        music_player?.stop()
    }
}
