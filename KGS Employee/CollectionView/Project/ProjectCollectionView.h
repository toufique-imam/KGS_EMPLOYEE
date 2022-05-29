//
//  ProjectCollectionView.h
//  KGS Employee
//
//  Created by Nuhash on 5/29/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ProjectDelegate;

@interface ProjectCollectionView : UICollectionView

@property NSString* cellId;
@property UIEdgeInsets sectionInsets;
@property int itemsPerRow;
@property  (weak, nonatomic) id <ProjectDelegate> projectDelegate;
-(void) initialize;

@end

NS_ASSUME_NONNULL_END
