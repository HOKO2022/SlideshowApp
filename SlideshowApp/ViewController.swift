//
//  ViewController.swift
//  SlideshowApp
//
//  Created by HOKO on 2022/02/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    let imageArray = [UIImage(named: "image1.jpeg"),
                      UIImage(named: "image2.jpeg"),
                      UIImage(named: "image3.jpeg"),
                      UIImage(named: "image4.jpeg"),
                      UIImage(named: "image5.jpeg")]
    
    var imageNum:Int = 0
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = imageArray[imageNum]
        imageView.image = image
    }
    
    @objc func slideShow(_ timer: Timer) {
        imageNum += 1
        if(imageNum > imageArray.count-1){
            imageNum = 0
        }
        let image = imageArray[imageNum]
        imageView.image = image
    }
    
    @IBAction func backImage(_ sender: Any) {
        if(self.timer == nil){
            imageNum -= 1
            if(imageNum < 0){
                imageNum = imageArray.count-1
            }
            let image = imageArray[imageNum]
            imageView.image = image
        }
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if(self.timer == nil){
            imageNum += 1
            if(imageNum > imageArray.count-1){
                imageNum = 0
            }
            let image = imageArray[imageNum]
            imageView.image = image
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        if(self.timer == nil){
            playButton.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideShow(_:)), userInfo: nil, repeats: true)
        }
        else{
            playButton.setTitle("再生", for: .normal)
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    @IBAction func imageButton(_ sender: Any) {
        if(self.timer != nil){
            playButton.setTitle("再生", for: .normal)
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
        imageViewController.imageNum = imageNum
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }

}

