//
//  DrawView.swift
//  Lab3
//
//  Created by Eddie Livingstone on 9/29/17.
//  Copyright © 2017 Eddie Livingstone. All rights reserved.
//

import UIKit

class drawView: UIView
{
    

    var points:[CGPoint] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let x = (first.x + second.x)/2
        let y = (first.x + second.x)/2
        let midPoint = CGPoint(x: x, y: y)
        return midPoint
    }
    
    func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        if points.count < 2 { return path }
        let firstPoint = points[0]
        let secondPoint = points[1]
        let firstMidpoint = midpoint(first: firstPoint, second: secondPoint)
        path.move(to: firstPoint)
        path.addLine(to: firstMidpoint)
        for index in 1 ..< points.count-1 {
            let currentPoint = points[index]
            let nextPoint = points[index + 1]
            let midPoint = midpoint(first: currentPoint, second: nextPoint)
            path.addQuadCurve(to: midPoint, controlPoint: currentPoint)
        }
        guard let lastLocation = points.last else { return path }
        path.addLine(to: lastLocation)
        return path
    }
    
    func drawPath(point: CGPoint) {
        UIColor.green.setFill()
        let path = createQuadPath(points: points)
       // path.addLine(to: point)
        path.lineWidth = 1.0
        UIColor.black.setStroke()
        path.stroke()
    }
    
//    func updatePath(){
//        print("update center: \(point)")
//        setNeedsDisplay()
//    }
}
