//  ScrollViewController.swift
//  FastFive
//
//  Created by nam on 2017. 3. 26..
//  Copyright © 2017년 FastFive. All rights reserved.
//

import UIKit
protocol ImageScrollPageViewDelegate{
    func imageTouch(IndexId id :String?)
}

class ImageScrollPageView : UIScrollView, UIScrollViewDelegate{
    var pageControl : UIPageControl?
    var images = [UIImageView]()
    var pageNumber : Int = 0
    var scrollWidth : CGFloat!
    var scrollHeight : CGFloat!
    var contentWidth: CGFloat = 0.0
    var feedImageScrollViewDelegate : ImageScrollPageViewDelegate?
    
    
    var indexId : String?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isPagingEnabled = true
        self.delegate = self
        scrollWidth = self.frame.size.width
        scrollHeight = self.frame.size.height
        self.clipsToBounds = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(imageTouch))
        self.addGestureRecognizer(gesture)
        
    }
    
    override func layoutSubviews() {
        var index : Int = 0
        self.scrollWidth = self.frame.width
        self.scrollHeight = self.frame.height
        for view in self.subviews{
            let imageView = view as! UIImageView
            let showX = self.scrollWidth * CGFloat(index)
            imageView.frame = CGRect(x: showX, y: 0, width: self.scrollWidth, height: self.scrollHeight)
            index += 1
        }
    }
    
    func getPageNumber()->Int{
        
        return self.pageNumber
        
    }
    func beginSetting(IndexId indexId : String?){
        self.indexId = indexId
        self.images.removeAll()
        self.pageNumber = 0
        self.contentWidth = 0
        for view in self.subviews{
            view.removeFromSuperview()
        }
        
    }
    
    func addImage(strigUrl IMAGEURL : String?){
        if let imageUrl = IMAGEURL, imageUrl != ""{
            let url = URL(string:imageUrl)
            let showX = self.scrollWidth * CGFloat(self.pageNumber)
            let imageView = UIImageView(frame: CGRect(x: showX, y: 0, width: self.scrollWidth, height: self.scrollHeight))
            imageView.af_setImage(withURL: url!)
            self.images.append(imageView)
            self.addSubview(imageView)
            self.pageNumber = images.count
            pageControl?.numberOfPages = self.pageNumber
            self.contentWidth = self.scrollWidth * CGFloat(self.getPageNumber())
            self.contentSize = CGSize(width: self.contentWidth, height: self.scrollHeight )
            
        }
    }
    
    func addImage(url IMAGEURL : URL?){
        if let imageUrl = IMAGEURL{
            let stringUrl = imageUrl.absoluteString
            addImage(strigUrl:stringUrl)
        }
    }
    
    
    func imageTouch(){
        self.feedImageScrollViewDelegate?.imageTouch(IndexId : self.indexId)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(self.contentOffset.x / self.frame.width)
        self.pageControl?.currentPage = index
    }
    
    func setPageControl(control pageControl : UIPageControl){
        self.pageControl = pageControl
        self.pageControl?.numberOfPages = 1
        self.pageControl?.currentPage = 0
    }
    
}
