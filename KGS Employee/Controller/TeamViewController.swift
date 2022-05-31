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
    let colorStart = UIColor.clear , colorMid = UIColor.init(red: 0, green: 0, blue: 0, a: 0.6) , colorEnd = UIColor.init(red: 0, green: 0, blue: 0, a: 0.9)
    @IBOutlet weak var gradientView: UIView!
    
    var initalizedView = false;
    
    func addHeaderGradient(){
        gradientView.addGradientLayerInBackground(frame: gradientView.bounds, colors: [colorStart , colorMid , colorEnd])
        gradientView.alpha = 1
//        gradientView.dropShadow(color: UIColor.red, opacity: 0.5, offset: CGSize(width: 1, height: 1), radius: 10, scale: false)
        
    }
    func initCollectionView(){
        teamCollectionView.teamDataDelegate = self
        teamMemberCollectionView.teamDataDelegate = self
        
        teamMemberCollectionView.initialize()
        teamCollectionView.initialize()
        teamCollectionView.setSelectedIndex(index: indexZero)
//        teamCollectionView.selectedIndex = indexZero
        teamMemberCollectionView.setColumnIndex(indexPath: indexZero)
//        teamMemberCollectionView.setSelectedIndex(indexPath: indexZero)
        employeeSelected(employee: StaticData.employees[0][0])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHeaderGradient()
        
        mainView.layer.cornerRadius = 10
        mainView.clipsToBounds = true
        //initCollectionView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if(self.initalizedView==false){
            self.initalizedView = true;
            initCollectionView()
        }
        
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
//        teamMemberCollectionView.columnIndex = teamIndex
//        teamMemberCollectionView.selectedIndex = indexZero
        teamMemberCollectionView.reloadData()
        teamMemberCollectionView.setColumnIndex(indexPath: teamIndex)
        employeeSelected(employee: StaticData.employees[teamIndex.row][0])
    }
    
    func employeeSelected(employee user: User) {
        if let image = UIImage(named: user.imagePath) {
            imageMain.image = image
        }else{
            imageMain.image = User.loadImage(for: user)
        }
        labelName.text = user.fullName
        labelDesignation.text = user.designation
        if let image = imageMain.image?.blurImage(blurAmount: 46) {
            imageBackground.image = image
        }else{
            print("no image found or image couldnot be blurred")
            imageBackground.image = nil
        }
        
    }
    
    func getTeamName(for indexPath: IndexPath) -> String {
        return StaticData.teamNames[indexPath.row]
    }
    
    func getEmployee(for indexPath: IndexPath) -> User {
        return StaticData.employees[indexPath.section][indexPath.row]
    }
}
