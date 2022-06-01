//
//  UserDetailCollectionView.swift
//  KGS Employee
//
//  Created by Nuhash on 5/30/22.
//

import UIKit

class UserDetailCollectionView: UICollectionView {
    let cellId = "UserDetailCell"
    var user : User? = nil
    let itemsPerRow : CGFloat = 1
    let sectionInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    weak var touchDownDelegate : TouchDownDelegate? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let cell = UINib(nibName: cellId, bundle: nil)
        self.register(cell, forCellWithReuseIdentifier: cellId)
    }
    func initialize(){
        self.delegate = self
        self.dataSource = self
        self.reloadData()
    }
}

extension UserDetailCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StaticData.userDetailHeaders.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? UserDetailCell
        else{
            preconditionFailure("invalid cell type")
        }
        let headerName = StaticData.userDetailHeaders[indexPath.row]
        cell.loadCell(header: headerName, value: user?.getValue(for: headerName) ?? "user not set")
        if(indexPath.row+1==StaticData.userDetailHeaders.count){
//            cell.viewSeperator.isHidden = true
        }else{
//            cell.viewSeperator.isHidden = false
        }
        cell.indexNow = indexPath
        cell.touchDownDelegate = touchDownDelegate
        return cell
    }
}
extension UserDetailCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.bottom
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.bottom
    }
    func getAvailableWidth(_ collectionView : UICollectionView)->Int {
        let paddingSpace = (self.itemsPerRow + 1) * sectionInsets.left
        let availableWidth = collectionView.bounds.width - paddingSpace
        return Int(availableWidth / self.itemsPerRow)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = getAvailableWidth(collectionView)
        let height = Int((85 * width)/315)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
}
