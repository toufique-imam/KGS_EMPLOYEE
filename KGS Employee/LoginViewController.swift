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
    }

}

