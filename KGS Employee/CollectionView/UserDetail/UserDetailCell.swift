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
    //@IBOutlet weak var buttonSubmit : UIButton!
    var indexNow : IndexPath? = nil
    var textPrev = ""
    var isEditing = false
    weak var touchDownDelegate : TouchDownDelegate? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buttonEdit.loadFont(fontName: "Poppins-Medium", size: 14.0)
    }
    
    func submitText(){
        buttonEdit.setTitle("Edit", for: .normal)
        textField.isEnabled = false
        textField.resignFirstResponder()
        if(touchDownDelegate?.updateText(for: labelHeader.text ?? "", value: textField.text ?? "" ) == false ) {
            textField.text = textPrev
        }
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        textPrev = textField.text ?? ""
        if(!isEditing){
            buttonEdit.setTitle("Submit", for: .normal)
            
            textField.isEnabled = true
            textField.becomeFirstResponder()
            if let indexNow = indexNow {
                touchDownDelegate?.touchDown(indexPath: indexNow)
            }
            print("okk")
        }else{
            submitText()
            print("okk1")
        }
        isEditing = !isEditing
    }
    
    func loadCell(header:String , value:String){
        textField.text = value
        labelHeader.text = header
        buttonEdit.setTitle("Edit", for: .normal)
    }
}

extension UserDetailCell : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty
        else {
            return true
        }
        submitText()
        return true
    }
}
