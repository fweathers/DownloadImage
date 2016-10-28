//
//  ViewController.swift
//  DownloadImage
//
//  Created by Felicia Weathers on 10/28/16.
//  Copyright © 2016 Felicia Weathers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://i.ytimg.com/vi/D1ze-f7jS2A/maxresdefault.jpg")!
        
        let request  = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                if let data = data { // avoids force unwrapping
                    
                    if let froningImage = UIImage(data: data) {
                        
                        self.imageView.image = froningImage
                        
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) // An array of search results. should contain only one item
                        
                        if documentsPath.count > 0 {
                            
                            let documentsDirectory = documentsPath[0]
                            
                            let savePath = documentsDirectory + "/froning.jpeg" // save image to local device
                            
                            do {
                                
                                try UIImageJPEGRepresentation(froningImage, 1)?.write(to: URL(fileURLWithPath: savePath))
                                
                            } catch {
                                
                                // process error
                                
                            }
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

