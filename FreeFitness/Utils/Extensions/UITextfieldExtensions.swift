//
//  TextfieldExtension.swift
//  FreeFitness
//
//  Created by W.D. on 20/04/22.
//

import UIKit

extension UITextField {
    
    func setLeftIcon(_ image: UIImage, _ color: UIColor) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = color
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 15, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
}
