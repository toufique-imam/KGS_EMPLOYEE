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
-(void) loadCellProject:(AppInfo *)appInfo {
    self.imageIcon.image = [UIImage imageNamed: appInfo.imagePath];
    self.labelTitle.text = appInfo.name;
    self.labelDescription.text = appInfo.subtitle;
    self.layer.cornerRadius = 10;
    UIColor* uiColor = [UIColor colorNamed:@"ProjectDropShadow"];
    [self dropShadowWithColor:uiColor opacity:0.8 offset:CGSizeMake(0, 3) radius:20 scale:false];
   // self.stackViewVacation.frame = self.imageIcon.bounds;
    
  //  self.stackViewVacation.bounds = self.imageIcon.bounds;
    [self.imageIcon setHidden:false];
    [self.stackViewVacation setHidden:true];
}

- (void) loadCellVacation:(AppInfo*) appInfo color:(UIColor* )color {
    puts("here");
    [self loadCellProject:appInfo];
    self.labelDate.text = appInfo.imagePath;
    self.labelMonth.text = appInfo.iconPath;
    self.stackViewVacation.backgroundColor = color;
    self.stackViewVacation.layer.cornerRadius = 10;
    [self.imageIcon setHidden:true];
    [self.stackViewVacation setHidden:false];
    UIColor* uiColor = [UIColor colorNamed:@"ProjectDropShadow"];
    [self dropShadowWithColor:uiColor opacity:0.3 offset:CGSizeMake(-5, -5) radius:50 scale:false];
}


@end
