//
//  MovieViewController.swift
//  Confucianism in Korea
//
//  Created by Bridget Rossiter on 31/05/2016.
//  Copyright © 2016 Bridget Rossiter. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MovieViewController: UIViewController {
    
    var player: AVPlayer? = nil

    @IBOutlet var playerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoURL: NSURL = NSBundle.mainBundle().URLForResource("Test", withExtension: "mp4")!

        
        player = AVPlayer(URL: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.playerView.bounds
        self.playerView.layer.addSublayer(playerLayer)
        player!.play()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play(sender: AnyObject) {
        player!.play()
    }

    @IBAction func pause(sender: AnyObject) {
        player!.pause()
    }
    @IBAction func rewind(sender: AnyObject) {
        player!.pause()
        player!.seekToTime(kCMTimeZero)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

enum AppError : ErrorType {
    case InvalidResource(String, String)
}
