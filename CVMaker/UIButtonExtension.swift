//
//  UIButtonExtension.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension UIButton {
    
    func setupMyCustomStyle() {
        setupMyCustomStyle(contentMode: nil, fontSize: nil, fontColor: nil)
    }
    func setupMyCustomStyle(contentMode: UIView.ContentMode?,
                            fontSize: CGFloat?,
                            fontColor: UIColor?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.contentMode = contentMode ?? .scaleAspectFit
        self.contentMode = .scaleAspectFit
        self.titleLabel?.font = UIFont.myBoldSystemFont(ofSize: fontSize ?? 18)
        self.setTitleColor(fontColor ?? UIColor.blue, for: state)
    }
    
}

