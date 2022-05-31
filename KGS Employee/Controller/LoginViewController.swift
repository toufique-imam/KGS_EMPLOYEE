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
   // @IBOutlet weak var imageViewBack: UIImageView!
    
    var isInit = false
    
    let startColor = UIColor(red: 59.0/255.0, green: 129.0/255.0, blue: 47.0/255.0, alpha: 1)
    let endColor = UIColor(red: 159.0/255.0, green: 197.0/255.0, blue: 38.0/255.0, alpha: 1)
        
    
    @IBOutlet weak var gradientViewTop: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationController()
        textFieldPassword.delegate = self
        textFieldUserName.delegate = self
        self.hideKeyboardWhenTappedAround()
        if(CurrentUser.shared.isLoggedIn()){
            StaticData.employees[0].insert(CurrentUser.shared.getCurrentUser()!, at: 0)
            gotoHomeViewController()
        }
    }
    
    private func initNavigationController(){
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if(!isInit){
            self.initializeViews()
            isInit = true
        }

    }
    
    private func gotoHomeViewController(){
        let storyboard = UIStoryboard.init(name: "HomePage", bundle: nil)
        let homepagevc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//            homepagevc.modalTransitionStyle = .fullScreen
//          self.present(homepagevc, animated: true)
        self.navigationController?.setViewControllers([homepagevc], animated: true)
    }
    @IBAction func loginAction(_ sender: UIButton) {
        let user = User()
        
        user.name = textFieldUserName.text ?? ""
        user.password = textFieldPassword.text ?? ""
        if(CurrentUser.shared.login(user: user)){
            StaticData.employees[0].insert(CurrentUser.shared.getCurrentUser()!, at: 0)
            gotoHomeViewController()
        }else{
            // create the alert
            let alert = UIAlertController(title: "Incorrect Login Info", message: "user :  \(user.name) with password : \(user.password) not found", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func initializeViews(){
        initTextField()
        initViewForm()
        initGradientView()
        initTextField()
        initLoginButton()
    }
    
    override func viewWillLayoutSubviews() {
        initLoginButton()
    }
    
    
    private func initGradientView(){
        gradientViewTop.addDiagonalGradientLayerInBackground(frame: gradientViewTop.bounds, colors: [startColor , endColor])
    }
    
    private func initViewForm(){
        viewForm.layer.cornerRadius = 10
        viewForm.dropShadow(color: .lightGray, opacity: 0.5, offset: CGSize(width: 1, height: -1), radius: 20, scale: false)
    }
    
    private func initLoginButton(){
        buttonLogin.dropShadowHalfRounded(color: .lightGray, opacity: 1, offset: CGSize(width: 1, height: -1), radius: 10, scale: false)
        buttonLogin.addGradientLayerInBackground(frame: buttonLogin.bounds, colors: [startColor , endColor] , cornerRadius: 0.5 * buttonLogin.bounds.size.width)

        buttonLogin.layer.cornerRadius =  0.5 * buttonLogin.bounds.size.width
    }

    private func initTextField(){
        textFieldUserName.setLeftIcon(iconName: "icon_username")
        textFieldPassword.setLeftIcon(iconName: "icon_password")
        textFieldPassword.roundBorder()
        textFieldUserName.roundBorder()
    }
}


extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == textFieldPassword){
            textField.resignFirstResponder()
        } else {
            textFieldPassword.becomeFirstResponder()
        }
        return true
    }
}
