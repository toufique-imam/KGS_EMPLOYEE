//
//  EmployeeDetailViewController.swift
//  KGS Employee
//
//  Created by Nuhash on 5/31/22.
//

import UIKit

class EmployeeDetailViewController: UIViewController {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var labelDepartment: UITextField!
    @IBOutlet weak var labelMail: UITextField!
    @IBOutlet weak var labelPhone: UITextField!
    @IBOutlet weak var labelDesignation: UILabel!
    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var imageMain: UIImageView!
    var userInfo : User? = nil
    let colorStart = UIColor.clear , colorMid = UIColor.init(red: 0, green: 0, blue: 0, a: 0.6) , colorEnd = UIColor.init(red: 0, green: 0, blue: 0, a: 0.9)
    
    @IBAction func closeTapped(_ sender: Any) {
        navigationController?.popViewControllerM()
//        navigationController?.popViewController(animated: true)
    }
    func addHeaderGradient(){
        gradientView.addGradientLayerInBackground(frame: gradientView.bounds, colors: [colorStart , colorMid , colorEnd])
        gradientView.alpha = 1
//        gradientView.dropShadow(color: UIColor.red, opacity: 0.5, offset: CGSize(width: 1, height: 1), radius: 10, scale: false)
    }
    func setupIconsInView(){
        labelMail.setLeftIcon(iconName: "icon_email_id")
        labelDepartment.setLeftIcon(iconName: "icon_ios")
        labelPhone.setLeftIcon(iconName: "icon_phone")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initView()
        setupIconsInView()
        if let user = userInfo {
            loadUserInfo(user: user)
        }
        addHeaderGradient()
    }
    func loadUserInfo(user: User){
        if let image = UIImage.init(named: user.name) {
            imageMain.image = image
        }else{
            imageMain.image = User.loadImage(for: user)
        }
        imageBackground.image = imageMain.image?.blurImage(blurAmount: 46)
        labelname.text = user.fullName
        labelMail.text = user.email
        labelPhone.text = user.phone
        labelDepartment.text = user.department
        labelDesignation.text = user.designation

    }
    
    func initView(){
        let colorDropShadow = UIColor.init(red: 0, green: 0, blue: 0 , a: 0.16)
        mainView.dropShadow(color: colorDropShadow, opacity: 1.0, offset: CGSize(width: 0, height: 2), radius: 6, scale: false)
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 10
//        mainView.layer.masksToBounds = true
        //rgba(0, 0, 0, 0.16)

    }
}
