//
//  UITextViewExtension.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

extension UITextView {
    
    func setupMyCustomStyle() {
        setupMyCustomStyle(textColor: nil, fontSize: nil, adjustFontSize: nil)
    }
    func setupMyCustomStyle(textColor: UIColor?) {
        setupMyCustomStyle(textColor: textColor, fontSize: nil, adjustFontSize: nil)
    }
    func setupMyCustomStyle(textColor: UIColor?,
                            fontSize: CGFloat?,
                            adjustFontSize: Bool?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = textColor ?? UIColor.black
        self.font = UIFont.mySystemFont(ofSize: fontSize ?? 18)
        self.textContainerInset = UIEdgeInsets(top: 4, left: 8, bottom: 0, right: 5)
    }
    
}
