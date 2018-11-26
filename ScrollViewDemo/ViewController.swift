//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by Higher Visibility on 26/11/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    
    var timer = Timer()
    
    var images:[String] = ["1.jpeg","3.jpeg","5.jpeg","7.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollview.delegate = self
        self.scrollview.contentSize.width = self.scrollview.frame.width * CGFloat((self.images.count))
        self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.scrollProgrammatically), userInfo: nil, repeats: true)
        
        var i = 0
        
        for data in self.images{
            
            let myview = Bundle.main.loadNibNamed("View", owner: self, options: nil)![0] as? CustomView
            myview?.imageView.image = UIImage(named: data)
            myview?.imageView.contentMode = .scaleAspectFit
            
            let frame = CGRect(x: 10 + (self.scrollview.frame.width * CGFloat(i)), y: 0, width: self.scrollview.frame.width - 20, height: self.scrollview.frame.height)
            myview?.frame = frame
            self.scrollview.addSubview(myview!)
            i += 1
        }
        
    }

    @objc func scrollProgrammatically(){
        
        self.scrollview.setContentOffset(scrollview.contentOffset, animated: true)
//        var a = images.count
//        var b = Int(scrollview.contentSize.width)
//        var c = b/a
          //  self.scrollview.setContentOffset(CGPoint(x: c, y: 0), animated: true)
        self.scrollview.setContentOffset(CGPoint(x: Int(scrollview.contentSize.width)/images.count, y: 0), animated: true)
    
       
        
        
    }
    
        
    }


extension ViewController:UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
      
        
    }
    
    
}
class CustomView:UIView{
    
    @IBOutlet weak var imageView: UIImageView!
   
}
