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

- (void) loadCellProject:(AppInfo*) appInfo;
- (void) loadCellVacation:(AppInfo*) appInfo color:(UIColor* )color;

@end

NS_ASSUME_NONNULL_END
