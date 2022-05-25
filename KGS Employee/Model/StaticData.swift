//
//  StaticData.swift
//  KGS Employee
//
//  Created by Nuhash on 5/24/22.
//

import Foundation

class StaticData {
    static let appDataHome : [AppInfo] = [
        AppInfo(name: "Color Pop 1", description: "Recolor & edit your pictures", imagePath: "Color_Pop_Android_Feature_Graphic_1 – 2", iconPath: "color_pop") ,
        AppInfo(name: "Color Pop 2", description: "Recolor & edit your pictures", imagePath: "Color_Pop_Android_Feature_Graphic_1 – 2", iconPath: "color_pop"),
        AppInfo(name: "Color Pop 3", description: "Recolor & edit your pictures", imagePath: "Color_Pop_Android_Feature_Graphic_1 – 2", iconPath: "color_pop")
    ]
    
    static let settingsData : [[AppInfo]] = [
        [
            AppInfo(name: "Contact", description: "", imagePath: "icon_icon_contact", iconPath: "") ,
            AppInfo(name: "Review", description: "", imagePath: "icon_review", iconPath: "") ,
            AppInfo(name: "Terms of Use", description: "", imagePath: "icon_terms_of_use", iconPath: "") ,
            AppInfo(name: "Privacy Policy", description: "", imagePath: "icon_privacy_policy", iconPath: "")
        ],
        [
            AppInfo(name: "Edit Profile", description: "", imagePath: "icon_edit_profile", iconPath: "") ,
            AppInfo(name: "Log Out", description: "", imagePath: "icon_log_out", iconPath: "")
        ]
    ]
    static let appDataBanner : [AppInfo] = [
        AppInfo(name: "Color Pop 1", description: "Recolor & edit your pictures", imagePath: "promo_banner1", iconPath: "") ,
        AppInfo(name: "Color Pop 2", description: "Recolor & edit your pictures", imagePath: "promo_banner2", iconPath: ""),
        AppInfo(name: "Color Pop 3", description: "Recolor & edit your pictures", imagePath: "promo_banner3", iconPath: "")
    ]
    
    static let appDataScroll : [AppInfo] = [
        AppInfo(name: "Color Pop Effects Photo Editor", description: "Recolor & edit your pictures", imagePath: "", iconPath: "color_pop") ,
        AppInfo(name: "Write on Photos : Add Text!", description: "Word Swag Caption to Picture", imagePath: "", iconPath: "write_on_photos"),
        AppInfo(name: "Add Music To Video Editor", description: "Intro Maker for Movie Editing", imagePath: "", iconPath: "add_music_to_video"),
        
        AppInfo(name: "Video Editor: Crop Trim & Edit", description: "Movie maker & vlog editing", imagePath: "", iconPath: "video_editor"),
        
        AppInfo(name: "Dazz Cam", description: "Daze d3d VHS Disposable Camera", imagePath: "", iconPath: "dazz_cam"),
        
        AppInfo(name: "Slide Show", description: "Recolor & edit your pictures", imagePath: "", iconPath: "slide_show"),
    ]
    
}
