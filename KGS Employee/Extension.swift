//
//  UITextFieldWIconBorder.swift
//  KGS Employee
//
//  Created by Nuhash on 5/19/22.
//

import UIKit

extension UITextField {
    func setLeftIcon(iconName : String){
        print("here")
        self.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
        self.leftViewMode = .always
        //self.leftView?.backgroundColor = .blue
        let leftViewItSelf = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        leftViewItSelf.contentMode = .scaleAspectFit
        leftViewItSelf.image = UIImage(named: iconName)
        leftView?.addSubview(leftViewItSelf)
    }
    func roundBorder(){
        self.borderStyle = .roundedRect
        
        // self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.darkText.cgColor
    }
}

extension UIView {
    func dropShadow(color : UIColor , opacity : Float = 0.5 , offset : CGSize , radius : CGFloat = 1 , scale : Bool = true){
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = false
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIButton {
    func createRoundButton(){
        layer.cornerRadius = 0.5 * bounds.size.width
        clipsToBounds = true
        
        layer.borderWidth = 10
        layer.borderColor = UIColor.white.cgColor
    }
}
