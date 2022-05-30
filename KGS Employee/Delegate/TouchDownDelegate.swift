//
//  TouchDownDelegate.swift
//  KGS Employee
//
//  Created by Nuhash on 5/30/22.
//

import Foundation

protocol TouchDownDelegate : AnyObject {
    func touchDown(indexPath: IndexPath)
    func updateText(for header:String , value:String)
}
