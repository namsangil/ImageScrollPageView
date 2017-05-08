//
//  ViewController.swift
//  ImageScrollPageView
//
//  Created by nam on 2017. 4. 17..
//  Copyright © 2017년 nam. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var pageControl : UIPageControl!
    @IBOutlet weak var imageScrollView : ImageScrollPageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imageScrollView.setPageControl(control: self.pageControl)
        let imageUrl = URL(string:"http://post.phinf.naver.net/MjAxNjExMDlfMTE2/MDAxNDc4NjY5NzE1OTI5.wjjhYxYpA02kyL4iZJ89pEB_ifpT0XlHvW5eLqEKtQsg.3hBLx10PbYrv28Wf2bc6wSZSD8g4mS9U1GwbFMTn4lcg.JPEG/I769KXmH-5ZFC_1l99zSc58aDMTI.jpg")
        
        
        self.imageScrollView.addImage(url: imageUrl)
        self.imageScrollView.addImage(url: imageUrl)
        self.imageScrollView.addImage(url: imageUrl)
        self.imageScrollView.addImage(url: imageUrl)
        self.imageScrollView.addImage(url: imageUrl)
        self.imageScrollView.addImage(url: imageUrl)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

