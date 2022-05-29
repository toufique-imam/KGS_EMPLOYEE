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
-(void) loadCellAppInfo:(AppInfo *)appInfo {
    self.imageIcon.image = [UIImage imageNamed: appInfo.imagePath];
    self.labelTitle.text = appInfo.name;
    self.labelDescription.text = appInfo.descriptionx;
}


@end
