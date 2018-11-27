//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by Higher Visibility on 26/11/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var scrollview: UIScrollView!
    
    
    var pageControl : UIPageControl = UIPageControl(frame:CGRect(x: 50, y: 300, width: 200, height: 50))
    
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
        
         configurePageControl()
        
        
        
    }

    @objc func scrollProgrammatically(){
        
        //self.scrollview.setContentOffset(scrollview.contentOffset, animated: true)
//        var a = images.count
//        var b = Int(scrollview.contentSize.width)
//        var c = b/a
          //  self.scrollview.setContentOffset(CGPoint(x: c, y: 0), animated: true)
       // self.scrollview.setContentOffset(CGPoint(x: Int(scrollview.contentSize.width)/images.count, y: 0), animated: true)
    
    
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        
//        self.pageControl.tintColor = UIColor.red
//        self.pageControl.pageIndicatorTintColor = UIColor.black
//        self.pageControl.currentPageIndicatorTintColor = UIColor.green
        self.pageControl.addTarget(self, action: #selector(self.changePage), for: .valueChanged)
        
        self.view.addSubview(pageControl)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    @objc func changePage(){
        
        let x = CGFloat(self.pageControl.currentPage) * self.scrollview.frame.size.width
        self.scrollview.setContentOffset(CGPoint(x: x,y :0), animated: true)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.pageControl.currentPage = Int(pageNumber)
    }
    }


class CustomView:UIView{
    
    @IBOutlet weak var imageView: UIImageView!
   
}
