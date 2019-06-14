//
//  VideoPlayerView.swift
//  LASDictionaryV4
//
//  Created by Jackie Norstrom on 6/14/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


//NEED TO LINK UP/FORM CONNECTION TO SIGNS CONTROLLER SO THE VIDEO CAN PLAY CORRECTLY.

class VideoPlayerView: UIView {
    
    var signs: Dictionary!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        
        //warning: NEED TO POSSIBLY CHANGE THE URL. AND ADD FIREBASE PODA
        let urlString = "https://firebasestorage.googleapis.com/v0/b/lasdictioanryv4.appspot.com/o/\(signs.name).mov?alt=media&token=b53450da-b65d-4c82-818c-1bca992e7642"
        //https://firebasestorage.googleapis.com/v0/b/lasdictioanryv4.appspot.com/o/-ance.mov?alt=media&token=b53450da-b65d-4c82-818c-1bca992e7642
        if let url = NSURL(string: urlString) {
            let player = AVPlayer(url: url as URL)
            
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            
            player.play()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoLauncher: NSObject {
    
    func showVideoPlayer() {
        print("Showing video player animation....")
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = UIColor.white
            
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            //16 x 9 is the aspect ratio of all HD videos
            let height = keyWindow.frame.width * 9 / 16
            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            view.addSubview(videoPlayerView)
            
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                view.frame = keyWindow.frame
                
            }, completion: { (completedAnimation) in
                //maybe we'll do something here later...
                let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
                statusBar.isHidden = true
                
            })
        }
    }
}
