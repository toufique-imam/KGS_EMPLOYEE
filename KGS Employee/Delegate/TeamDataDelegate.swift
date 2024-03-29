//
//  TeamDataDelegate.swift
//  KGS Employee
//
//  Created by Nuhash on 5/26/22.
//

import Foundation


protocol TeamDataDelegate : AnyObject {
    func getCount()->Int
    func getCount(for indexPath: IndexPath) -> Int
    func teamSelected(teamIndex : IndexPath)
    func employeeSelected(employee user: User)
    func getTeamName(for indexPath: IndexPath)->String
    func getEmployee(for indexPath : IndexPath)->User
}
