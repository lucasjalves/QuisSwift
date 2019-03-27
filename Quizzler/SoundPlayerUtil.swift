//
//  SoundPlayerUtil.swift
//  Quizzler
//
//  Created by Lucas on 3/27/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
import AVFoundation

final class SoundPlayerUtil{
    static var player: AVAudioPlayer! = nil
    public static func tocarSom(forResource: String, ofType: String){
        let path = Bundle.main.path(forResource: forResource, ofType: ofType)
        let url = URL(fileURLWithPath: path ?? "")
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        }catch let err{
            print(err.localizedDescription)
        }
    }
}
