//
//  TeamViewController.swift
//  KGS Employee
//
//  Created by Nuhash on 5/26/22.
//

import UIKit

class TeamViewController: UIViewController {
    @IBOutlet weak var teamMemberCollectionView : TeamMemberCollectionView!
    @IBOutlet weak var teamCollectionView : TeamCollectionView!
    @IBOutlet weak var labelName : UILabel!
    @IBOutlet weak var labelDesignation : UILabel!
    @IBOutlet weak var imageMain : UIImageView!
    @IBOutlet weak var imageBackground : UIImageView!
    @IBOutlet weak var stackViewMemberHeader : UIStackView!
    @IBOutlet weak var mainView: UIView!
    let indexZero = IndexPath(row: 0, section: 0)
    let colorStart = UIColor.white , colorMid = UIColor.red , colorEnd = UIColor.darkText;
    @IBOutlet weak var gradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientView.addGradientLayerInBackground(frame: gradientView.bounds, colors: [colorStart , colorMid , colorEnd])

  
        gradientView.alpha = 0.6
        mainView.layer.cornerRadius = 10
        mainView.clipsToBounds = true
        
        teamCollectionView.teamDataDelegate = self
        teamMemberCollectionView.teamDataDelegate = self
        teamCollectionView.selectedIndex = indexZero
        teamMemberCollectionView.columnIndex = indexZero
        teamMemberCollectionView.selectedIndex = indexZero
        teamMemberCollectionView.initialize()
        teamCollectionView.initialize()
    }
}

extension TeamViewController : TeamDataDelegate {
    func getCount() -> Int {
        return StaticData.teamNames.count
    }
    
    func getCount(for indexPath: IndexPath) -> Int {
        return StaticData.employees[indexPath.row].count
    }
    
    func teamSelected(teamIndex : IndexPath) {
        print("team selected " , teamIndex)
        teamMemberCollectionView.columnIndex = teamIndex
        teamMemberCollectionView.selectedIndex = indexZero
        teamMemberCollectionView.reloadData()
    }
    
    func employeeSelected(employee user: User) {
        imageMain.image = UIImage(named: user.imagePath)
        labelName.text = user.fullName
        labelDesignation.text = user.designation
        imageBackground.image = UIImage(named: user.imagePath)
    }
    
    func getTeamName(for indexPath: IndexPath) -> String {
        return StaticData.teamNames[indexPath.row]
    }
    
    func getEmployee(for indexPath: IndexPath) -> User {
        return StaticData.employees[indexPath.section][indexPath.row]
    }
}
