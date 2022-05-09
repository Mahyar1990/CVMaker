//
//  UIImageViewExtension.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension UIImageView {
    
    func setupMyCustomStyle() {
        setupMyCustomStyle(contentMode: nil, tintColor: nil)
    }
    func setupMyCustomStyle(contentMode: UIView.ContentMode?,
                            tintColor: UIColor?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = contentMode ?? .scaleAspectFit
        self.tintColor = tintColor ?? UIColor.darkGray
    }
    
}

