//
//  UserDetailCell.swift
//  KGS Employee
//
//  Created by Nuhash on 5/30/22.
//

import UIKit

class UserDetailCell: UICollectionViewCell {

    @IBOutlet weak var labelHeader : UILabel!
    @IBOutlet weak var textField : UITextField!
    @IBOutlet weak var viewSeperator: UIView!
    @IBOutlet weak var buttonEdit: UIButton!
    @IBOutlet weak var buttonSubmit : UIButton!
    var indexNow : IndexPath? = nil
    var textPrev = ""
    
    weak var touchDownDelegate : TouchDownDelegate? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buttonEdit.loadFont(fontName: "Poppins-Medium", size: 14.0)
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        textPrev = textField.text ?? ""
        buttonEdit.isEnabled = false
        buttonEdit.isHidden = true
        
        buttonSubmit.isHidden = false
        buttonSubmit.isEnabled = true
        
        textField.isEnabled = true
        textField.becomeFirstResponder()
        if let indexNow = indexNow {
            touchDownDelegate?.touchDown(indexPath: indexNow)
        }
        print("okk")
    }
    
    @IBAction func submitButtonTapped(_ sender : UIButton) {
        buttonEdit.isEnabled = true
        buttonEdit.isHidden = false
        
        buttonSubmit.isHidden = true
        buttonSubmit.isEnabled = false
        
        textField.isEnabled = false
        
        if(touchDownDelegate?.updateText(for: labelHeader.text ?? "", value: textField.text ?? "" ) == false ) {
            textField.text = textPrev
        }
        
        print("okk2")
    }
    
    func loadCell(header:String , value:String){
        textField.text = value
        labelHeader.text = header
    }
    
}
