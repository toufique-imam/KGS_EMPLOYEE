//
//  ProjectCollectionViewCell.h
//  KGS Employee
//
//  Created by Nuhash on 5/29/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AppInfo;

@interface ProjectCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;


@property (weak, nonatomic) IBOutlet UIStackView *stackViewVacation;

@property (weak, nonatomic) IBOutlet UILabel *labelDate;

@property (weak, nonatomic) IBOutlet UILabel *labelMonth;
@property (weak , nonatomic) IBOutlet UIView *holidayView;

- (void) loadCellProject:(AppInfo*) appInfo;
- (void) loadCellVacation:(AppInfo*) appInfo color:(UIColor* )color;
- (void) loadCellCommon:(AppInfo *)appInfo;
@end

NS_ASSUME_NONNULL_END
