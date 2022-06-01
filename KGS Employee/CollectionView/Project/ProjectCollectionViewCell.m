//
//  ProjectCollectionViewCell.m
//  KGS Employee
//
//  Created by Nuhash on 5/29/22.
//

#import "ProjectCollectionViewCell.h"
#import "KGS_Employee-Swift.h"

@implementation ProjectCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void) loadCellCommon:(AppInfo *)appInfo {
    self.labelTitle.text = appInfo.name;
    self.labelDescription.text = appInfo.subtitle;
    self.layer.cornerRadius = 10;
    //rgba(245, 249, 252, 0.7)
    UIColor* shadowColor = [UIColor colorNamed:@"ProjectDropShadow"];
    UIColor* borderColor = [UIColor colorNamed:@"BorderColor"];
    
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = 1.0;
    
    [self dropShadowWithColor:shadowColor opacity:1 offset:CGSizeMake(0, 3) radius:20 scale:false];
}
-(void) loadCellProject:(AppInfo *)appInfo {
    [self loadCellCommon:appInfo];
    
    self.imageIcon.image = [UIImage imageNamed: appInfo.imagePath];
    
    [self.imageIcon setHidden:false];
    [self.holidayView setHidden:true];
}

- (void) loadCellVacation:(AppInfo*) appInfo color:(UIColor* )color {
    [self loadCellCommon:appInfo];
    
    [self.imageIcon setHidden:true];
    [self.holidayView setHidden:false];
    
    self.labelDate.text = appInfo.imagePath;
    self.labelMonth.text = appInfo.iconPath;
    self.holidayView.backgroundColor = color;
   // self.stackViewVacation.backgroundColor = [UIColor redColor];
    self.holidayView.layer.cornerRadius = 10;
    self.holidayView.clipsToBounds = true ;
    //UIColor* uiColor = [UIColor colorNamed:@"ProjectDropShadow"];
    //[self dropShadowWithColor:uiColor opacity:0.3 offset:CGSizeMake(-5, -5) radius:50 scale:false];
}


@end
