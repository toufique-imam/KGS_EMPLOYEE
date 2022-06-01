//
//  SportsViewController.swift
//  KGS Employee
//
//  Created by Nuhash on 5/26/22.
//

import UIKit

class SportsViewController: UIViewController {
    
    @IBOutlet weak var sportsCollectionView: SportsCollectionView!
    var initialized = false;
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        if(initialized==false){
//            sportsCollectionView.initialize()
//            initialized = true
//        }
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sportsCollectionView.initialize()
    }
}
