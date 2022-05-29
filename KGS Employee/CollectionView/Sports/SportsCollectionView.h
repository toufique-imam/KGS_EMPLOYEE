//
//  SportsCollectionView.h
//  KGS Employee
//
//  Created by Nuhash on 5/26/22.
//

#import <UIKit/UIKit.h>
#import "SportsCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN


@interface SportsCollectionView : UICollectionView

@property UIEdgeInsets sectionInsets;
@property NSString *cellId;
@property int itemPerRow;

-(void) initialize;

@end

NS_ASSUME_NONNULL_END
