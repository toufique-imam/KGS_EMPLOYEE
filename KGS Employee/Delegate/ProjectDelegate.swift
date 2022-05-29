//
//  ProjectDelegate.swift
//  KGS Employee
//
//  Created by Nuhash on 5/29/22.
//

import Foundation

@objc protocol ProjectDelegate : NSObjectProtocol {
    @objc func getCount()->Int
    @objc func getData(for indexPath: IndexPath)->AppInfo
    @objc func getColor(for indexPath: IndexPath)->UIColor
    @objc func getType()->Int 
}
