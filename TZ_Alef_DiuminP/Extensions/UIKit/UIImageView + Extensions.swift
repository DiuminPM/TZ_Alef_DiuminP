//
//  UIImageView + Extensions.swift
//  TZ_Alef_DiuminP
//
//  Created by DiuminPM on 14.02.2022.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
