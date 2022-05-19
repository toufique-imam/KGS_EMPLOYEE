//
//  ViewController.swift
//  KGS Employee
//
//  Created by Nuhash on 5/19/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var viewForm: UIView!
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var imageViewBack: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTextField()
        // Do any additional setup after loading the view.
    }
    func initTextField(){
        textFieldUserName.setLeftIcon(iconName: "icon_username")
        textFieldPassword.setLeftIcon(iconName: "icon_password")
        textFieldPassword.roundBorder()
        textFieldUserName.roundBorder()
        viewForm.layer.cornerRadius = 10
        viewForm.dropShadow(color: .lightGray, opacity: 0.5, offset: CGSize(width: 1, height: -1), radius: 20, scale: false)
        
        buttonLogin.createRoundButton()
        
        
        let startColor = UIColor(red: 59, green: 129, blue: 47, alpha: 1)
        let endColor = UIColor(red: 159, green: 197, blue: 38, alpha: 1)
        
//        gradient.colors = [startColor , endColor]
//        gradient.locations = [0.0 , 1.0]
//        tempView.layer.addSublayer(gradient)
        
        imageViewBack.addBlackGradientLayerInForeground(frame: imageViewBack.bounds, colors: [startColor , endColor])
        
    }

}

