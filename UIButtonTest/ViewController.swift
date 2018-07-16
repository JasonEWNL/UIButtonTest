//
//  ViewController.swift
//  UIButtonTest
//
//  Created by JasonEWNL on 2018/7/11.
//  Copyright © 2018年 TWT Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var topImageButton = UIButton()
    
    // move
    var upButton = UIButton()
    var rightButton = UIButton()
    var downButton = UIButton()
    var leftButton = UIButton()
    
    // turn
    var rightTurnButton = UIButton()
    var leftTurnButton = UIButton()
    
    // zoom
    var zoomInButton = UIButton()
    var zoomOutButton = UIButton()
    
    // reset
    var resetButton = UIButton()
    
    override func viewDidLoad() {
        
        let xw = view.frame.size.width
        let yh = view.frame.size.height
        
        super.viewDidLoad()
        
        topImageButton.frame.size = CGSize(width: 120, height: 120)
        topImageButton.center = CGPoint(x: xw/2, y: yh/4)
        topImageButton.setImage(#imageLiteral(resourceName: "full-moon-with-face"), for: .normal)
        topImageButton.setImage(#imageLiteral(resourceName: "new-moon-with-face"), for: .highlighted)
        topImageButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        self.view.addSubview(topImageButton)
        
        // move
        upButton.frame.size = CGSize(width: 50, height: 50)
        upButton.center = CGPoint(x: xw/4, y: yh*3/4)
        upButton.setImage(#imageLiteral(resourceName: "up"), for: .normal)
        upButton.addTarget(self, action: #selector(move), for: .touchUpInside)
        self.view.addSubview(upButton)
        
        rightButton.frame.size = CGSize(width: 50, height: 50)
        rightButton.center = CGPoint(x: xw/4+50, y: yh*3/4+50)
        rightButton.setImage(#imageLiteral(resourceName: "right"), for: .normal)
        rightButton.addTarget(self, action: #selector(move), for: .touchUpInside)
        self.view.addSubview(rightButton)
        
        downButton.frame.size = CGSize(width: 50, height: 50)
        downButton.center = CGPoint(x: xw/4, y: yh*3/4+100)
        downButton.setImage(#imageLiteral(resourceName: "down"), for: .normal)
        downButton.addTarget(self, action: #selector(move), for: .touchUpInside)
        self.view.addSubview(downButton)
        
        leftButton.frame.size = CGSize(width: 50, height: 50)
        leftButton.center = CGPoint(x: xw/4-50, y: yh*3/4+50)
        leftButton.setImage(#imageLiteral(resourceName: "left"), for: .normal)
        leftButton.addTarget(self, action: #selector(move), for: .touchUpInside)
        self.view.addSubview(leftButton)
        
        // turn
        rightTurnButton.frame.size = CGSize(width: 50, height: 50)
        rightTurnButton.center = CGPoint(x: xw/4+150, y: yh*3/4+12.5)
        rightTurnButton.setImage(#imageLiteral(resourceName: "right-turn"), for: .normal)
        rightTurnButton.addTarget(self, action: #selector(turn), for: .touchUpInside)
        self.view.addSubview(rightTurnButton)
        
        leftTurnButton.frame.size = CGSize(width: 50, height: 50)
        leftTurnButton.center = CGPoint(x: xw/4+225, y: yh*3/4+12.5)
        leftTurnButton.setImage(#imageLiteral(resourceName: "left-turn"), for: .normal)
        leftTurnButton.addTarget(self, action: #selector(turn), for: .touchUpInside)
        self.view.addSubview(leftTurnButton)
        
        // zoom
        zoomInButton.frame.size = CGSize(width: 50, height: 50)
        zoomInButton.center = CGPoint(x: xw/4+150, y: yh*3/4+87.5)
        zoomInButton.setImage(#imageLiteral(resourceName: "zoom-in"), for: .normal)
        zoomInButton.addTarget(self, action: #selector(zoom), for: .touchUpInside)
        self.view.addSubview(zoomInButton)
        
        zoomOutButton.frame.size = CGSize(width: 50, height: 50)
        zoomOutButton.center = CGPoint(x: xw/4+225, y: yh*3/4+87.5)
        zoomOutButton.setImage(#imageLiteral(resourceName: "zoom-out"), for: .normal)
        zoomOutButton.addTarget(self, action: #selector(zoom), for: .touchUpInside)
        self.view.addSubview(zoomOutButton)
        
        // reset
        resetButton.frame.size = CGSize(width: 50, height: 50)
        resetButton.center = CGPoint(x: xw/4, y: yh*3/4+50)
        resetButton.setImage(#imageLiteral(resourceName: "circle"), for: .normal)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        self.view.addSubview(resetButton)
        
    }
    
    @objc func move(moveButton: UIButton) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        
        var tempFrame = topImageButton.frame
        switch moveButton {
        case upButton:
            tempFrame.origin.y -= topImageButton.frame.size.height/6
        case rightButton:
            tempFrame.origin.x += topImageButton.frame.size.width/6
        case downButton:
            tempFrame.origin.y += topImageButton.frame.size.height/6
        case leftButton:
            tempFrame.origin.x -= topImageButton.frame.size.width/6
        default:
            break
        }
        topImageButton.frame = tempFrame
        
        UIView.commitAnimations()
    }
    
    @objc func turn(turnButton: UIButton) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        
        switch turnButton {
        case rightTurnButton:
            topImageButton.transform = topImageButton.transform.rotated(by: CGFloat(Double.pi/2))
            turnButton.transform = turnButton.transform.rotated(by: CGFloat(Double.pi))
            turnButton.transform = turnButton.transform.rotated(by: CGFloat(Double.pi))
        case leftTurnButton:
            topImageButton.transform = topImageButton.transform.rotated(by: -CGFloat(Double.pi/2))
            turnButton.transform = turnButton.transform.rotated(by: -CGFloat(Double.pi*2/3))
            turnButton.transform = turnButton.transform.rotated(by: -CGFloat(Double.pi)*2/3)
            turnButton.transform = turnButton.transform.rotated(by: -CGFloat(Double.pi)*2/3)
        default:
            break
        }
        
        UIView.commitAnimations()
    }
    
    @objc func zoom(zoomButton: UIButton) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        
        switch zoomButton {
        case zoomInButton:
            topImageButton.transform = topImageButton.transform.scaledBy(x: 7/6, y: 7/6)
        case zoomOutButton:
            topImageButton.transform = topImageButton.transform.scaledBy(x: 6/7, y: 6/7)
        default:
            break
        }
        
        UIView.commitAnimations()
    }
    
    @objc func reset(resetButton: UIButton) {
        let xw = view.frame.size.width
        let yh = view.frame.size.height
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        
        topImageButton.transform = CGAffineTransform.identity
        topImageButton.frame.size = CGSize(width: 120, height: 120)
        topImageButton.center = CGPoint(x: xw/2, y: yh/4)
        
        UIView.commitAnimations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
