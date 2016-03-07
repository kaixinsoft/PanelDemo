//
//  ViewController.swift
//  InstrumentPanel
//
//  Created by 臧其龙 on 16/3/7.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let panelView = Panel(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        panelView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(panelView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func handleIndictorTransform(sender:UISlider) {
        panelView.setIndicatorTransform(CGFloat(sender.value) * CGFloat(M_PI_2)/CGFloat(90))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

