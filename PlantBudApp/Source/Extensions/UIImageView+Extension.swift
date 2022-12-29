//
//  UIImageView+Extension.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import Kingfisher
import UIKit

extension UIImageView {
    var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }

        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }

        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0

        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }
    
    func setImage(with url: URL?) {
        self.kf.setImage(with: url)
    }
    
    func setRoundedImage(with url: URL?){
        
        guard let url = url else {return}
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 50)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1))
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
    
    func setHexagonalMask() {
            let path = UIBezierPath()
            let sideLength = bounds.width / 2
            let center = CGPoint(x: bounds.midX, y: bounds.midY)
            let startPoint = CGPoint(x: center.x, y: center.y - sideLength)
            path.move(to: startPoint)
            path.addLine(to: CGPoint(x: center.x + sideLength, y: center.y - sideLength / 2))
            path.addLine(to: CGPoint(x: center.x + sideLength, y: center.y + sideLength / 2))
            path.addLine(to: CGPoint(x: center.x, y: center.y + sideLength))
            path.addLine(to: CGPoint(x: center.x - sideLength, y: center.y + sideLength / 2))
            path.addLine(to: CGPoint(x: center.x - sideLength, y: center.y - sideLength / 2))
            path.close()

            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
        }
}

