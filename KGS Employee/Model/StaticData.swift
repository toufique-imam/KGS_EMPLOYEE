//
//  StaticData.swift
//  KGS Employee
//
//  Created by Nuhash on 5/24/22.
//

import Foundation

@objc class StaticData : NSObject{
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
    @objc static let appDataBanner : [AppInfo] = [
        AppInfo(name: "Color Pop 1", description: "Recolor & edit your pictures", imagePath: "promo_banner1", iconPath: "") ,
        AppInfo(name: "Color Pop 2", description: "Recolor & edit your pictures", imagePath: "promo_banner2", iconPath: ""),
        AppInfo(name: "Color Pop 3", description: "Recolor & edit your pictures", imagePath: "promo_banner3", iconPath: "")
    ]
    @objc static let appDataScroll : [AppInfo] = [
        AppInfo(name: "Color Pop Effects Photo Editor", description: "Recolor & edit your pictures", imagePath: "", iconPath: "color_pop") ,
        AppInfo(name: "Write on Photos : Add Text!", description: "Word Swag Caption to Picture", imagePath: "", iconPath: "write_on_photos"),
        AppInfo(name: "Add Music To Video Editor", description: "Intro Maker for Movie Editing", imagePath: "", iconPath: "add_music_to_video"),
        
        AppInfo(name: "Video Editor: Crop Trim & Edit", description: "Movie maker & vlog editing", imagePath: "", iconPath: "video_editor"),
        
        AppInfo(name: "Dazz Cam", description: "Daze d3d VHS Disposable Camera", imagePath: "", iconPath: "dazz_cam"),
        
        AppInfo(name: "Slide Show", description: "Recolor & edit your pictures", imagePath: "", iconPath: "slide_show"),
    ]
    static let teamNames : [String] = [ "Software Engineer Software Engineer",
                                        "UI/UX Designer",
                                        "QA Engineer",
                                        "Manager Accounts",
                                        "ios swe",
                                        "android swe"]
    static var employees : [[User]] = [
        [User(name: "rifat", password: "123", fullName: "Rifat Hasnat", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "omar", password: "123", fullName: "Omar Faruque", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "sourav", password: "123", fullName: "Sourav Hasnat", designation: "ios", phone: "01521108127", email: "sourav@gmail.com", department: "ios", imagePath: "sourav")
        ],
        
        [User(name: "rifat", password: "123", fullName: "Rifat Hasnat 1", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         User(name: "rifat", password: "123", fullName: "Rifat Hasnat 1", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         
          User(name: "rifat", password: "123", fullName: "Rifat Hasnat 1", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         
          User(name: "rifat", password: "123", fullName: "Rifat Hasnat 1", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         
          User(name: "rifat", password: "123", fullName: "Rifat Hasnat 1", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         
          User(name: "rifat", password: "123", fullName: "Rifat Hasnat 1", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 1", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 1", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 1", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 1", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "sourav", password: "123", fullName: "Sourav Hasnat 1", designation: "ios", phone: "01521108127", email: "sourav@gmail.com", department: "ios", imagePath: "sourav")
        ],
        
        [User(name: "rifat", password: "123", fullName: "Rifat Hasnat 2", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 2", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 2", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 2", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 2", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 2", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 2", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 2", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 2", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 2", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 2", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 2", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 2", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "sourav", password: "123", fullName: "Sourav Hasnat 2", designation: "ios", phone: "01521108127", email: "sourav@gmail.com", department: "ios", imagePath: "sourav")
        ],
        
        [User(name: "rifat", password: "123", fullName: "Rifat Hasnat 3", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 3", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 3", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 3", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 3", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 3", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 3", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 3", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 3", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 3", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 3", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 3", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "sourav", password: "123", fullName: "Sourav Hasnat 3", designation: "ios", phone: "01521108127", email: "sourav@gmail.com", department: "ios", imagePath: "sourav")
        ],
        
        [User(name: "rifat", password: "123", fullName: "Rifat Hasnat 4", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 4", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 4", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 4", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 4", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 4", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 4", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 4", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 4", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 4", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 4", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 4", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 4", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         
         User(name: "tamim", password: "123", fullName: "Tamim Dari 4", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
        ],
        
        [User(name: "rifat", password: "123", fullName: "Rifat Hasnat 5", designation: "ios", phone: "01521108127", email: "rifat@gmail.com", department: "ios", imagePath: "rifat"),
         User(name: "hasnaine", password: "123", fullName: "Shahwat Hasnaine 5", designation: "ios", phone: "01521108127", email: "hasnaine@gmail.com", department: "ios", imagePath: "hasnaine"),
         User(name: "omar", password: "123", fullName: "Omar Faruque 5", designation: "ios", phone: "01521108127", email: "omar@gmail.com", department: "ios", imagePath: "omar"),
         User(name: "rezaul", password: "123", fullName: "Rezaul Haque Sagar 5", designation: "ios", phone: "01521108127", email: "rezaul@gmail.com", department: "ios", imagePath: "rezaul"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 5", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 5", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 5", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 5", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 5", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 5", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 5", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 5", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         User(name: "tamim", password: "123", fullName: "Tamim Dari 5", designation: "ios", phone: "01521108127", email: "tamim@gmail.com", department: "ios", imagePath: "tamim"),
         
         User(name: "sourav", password: "123", fullName: "Sourav Hasnat", designation: "ios", phone: "01521108127", email: "sourav@gmail.com", department: "ios", imagePath: "sourav")
        ],
    ]
    
    @objc static let descriptionData = ["KGS Sports Tournament","FIFA 20 Tournament","Table Tennis Tournament","DART Tournament"];
    @objc static let imageData = ["KGS_Sports_logo","Fifa_20_logo","Table_tennis_logo","Dart_logo"];
    
    @objc static let projectData : [AppInfo] = [
        AppInfo(name: "Write on Photos : Add Text!", description: "Ver :2.0", imagePath: "Xcode_Icon", iconPath: "Xcode_Icon") ,
    ]
    
    @objc static let holidayData : [AppInfo] = [
        AppInfo(name: "Vijayadashami", description: "Monday", imagePath: "26", iconPath: "Oct") ,
        
        AppInfo(name: "Laxmi Pooja", description: "Saturday", imagePath: "14", iconPath: "Nov") ,
        
        AppInfo(name: "Vijayadashami", description: "Wednesday", imagePath: "16", iconPath: "Dec") ,
        
        AppInfo(name: "Vijayadashami", description: "Friday", imagePath: "25", iconPath: "Dec") ,
    ]
    @objc static let holidayColors : [[Int]] = [
        [226, 84, 84, 1],
        [75, 193, 139, 1],
        [140, 115, 224, 1],
        [231, 125, 235, 1]
    ]
    static let userDetailHeaders : [String] = [
        User.key_full_name,User.key_password,User.key_designation,User.key_phone,User.key_mail,User.key_dept
    ]
    
    static func getY(x : CGFloat , point1 : CGPoint , point2 : CGPoint) -> CGFloat{
        let c1 = (point1.x - point2.x)
        let c2 = (point1.y - point2.y)
        
        let y = c2 * x - c2 * point1.x + c1 * point1.y
        return y / c1
    }
    
}
