//
//  ProjectViewController.h
//  KGS Employee
//
//  Created by Nuhash on 5/29/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ProjectCollectionView;

@interface ProjectViewController : UIViewController

@property (weak , nonatomic) IBOutlet  ProjectCollectionView* projectCollectionView;
@property int projectType;
-(void)initializeType:(int) type;
@end

NS_ASSUME_NONNULL_END
