//
//  UIImageViewExtensions.swift
//  FreeFitness
//
//  Created by J.R. on 27/04/22.
//

import UIKit

extension UIImageView {
    
    static var imageService = ImageService()

    func downloaded(from urlString: String?, placeHolder: UIImage?, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let urlString = urlString,let url = URL(string: urlString) else {
            self.image = placeHolder
            return
        }
        downloaded(from: url, placeHolder: placeHolder, contentMode: mode)
    }

    func downloaded(from url: URL, placeHolder: UIImage?, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        UIImageView.imageService.image(for: url) { image in
            self.image = image ?? placeHolder
        }
    }

}
