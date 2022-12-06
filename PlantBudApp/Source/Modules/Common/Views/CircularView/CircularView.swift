//
//  CircularView.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

/// Circular UIView - drawn using UIBezierPath.
final public class CircularView: UIView {
    
    /// Circle color. Default - mainTheme color.
    public var fillColor: UIColor = Color.brandGreen {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// Overriden bounds property.
    /// When bounds of view change we also update it's corner radius and shadow path so it looks as expected
    public override var bounds: CGRect {
        didSet {
            layer.cornerRadius = bounds.height / 2
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        }
    }
    
    /// Overriden draw metod.
    /// This is where the magic happens and circle path is being drawn and it's fill color being set.
    ///
    /// - Parameter rect: UIView rect.
    override public func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        backgroundColor = .clear
    }
}

