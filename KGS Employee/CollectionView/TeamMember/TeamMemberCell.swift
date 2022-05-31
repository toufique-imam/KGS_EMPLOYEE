//
//  TeamMemberCell.swift
//  KGS Employee
//
//  Created by Nuhash on 5/29/22.
//

import UIKit

class TeamMemberCell: UICollectionViewCell {

    @IBOutlet weak var imageView : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func loadCell(user: User){
        if let image =  UIImage.init(named: user.imagePath) {
            imageView.image = image
        }else{
            imageView.image = User.loadImage(for: user)
        }
        imageView.layer.cornerRadius = 10
    }
    func updateCellState(isSelected:Bool){
        if(isSelected){
            imageView.layer.borderColor = UIColor.darkGray.cgColor
            imageView.layer.borderWidth = 2;
        }else{
            imageView.layer.borderWidth = 0;
            imageView.layer.borderColor = UIColor.clear.cgColor
        }
    }

}
