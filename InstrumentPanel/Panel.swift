//
//  Panel.swift
//  InstrumentPanel
//
//  Created by 臧其龙 on 16/3/7.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class Panel: UIView {
    
    let markInset:CGFloat = 20
    let markWidth = 12
    let angleRatio:CGFloat = CGFloat(M_PI_2)/30.0
    let range1 = 110...120
    let range2 = 0...70
    var radiusOfOval:CGFloat!
    var radius:CGFloat!
    let indicatorView = Indicator(frame: CGRect(x: 0, y: 0, width: 39, height: 90))
    
    let titleArray1 = ["0", "256k"]
    let titleArray2 = ["512k","1M", "5M", "10M", "20M", "50M", "100+M"]

    override init(frame: CGRect) {
        super.init(frame: frame)

        radius = CGRectGetWidth(frame)/2
        radiusOfOval = CGRectGetWidth(frame)/2 - markInset
        
        if let anchorPoint = indicatorView.layerAnchorPoint {
            indicatorView.layer.anchorPoint = anchorPoint
            indicatorView.layer.position = CGPoint(x:CGRectGetWidth(frame)/2, y:CGRectGetHeight(frame)/2)
            indicatorView.transform = CGAffineTransformMakeRotation(-CGFloat(M_PI_2)*4/3)
            self.addSubview(indicatorView)

        }
        
        for index in range1 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: markWidth, height: 1))
            if index % 10 == 0 {
                view.frame = CGRect(x: 0, y: 0, width: 15, height: 1)
                
                let arrayIndex = index/10%10 - 1
                let label = UILabel(frame: CGRectZero)
                label.font = UIFont.systemFontOfSize(12)
                label.textColor = UIColor.whiteColor()
                label.text = titleArray1[arrayIndex]
                let labelCenterX = CGRectGetWidth(frame)/2 - radius * cos(CGFloat(index) * angleRatio)
                let labelCenterY = CGRectGetHeight(frame)/2 - radius * sin(CGFloat(index) * angleRatio)
                label.sizeToFit()
                label.center = CGPoint(x: labelCenterX, y: labelCenterY)
                self.addSubview(label)
                
            }
            let centerX = CGRectGetWidth(frame)/2 - radiusOfOval * cos(CGFloat(index) * angleRatio)
            let centerY = CGRectGetHeight(frame)/2 - radiusOfOval * sin(CGFloat(index) * angleRatio)
            view.backgroundColor = UIColor.greenColor()
            view.transform = CGAffineTransformMakeRotation(CGFloat(index) * angleRatio)
            view.center = CGPoint(x: centerX, y: centerY)
            self.addSubview(view)
            
        }
        
        for index in range2 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
            if index % 10 == 0 {
                view.frame = CGRect(x: 0, y: 0, width: 15, height: 1)
                
                let arrayIndex = index/10
                if arrayIndex != 0 {
                    let label = UILabel(frame: CGRectZero)
                    label.font = UIFont.systemFontOfSize(12)
                    label.textColor = UIColor.whiteColor()
                    label.text = titleArray2[arrayIndex-1]
                    let labelCenterX = CGRectGetWidth(frame)/2 - radius * cos(CGFloat(index) * angleRatio)
                    let labelCenterY = CGRectGetHeight(frame)/2 - radius * sin(CGFloat(index) * angleRatio)
                    label.sizeToFit()
                    label.center = CGPoint(x: labelCenterX, y: labelCenterY)
                    self.addSubview(label)
                }
                

            }
            let centerX = CGRectGetWidth(frame)/2 - radiusOfOval * cos(CGFloat(index) * angleRatio)
            let centerY = CGRectGetHeight(frame)/2 - radiusOfOval * sin(CGFloat(index) * angleRatio)
            view.backgroundColor = UIColor.greenColor()
            view.transform = CGAffineTransformMakeRotation(CGFloat(index) * angleRatio)
            view.center = CGPoint(x: centerX, y: centerY)
            self.addSubview(view)
        }
    }
    
    func setIndicatorTransform(angle:CGFloat) {
         indicatorView.transform = CGAffineTransformMakeRotation(angle)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}
