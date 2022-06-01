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
            //goToItem(at: 333, animated: true)
        }
        isFirstLoad = false
    }
    
    func cellConfig(centerX : CGFloat , frame : CGRect) {
        print("Input ",centerX , frame)
        //var colorIdx=0;
        //        print("CC " , self.visibleCells.count)
        for cell in self.visibleCells {
            var offsetX = centerX - cell.center.x
            print("cell data ",cell.center , cell.bounds , centerX , offsetX)
            if offsetX < 0 {
                offsetX *= -1
            }
            
            //cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            if(offsetX > 80){
                //make it smaller
                let offsetPercentage = (offsetX - 70) / self.bounds.width
                var scaleX = 1 - offsetPercentage
                print("min scale ",scaleX)
                scaleX = max(scaleX , 0.85)
                cell.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
            }
            else{
                //make it bigger
                //offset joto kom toto bhalo
                offsetX = max(offsetX , 40)
                let scaleX = StaticData.getY(x: offsetX, point1: p1, point2: p2)
                print("max scale ",scaleX)
                cell.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
            }
        }
        
    }
    
    func cellConfig(contentOffset: CGPoint , frame: CGRect){
        let centerX = contentOffset.x + frame.size.width / 2
        cellConfig(centerX: centerX, frame: frame)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //cellConfig(contentOffset: scrollView.contentOffset, frame: scrollView.frame)
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
        //print(width , height)
        
       // print("CC 2" , collectionView.visibleCells.count)
        // cellConfig(contentOffset: self.contentOffset, frame: self.frame)
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

