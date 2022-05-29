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

- (void) loadCellAppInfo:(AppInfo*) appInfo;


@end

NS_ASSUME_NONNULL_END
