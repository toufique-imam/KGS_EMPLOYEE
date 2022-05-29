//
//  SportsViewController.swift
//  KGS Employee
//
//  Created by Nuhash on 5/26/22.
//

import UIKit

class SportsViewController: UIViewController {
    
    @IBOutlet weak var sportsCollectionView: SportsCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        sportsCollectionView.initialize()
    }
}
