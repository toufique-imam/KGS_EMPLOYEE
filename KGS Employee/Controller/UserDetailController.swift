//
//  UserDetailController.swift
//  KGS Employee
//
//  Created by Nuhash on 5/30/22.
//

import UIKit

class UserDetailController: UIViewController {
    
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var dummyView: UIView!
    @IBOutlet weak var userCollectionView: UserDetailCollectionView!
    var user : User = CurrentUser.shared.getCurrentUser()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationController()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initKeyboardNotification()
        initialize()
        self.hideKeyboardWhenTappedAround()
        imageMain.layer.cornerRadius =  0.5 * imageMain.bounds.size.width
    }
    
    private func initNavigationController(){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func initialize(){
        //TODO: get current user from CurrentUser
        //set the views
        dummyView.clipsToBounds = true
        dummyView.layer.cornerRadius = 10
        dummyView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        dummyView.dropShadowRectTop(color: UIColor.init(named: "DropShadow")!, opacity: 1.0,
                                    offset: CGSize(width: 5, height: 5), radius: 30, scale: false)
        
        //let user = CurrentUser.shared.getCurrentUser()
        if let image = User.loadImage(for: user) {
            loadImage(image: image)
        }
        userCollectionView.user = user
        userCollectionView.touchDownDelegate = self
        userCollectionView.initialize()
        
    }
    @IBAction func updateImage(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ?.camera : .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated:true)
    }
    func loadImage(image : UIImage){
        imageMain.image = image
        imageBackground.image = imageMain.image?.blurImage(blurAmount: 46)
    }
}

//MARK: keyboard
extension UserDetailController {
    func initKeyboardNotification(){
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(_ notification : Notification){
        adjustInsetForKeyboard(true, notification: notification)
    }
    @objc func keyboardWillHide(_ notification : Notification){
        adjustInsetForKeyboard(false, notification: notification)
    }
    
    func adjustInsetForKeyboard(_ show : Bool , notification : Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame =  userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else {
            return
        }
        let adjustmentHeight = (keyboardFrame.cgRectValue.height + 20) * (show ? 1 : -1)
        print(adjustmentHeight , userCollectionView.contentInset)
        userCollectionView.contentInset.bottom += adjustmentHeight
        userCollectionView.verticalScrollIndicatorInsets.bottom += adjustmentHeight
        
        print(userCollectionView.contentInset)
    }
}

extension UserDetailController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {
            return
        }
        loadImage(image: selectedImage)
        User.saveImage(selectedImage, for: user)
        dismiss(animated: true)
    }
}

extension UserDetailController : TouchDownDelegate {
    
    func updateText(for header: String, value: String)->Bool {
        if(!value.isEmpty && !header.isEmpty && user.updateValue(for: header, value: value)){
            CurrentUser.shared.setLoginUser(user: user)
            return true
        }else{
            invalidData(for: header, value: value)
            return false 
        }
    }
    func touchDown(indexPath: IndexPath) {
        //self.userCollectionView.scrollToItem(at: indexPath, at: .top, animated: true)
    }
    
    func invalidData(for header : String , value:String){
        // create the alert
        let alert = UIAlertController(title: "Invalid Input", message: "Input : \(value) for \(header) is not correct", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
