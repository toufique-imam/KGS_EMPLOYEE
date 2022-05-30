//
//  UITextFieldWIconBorder.swift
//  KGS Employee
//
//  Created by Nuhash on 5/19/22.
//

import UIKit

//MARK: Blur UIIMAGE
extension UIImage {
    func blurImage(blurAmount: CGFloat) -> UIImage? {
        let image = self;
        guard let ciImage = CIImage(image: image) else { return nil }
        let ciContext = CIContext(options: nil)
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter?.setValue(blurAmount, forKey: kCIInputRadiusKey)
        
        guard let blurOutput = blurFilter?.outputImage else { return nil }
        guard let cgimg = ciContext.createCGImage(blurOutput, from: ciImage.extent) else { return nil}
        let processedImage = UIImage(cgImage: cgimg)
        
        return processedImage
    }
    
}

extension FileManager {
  static var documentDirectoryURL: URL {
    return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

extension UITextField {
    func setLeftIcon(iconName : String){
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
    
    enum ShadowPath{
        case top
        case bottom
        case left
        case right
    }
    
    func getPath(for arr: [ShadowPath]) -> CGPath{
        let cgPath: CGMutablePath = CGMutablePath()
        if(arr.contains(.top)) {
            var boundNow:CGRect = self.bounds
            boundNow.size.height = 5
            let path = UIBezierPath.init( rect: boundNow).cgPath
            cgPath.addPath(path)
        }
        if(arr.contains(.bottom)){
            var boundNow:CGRect = self.bounds
            boundNow.origin.y += boundNow.size.height
            boundNow.size.height = 5
            let path = UIBezierPath.init( rect: boundNow).cgPath
            cgPath.addPath(path)
        }
        if(arr.contains(.left)){
            var boundNow:CGRect = self.bounds
            boundNow.size.width = 5
            let path = UIBezierPath.init( rect: boundNow).cgPath
            cgPath.addPath(path)
        }
        if(arr.contains(.right)){
            var boundNow:CGRect = self.bounds
            boundNow.origin.x += boundNow.size.width
            boundNow.size.width = 5
            let path = UIBezierPath.init( rect: boundNow).cgPath
            cgPath.addPath(path)
        }
        return cgPath
    }
    
    
    func dropShadowPath(_ bounds: CGPath, color : UIColor , opacity : Float = 0.5 , offset : CGSize , radius : CGFloat = 1 , scale : Bool = true){
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowPath = bounds
        layer.shouldRasterize = false
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    @objc func dropShadow(color : UIColor , opacity : Float = 0.5 , offset : CGSize , radius : CGFloat = 1 , scale : Bool = true){
        let path = UIBezierPath(rect: self.bounds).cgPath
        dropShadowPath(path, color: color, opacity: opacity, offset: offset, radius: radius, scale: scale)
    }
    
    func dropShadowHalfRounded(color : UIColor , opacity : Float = 0.5 , offset : CGSize , radius : CGFloat = 1 , scale : Bool = true){
        
        let path = UIBezierPath(arcCenter: CGPoint(x: layer.bounds.width / 2, y: layer.bounds.height / 2), radius: layer.frame.width / 2 , startAngle: 0.14, endAngle: 3.0, clockwise: true).cgPath
        dropShadowPath(path, color: color, opacity: opacity, offset: offset, radius: radius, scale: scale)
    }
    func dropShadowRounded(color : UIColor , opacity : Float = 0.5 , offset : CGSize , radius : CGFloat = 1 , scale : Bool = true){
        let path = UIBezierPath.init(ovalIn: self.bounds).cgPath
        dropShadowPath(path, color: color, opacity: opacity, offset: offset, radius: radius, scale: scale)
    }
    func dropShadowRectTop(color: UIColor , opacity : Float = 0.5 , offset :CGSize , radius : CGFloat = 1 , scale : Bool = true){
        var boundNow:CGRect = self.bounds
        boundNow.size.height = 5
        let path = UIBezierPath.init( rect: boundNow).cgPath
        dropShadowPath(path, color: color, opacity: opacity, offset: offset, radius: radius, scale: scale)
    }
    
    func dropShadowRectBottom(color: UIColor , opacity : Float = 0.5 , offset :CGSize , radius : CGFloat = 1 , scale : Bool = true){
        var boundNow:CGRect = self.bounds
        boundNow.origin.y += boundNow.size.height+5
        boundNow.size.height = 5
        let path = UIBezierPath.init( rect: boundNow).cgPath
        dropShadowPath(path, color: color, opacity: opacity, offset: offset, radius: radius, scale: scale)
    }
    
    func dropShadowRectLeading(color: UIColor , opacity : Float = 0.5 , offset :CGSize , radius : CGFloat = 1 , scale : Bool = true){
        var boundNow:CGRect = self.bounds
        boundNow.size.width = 5
        let path = UIBezierPath.init( rect: boundNow).cgPath
        dropShadowPath(path, color: color, opacity: opacity, offset: offset, radius: radius, scale: scale)
    }
    
    
    func dropShadowRectTrailing(color: UIColor , opacity : Float = 0.5 , offset :CGSize , radius : CGFloat = 1 , scale : Bool = true){
        var boundNow:CGRect = self.bounds
        boundNow.origin.x += boundNow.size.width+5
        boundNow.size.width = 5
        let path = UIBezierPath.init( rect: boundNow).cgPath
        dropShadowPath(path, color: color, opacity: opacity, offset: offset, radius: radius, scale: scale)
    }
}

//MARK: UIView gradient
extension UIView{
    // For insert layer in background
    func addDiagonalGradientLayerInBackground(frame: CGRect, colors:[UIColor] , cornerRadius : CGFloat? = nil , startPoint: CGPoint = CGPoint.zero, endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0) ){
        
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        gradient.startPoint  = startPoint
        gradient.masksToBounds = true
        gradient.endPoint = endPoint
        if let cornerRadius = cornerRadius {
            gradient.cornerRadius = cornerRadius
        }
        layer.insertSublayer(gradient, at: 0)
    }
    
    func addGradientLayerInBackground(frame: CGRect, colors:[UIColor] , cornerRadius : CGFloat? = nil  , locations:[NSNumber] = [0.0 , 1.0]){
        
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        gradient.masksToBounds = true
        gradient.locations = locations
        if let cornerRadius = cornerRadius {
            gradient.cornerRadius = cornerRadius
        }
        layer.insertSublayer(gradient, at: 0)
    }
    
}

//MARK: UIButton titleLabel Custom Font
extension UIButton {
    func loadFont(fontName:String , size : CGFloat = 14){
        if let customFont = UIFont(name: fontName, size: size) {
            self.titleLabel?.font = UIFontMetrics.default.scaledFont(for: customFont)
        } else {
            print("""
                Failed to load the "\(fontName)" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
    }
}
//MARK: UIColor from hex
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    @objc static func colorFromHexCode(colorCode:Int)->UIColor{
        return UIColor(colorCode: colorCode);
    }
    
    convenience init(colorCode rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(colorCode rgb: Int, alpha a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}
