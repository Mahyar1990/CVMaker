//
//  UITextFieldExtension.swift
//  CVMaker
//
//  Created by Mahyar Jananeh on 5/9/22.
//

import UIKit

class TextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 5)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
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
        self.adjustsFontSizeToFitWidth = adjustFontSize ?? true
    }
}
