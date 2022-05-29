//
//  AppInfo.swift
//  KGS Employee
//
//  Created by Nuhash on 5/24/22.
//

import Foundation
import UIKit


@objc class AppInfo  : NSObject{
    @objc var name = "placeholder name"
    @objc var subtitle = "placeholder description"
    @objc var imagePath  = ""
    @objc var iconPath = ""
    
    var appType = AppType.fullInfo
    
    enum AppType{
        //only has mainImage
        case onlyImage
        //doesn't has mainImage
        case withIcon
        //has all property
        case fullInfo
        //will load from assets
        case settingOption
    }
    init(name:String="placeholder name",
         description:String="placeholder description",
         imagePath:String = "",
         iconPath:String=""){
        self.name = name
        self.subtitle = description
        self.imagePath = imagePath
        self.iconPath = iconPath
    }
}
