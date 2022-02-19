//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by HOKO on 2022/02/18.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    let imageArray = [UIImage(named: "image1.jpeg"),
                      UIImage(named: "image2.jpeg"),
                      UIImage(named: "image3.jpeg"),
                      UIImage(named: "image4.jpeg"),
                      UIImage(named: "image5.jpeg")]
    
    var imageNum:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = imageArray[imageNum]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
