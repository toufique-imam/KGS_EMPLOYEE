//
//  TeamMemberCollectionView.swift
//  KGS Employee
//
//  Created by Nuhash on 5/29/22.
//

import UIKit

class TeamMemberCollectionView: UICollectionView {
    private let cellId = "TeamMemberCell";
    private var columnIndex : IndexPath = IndexPath(row: 0, section: 0)
    private let sectionInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    private let itemsPerRow : CGFloat = 1
    let zeroIndex = IndexPath(row: 0, section: 0)
    
    private var selectedIndex : IndexPath? = nil {
        didSet{
            if let oldValue = oldValue ,
               let cellOld = self.cellForItem(at: oldValue) as? TeamMemberCell{
                cellOld.updateCellState(isSelected: false)
            }
            if let selectedIndex = selectedIndex ,
               let cellNew = self.cellForItem(at: selectedIndex) as? TeamMemberCell{
                cellNew.updateCellState(isSelected: true)
                
                if let user = teamDataDelegate?.getEmployee(for: IndexPath(row: selectedIndex.row, section: columnIndex.row)) {
                    self.teamDataDelegate?.employeeSelected(employee: user)
                }
            }
        }
    }
    
    weak var teamDataDelegate : TeamDataDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nibCell = UINib(nibName: cellId, bundle: nil)
        self.register(nibCell, forCellWithReuseIdentifier: cellId)
    }
    func initialize(){
        self.delegate = self;
        self.dataSource = self;
        self.reloadData();
    }
    func setSelectedIndex(indexPath : IndexPath){
        selectedIndex = indexPath
        self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    func setColumnIndex(indexPath : IndexPath){
        self.columnIndex = indexPath
        self.selectedIndex = zeroIndex
        self.scrollToItem(at: zeroIndex, at: .centeredHorizontally, animated: true)
    }
}
extension TeamMemberCollectionView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamDataDelegate?.getCount(for: columnIndex) ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? TeamMemberCell
        else{
            preconditionFailure("invalid cell type")
        }
        if let user = teamDataDelegate?.getEmployee(for: IndexPath(row: indexPath.row, section: columnIndex.row))
        {cell.loadCell(user: user)
            cell.updateCellState(isSelected: indexPath==selectedIndex)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        selectedIndex = indexPath
    }
}
extension TeamMemberCollectionView : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return self.sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.sectionInsets.bottom
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.sectionInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = getAvailableHeight(collectionView)
       // print("height ",height)
        return CGSize(width: height, height: height)
    }
    func getAvailableHeight(_ collectionView : UICollectionView)->Int{
        let paddingSpace = (itemsPerRow+1)*self.sectionInsets.bottom
        
        let availableHeight = collectionView.bounds.height - paddingSpace
       // print("paddingSpace " , paddingSpace , "availableHeight " , availableHeight)
        return Int(availableHeight/itemsPerRow)
        
    }
}
