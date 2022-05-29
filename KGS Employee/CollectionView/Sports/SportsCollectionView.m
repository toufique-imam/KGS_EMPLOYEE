//
//  SportsCollectionView.m
//  KGS Employee
//
//  Created by Nuhash on 5/26/22.
//

#import "SportsCollectionView.h"
#import "KGS_Employee-Swift.h"
@interface SportsCollectionView ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
@end

@implementation SportsCollectionView
-(void)awakeFromNib {
    [super awakeFromNib];
    self.cellId = @"SportsCollectionViewCell";
    self.itemPerRow = 2;
    self.sectionInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    UINib *nibCell = [UINib nibWithNibName:self.cellId bundle:nil];
    [self registerNib:nibCell forCellWithReuseIdentifier:self.cellId];
}
-(void) initialize {
    self.delegate = self;
    self.dataSource = self;
    [self reloadData];
   // [self layoutIfNeeded];
}


//MARK: DATA SOURCE DELEGATE
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SportsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellId forIndexPath:indexPath];
    NSString* titleNow = StaticData.descriptionData[indexPath.row];
    
    NSString* imageName = StaticData.imageData[indexPath.row];
//    NSString*
    
    [cell loadCellImageName:imageName title:titleNow];

    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return StaticData.imageData.count;
}


//MARK: FLOW DELEGATE
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.sectionInsets.left;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return self.sectionInsets.bottom;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    int width = [self getAvailableWidth:collectionView];
    int height = 170 * width / 145;
    printf("%d %d\n" , width , height);
    return CGSizeMake(width, height);
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return (self.sectionInsets);
}

-(int) getAvailableWidth:(UICollectionView *)collectionView {
    int paddingSpace = (self.itemPerRow + 1) * self.sectionInsets.left;
    int availableWidth = collectionView.bounds.size.width - paddingSpace;
    printf("paddingSpace: %d availableWidth: %d\n" , paddingSpace , availableWidth);
    return (availableWidth / _itemPerRow);
}

@end

