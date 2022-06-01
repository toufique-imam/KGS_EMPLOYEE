//
//  AppSlideCollectionView.swift
//  KGS Employee
//
//  Created by Nuhash on 5/25/22.
//

import UIKit

class AppSlideCollectionView: UICollectionView {
    let cellId = "AppSlideCollectionViewCell"
    let itemsPerRow : CGFloat = 1
    let sectionInsets = UIEdgeInsets(top: 15, left: 10, bottom: 20, right: 10)
    let scaleBigX : CGFloat = 280
    let scaleBigY : CGFloat = 156 , scaleSmallY = 136
    let scaleSmallX : CGFloat = 280 * 136 / 156
    var isFirstLoad  = true
    private var isFirstAnimationDone = false
    let p1 = CGPoint(x: 80.0, y: 1.0), p2 = CGPoint(x: 40, y: 1.1)
    
    override func awakeFromNib() {
        let nibCell = UINib(nibName: cellId, bundle: nil)
        self.register(nibCell, forCellWithReuseIdentifier: cellId)
        self.collectionViewLayout = ZoomAndSnapFlowLayout()
    }
    
    func initialize(){
        self.delegate = self
        self.dataSource = self
        self.reloadData()
    }
    
    func goToItem(at row : Int , animated : Bool = false){
        let indexPath = IndexPath(row: row, section: 0)
        self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: animated)
    }
}

extension AppSlideCollectionView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        //   selectedItem = indexPath
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(isFirstLoad){
            goToItem(at: 332)
        }
        isFirstLoad = false
    }
}

extension AppSlideCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AppSlideCollectionViewCell
        else {
            preconditionFailure("invalid cell type")
        }
        
        cell.loadCell(StaticData.appDataBanner[indexPath.row%StaticData.appDataBanner.count])
        return cell
    }
}
extension AppSlideCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.bottom
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = getAvailableHeight(collectionView)
        let width = ((220 * height)/136)
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
    
    func getAvailableHeight(_ collectionView: UICollectionView) -> CGFloat {
        let paddingSpace = sectionInsets.bottom * 2;
        let availableHeight = collectionView.bounds.height - paddingSpace
        return availableHeight * 0.8;
    }
}

