//
//  ViewController.swift
//  Lab3
//
//  Created by Eddie Livingstone on 9/29/17.
//  Copyright © 2017 Eddie Livingstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var drawCanvas: drawView!
    var points:[CGPoint] = []
    var touchPoint: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawCanvas = drawView(frame: self.view.frame)
        view.addSubview(drawCanvas)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func clearScreen(_ sender: Any) {
//        drawCanvas.theLine = nil
//        drawCanvas.lines = []
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       let touchPoint = (touches.first)!.location(in: view) as CGPoint
        print("point is \(touchPoint)")
        drawCanvas.points.append(touchPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        drawCanvas.points.append(touchPoint)
        print("point is \(touchPoint)")

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
           let touchPoint = (touches.first)!.location(in: view) as CGPoint
            drawCanvas.points.append(touchPoint)
        }
}



