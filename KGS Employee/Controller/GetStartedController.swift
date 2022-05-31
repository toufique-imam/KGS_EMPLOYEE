//
//  GetStartedController.swift
//  KGS Employee
//
//  Created by Nuhash on 5/26/22.
//

import UIKit

enum ControllerType: Int{
    case project = 0
    case holiday
}

class GetStartedController : UIViewController {
    @IBOutlet weak var bottomTabBar : UITabBar!
    @IBOutlet weak var containerView : UIView!
    
    //TAB BAR Item
    @IBOutlet weak var teamsTabBarItem: UITabBarItem!
    @IBOutlet weak var sportsTabBarItem: UITabBarItem!
    @IBOutlet weak var holidayTabBarItem: UITabBarItem!
    @IBOutlet weak var projectsTabBarItem: UITabBarItem!
    
    
    private var teamViewController: TeamViewController?
    private var sportsViewController: SportsViewController?
    private var projectViewController: ProjectViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomTabBar.tintColor = UIColor.init(named: "TitleColor")!
        bottomTabBar.unselectedItemTintColor = UIColor.init(named: "TabUnselected")!
        let offset = UIOffset(horizontal: 0, vertical: -18)
        if let items = bottomTabBar.items {
            for tabItem in items {
                if(bottomTabBar.selectedItem==nil){
                    bottomTabBar.selectedItem = tabItem
                }
                tabItem.titlePositionAdjustment = offset
            }
        }else{
            print("no item found")
        }
        bottomTabBar.delegate = self
        initNavigationController()
        clearBottomNavShadow()
        
    }
    
    
    private func initNavigationController(){
        if let navigationController = self.navigationController {
            navigationController.navigationBar.isHidden = false
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
            navigationController.navigationBar.isTranslucent = true
            navigationController.navigationBar.backgroundColor = UIColor.clear
            navigationController.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font : UIFont(name: "Poppins-SemiBold", size: 17.0)! ,
                NSAttributedString.Key.foregroundColor : UIColor(named: "TitleColor")!
            ]
            navigationController.navigationItem.leftBarButtonItem?.width = 46
        }
    }
    func clearBottomNavShadow(){
        bottomTabBar.backgroundImage = UIImage()
        bottomTabBar.shadowImage = UIImage()
    }
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layoutIfNeeded()
        navigationController?.navigationBar.dropShadowRectBottom(color: UIColor(named: "ProjectDropShadow")!, opacity: 1.0, offset: CGSize(width: 0, height: -3), radius: 20, scale: false)
        bottomTabBar.dropShadowRectTop(color: UIColor(named: "ProjectDropShadow")!, opacity: 1.0, offset: CGSize(width: 0, height: -3), radius: 20, scale: false)
        
        //        self.bottomTabBar.setValue(true, forKey: "hidesShadow")
        self.loadVC()
        loadTeams()
    }
    
    func loadVC(){
        var storyboard = UIStoryboard.init(name: "Sports", bundle: nil)
        self.sportsViewController = storyboard.instantiateViewController(withIdentifier: "SportsViewController") as? SportsViewController
        
        storyboard = UIStoryboard.init(name: "Team", bundle: nil)
        self.teamViewController = storyboard.instantiateViewController(withIdentifier: "TeamViewController") as? TeamViewController
        
        storyboard = UIStoryboard.init(name: "Project", bundle: nil)
        self.projectViewController = storyboard.instantiateViewController(withIdentifier: "ProjectViewController") as? ProjectViewController
        
        addChild(sportsViewController!)
        addChild(teamViewController!)
        addChild(projectViewController!)
        
        self.containerView.addSubview(sportsViewController!.view)
        self.containerView.addSubview(teamViewController!.view)
        self.containerView.addSubview(projectViewController!.view)
        
    }
    func loadTeams(){
        self.navigationItem.title = "KGS Teams"
        self.teamViewController?.view.frame = self.containerView.bounds
        //self.showDetailViewController(<#T##vc: UIViewController##UIViewController#>, sender: <#T##Any?#>)
        self.containerView.bringSubviewToFront(teamViewController!.view)
        containerView.didMoveToWindow()
    }
    func loadSports(){
        self.navigationItem.title = "KGS Sports"
        self.sportsViewController?.view.frame = self.containerView.bounds
        self.containerView.bringSubviewToFront(sportsViewController!.view)
        containerView.didMoveToWindow()
    }
    
    func loadProjects(_ type: ControllerType){
        self.navigationItem.title = type == .project ? "Ongoing Projects" : "Holidays 2020"
        self.projectViewController?.view.frame = self.containerView.bounds
        self.containerView.bringSubviewToFront(projectViewController!.view)
        containerView.didMoveToWindow()
        projectViewController!.initializeType(Int32(type.rawValue));
    }
}

extension GetStartedController: UITabBarDelegate{
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == self.sportsTabBarItem{
            self.loadSports()
        } else if item == self.teamsTabBarItem{
            self.loadTeams()
        } else if item == self.holidayTabBarItem{
            self.loadProjects(.holiday)
        } else if item == self.projectsTabBarItem{
            self.loadProjects(.project)
        } else {
            fatalError()
        }
    }
}
