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
    
    var questionNumber = 0;
    var player: AVPlayer? = nil
    var media: Media?
    var mediaName: String?
    var playerLayer: AVPlayerLayer!

    @IBOutlet var playerView: UIView!
    @IBOutlet var questionTitle: UILabel!
    
    func nextQuestion(){
        if questionNumber == 3 {
            questionNumber = 0

        }
        else {
            questionNumber = questionNumber + 1
        }
        questionTitle.text = "Question " +  (String)(questionNumber + 1)
        loadMovie()
    }
    
    func loadMovie() {
        player?.pause()
        if (media?.imageMovies![questionNumber] == "NA") {
            return;
        }
        let videoURL: NSURL = NSBundle.mainBundle().URLForResource(media?.imageMovies![questionNumber], withExtension: "mov")!
        
        
        player = AVPlayer(URL: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.playerView.bounds
        self.playerView.layer.addSublayer(playerLayer)
        
        player!.play()

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MovieViewController.rotated), name: UIDeviceOrientationDidChangeNotification, object: nil)

        media = Media(mediaName: mediaName!)
        questionTitle.text = "Question " +  (String)(questionNumber + 1)

        loadMovie()
    }
    
    func rotated()
    {
        if(UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation))
        {
            playerLayer.frame = self.playerView.bounds
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation))
        {
            playerLayer.frame = self.playerView.bounds
        }
        
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "question") {
            let destinationVC = segue.destinationViewController as! QuestionTableViewController
            destinationVC.movieViewController = self
            destinationVC.type = self.media?.type
            destinationVC.questionNumber = self.questionNumber
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}

enum AppError : ErrorType {
    case InvalidResource(String, String)
}
