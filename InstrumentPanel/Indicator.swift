//
//  Indicator.swift
//  InstrumentPanel
//
//  Created by 臧其龙 on 16/3/7.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class Indicator: UIView {
    let indictor = UIColor(red: 1.000, green: 0.000, blue: 0.000, alpha: 1.000)
    let ovalColor = UIColor(red: 0.176, green: 0.251, blue: 0.318, alpha: 1.000)

    let bigOvalLayer = CAShapeLayer()
    let smallOvalLayer = CAShapeLayer()
    let triangleLayer = CAShapeLayer()
    var layerAnchorPoint:CGPoint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        //self.backgroundColor = UIColor.yellowColor()
        let width = CGRectGetWidth(frame)
        let height = CGRectGetHeight(frame)
        
        // 大圆的路径
        let bigOvalRect = CGRect(x: 0, y: height - width, width: width, height: width)
        let OvalPath = UIBezierPath(ovalInRect: bigOvalRect)
        bigOvalLayer.path = OvalPath.CGPath
        bigOvalLayer.strokeColor = ovalColor.CGColor
        bigOvalLayer.fillColor = ovalColor.CGColor
        self.layer.addSublayer(bigOvalLayer)
        
        // 小圆路径
        let smallOvalRect = CGRectInset(bigOvalRect, width/3, width/3)
        let smallOvalPath = UIBezierPath(ovalInRect: smallOvalRect)
        smallOvalLayer.path = smallOvalPath.CGPath
        smallOvalLayer.strokeColor = indictor.CGColor
        smallOvalLayer.fillColor = indictor.CGColor
        self.layer.addSublayer(smallOvalLayer)
        
        let topCenterPoint = CGPoint(x: width/2, y: 0)
        let smallOvalRadius = width/6
        let leftBottomPointX = CGRectGetMidX(smallOvalRect) - smallOvalRadius * CGFloat(cos(M_PI_2/90*75))
        let leftBottomPointY = CGRectGetMidY(smallOvalRect) - smallOvalRadius * CGFloat(sin(M_PI_2/90*75))
        let leftBottomPoint = CGPoint(x: leftBottomPointX, y: leftBottomPointY)
        let rightBottomPointX = CGRectGetMidX(smallOvalRect) - smallOvalRadius * CGFloat(cos(M_PI_2/90*105))
        let rightBottomPointY = CGRectGetMidY(smallOvalRect) - smallOvalRadius * CGFloat(sin(M_PI_2/90*105))
        let rightBottomPoint = CGPoint(x: rightBottomPointX, y: rightBottomPointY)
        
        // 三角路径
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(topCenterPoint)
        trianglePath.addLineToPoint(leftBottomPoint)
        trianglePath.addLineToPoint(rightBottomPoint)
        trianglePath.addLineToPoint(topCenterPoint)
        trianglePath.closePath()
        triangleLayer.path = trianglePath.CGPath
        triangleLayer.fillColor = indictor.CGColor
        triangleLayer.strokeColor = indictor.CGColor
        self.layer.addSublayer(triangleLayer)
        
        // 设置anchorPoint  
        layerAnchorPoint = CGPoint(x: 0.5, y: CGRectGetMidY(smallOvalRect)/height)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
