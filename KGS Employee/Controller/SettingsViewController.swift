//
//  SettingsViewController.swift
//  KGS Employee
//
//  Created by Nuhash on 5/25/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsCollectionView : SettingsCollectionView!
    @IBOutlet weak var buttonClose : UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //UIImage.init(named: <#T##String#>)
        self.navigationController?.navigationBar.isHidden = true
        guard let customFont = UIFont(name: "SFProDisplay-Medium", size: 16) else {
            fatalError("""
                Failed to load the "SFPRODISPLAY-REGULAR" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        buttonClose.titleLabel?.font = UIFontMetrics.default.scaledFont(for: customFont)
    }
    
    override func viewDidLoad() {
        settingsCollectionView.touchDownDelegate = self
        settingsCollectionView.initialize()
    }
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func goToLogin() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let loginvc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//        self.navigationController?.pushViewController(loginvc, animated: true)
        self.navigationController?.setViewControllers([loginvc], animated: true)
    }
    func goToUserDetails() {
        let storyboard = UIStoryboard.init(name: "UserDetail", bundle: nil)
        let userDetailPagevc = storyboard.instantiateViewController(withIdentifier: "UserDetailController") as! UserDetailController
        self.navigationController?.pushViewController(userDetailPagevc, animated: true)
    }
    
}

extension SettingsViewController : TouchDownDelegate {
    func touchDown(indexPath: IndexPath) {
        if(indexPath.row==0){
            goToUserDetails()
        }else {
            CurrentUser.shared.logout()
            goToLogin()
        }
    }
    
    func updateText(for header: String, value: String)->Bool {
        fatalError("should not be called here")
    }
}
