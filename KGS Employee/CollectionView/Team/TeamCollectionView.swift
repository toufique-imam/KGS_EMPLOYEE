//
//  TeamCollectionView.swift
//  KGS Employee
//
//  Created by Nuhash on 5/26/22.
//

import UIKit

class TeamCollectionView: UICollectionView {
    
  //  let itemsPerRow : CGFloat = 1
    let sectionInsets = UIEdgeInsets(top: 15, left: 18, bottom: 15, right: 18)
    //load the team name
    //when selected send the data to delegate and change the button
    weak var teamDataDelegate : TeamDataDelegate? = nil
    let cellId = "TeamCollectionViewCell"
    private var selectedIndex : IndexPath? {
        didSet{
            //print("selectedIndex " , oldValue , selectedIndex)
            if let oldValue = oldValue,
               let cellOld = self.cellForItem(at: oldValue) as? TeamCollectionViewCell {
                cellOld.toggleButton(selected: false)
            }
            if let selectedIndex = selectedIndex,
               let cellNew = self.cellForItem(at: selectedIndex) as? TeamCollectionViewCell {
                cellNew.toggleButton(selected: true)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        let nibCell = UINib(nibName: cellId, bundle: nil)
        self.register(nibCell, forCellWithReuseIdentifier: cellId)
    }
    
    func initialize(){
        self.delegate = self
        self.dataSource = self
        self.reloadData()
    }
    func setSelectedIndex(index : IndexPath){
        self.selectedIndex = index
        self.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
}

extension TeamCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        teamDataDelegate?.getCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? TeamCollectionViewCell
        else{
            fatalError("invalid cell type")
        }
        cell.loadData(teamName: teamDataDelegate?.getTeamName(for: indexPath) ?? "delegate not set")
        cell.toggleButton(selected: indexPath == selectedIndex)
        return cell
    }
}

extension TeamCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.bottom
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //var width = getAvailableWidth(collectionView)
        let height = getAvailableHeight(collectionView)
        var width = (height * 92) / 29.0 + 5
        //14-width
        //x -> (width*x)/14
        if let strNow = teamDataDelegate?.getTeamName(for: indexPath){
            width = (width * CGFloat(strNow.count)) / 14.0;
        }
        //print(width , height)
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
    
    func getAvailableHeight(_ collectionView: UICollectionView) -> CGFloat {
        let paddingSpace =  sectionInsets.top * 2
        let availableHeight = collectionView.bounds.height - paddingSpace
        return availableHeight
    }
}

extension TeamCollectionView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? TeamCollectionViewCell {
            cell.toggleButton(selected: selectedIndex==indexPath)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("called")
        self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        teamDataDelegate?.teamSelected(teamIndex: indexPath)
     //   selectedItem = indexPath
        selectedIndex = indexPath
    }
}
