//
//  ViewController.swift
//  GrandDispatchQueuing
//
//  Created by vignesh on 8/6/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       spinner.stopAnimating()
        
    }
    
    
    //We are going to use DispatchQueue.global to fetch data and DispatchQueue.main to update the UI. We use the main thread to update the UI since the main thread has a higher prioritization so it won’t freeze at all.
    
    //main does heavy work- updating the UI
    //global does light work- networking and fetching data.
    
    
    
    @IBAction func NextImageButtonAction(_ sender: Any) {
        
       let randomNum = Int(arc4random_uniform(9))
        chooseImage(imageNum: randomNum)
        
    }
    
    func fetchImageFromURL(imageURL: URL) {
        DispatchQueue.global(qos: DispatchQoS.userInitiated.qosClass).async {
            let fetch = NSData(contentsOf: imageURL)
            
            //UI updating
            
            DispatchQueue.main.async {
                if let imageData = fetch {
                    self.spinner.stopAnimating()
                    self.imageView.image = UIImage(data: imageData as Data)
                }
            }
        }
    }
    
    
    func chooseImage(imageNum: Int){
        spinner.startAnimating()
        var imageURL = URL(string: "")
        switch imageNum {
        case 0:
            imageURL = URL(string: "https://goo.gl/8q08OP")
        case 1:
            imageURL = URL(string: "https://goo.gl/cc23OE")
        case 2:
            imageURL = URL(string: "https://goo.gl/ZP6Bvh")
        case 3:
            imageURL = URL(string: "https://goo.gl/Vn9oqX")
        case 4:
            imageURL = URL(string: "https://goo.gl/GUxkqU")
        case 5:
            imageURL = URL(string: "https://goo.gl/jCLhhD")
        case 6:
            imageURL = URL(string: "https://goo.gl/UETU1G")
        case 7:
            imageURL = URL(string: "https://goo.gl/4v5RfE")
        case 8:
            imageURL = URL(string: "https://goo.gl/zJri4Z")
        case 9:
            imageURL = URL(string: "https://goo.gl/uQwgoy")
        default:
            break
        }
        
        fetchImageFromURL(imageURL: imageURL!)
        
        
    }
    
    

}

