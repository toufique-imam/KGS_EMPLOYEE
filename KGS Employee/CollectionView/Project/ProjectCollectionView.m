//
//  ProjectCollectionView.m
//  KGS Employee
//
//  Created by Nuhash on 5/29/22.
//

#import "ProjectCollectionView.h"
#import "ProjectCollectionViewCell.h"
#import "KGS_Employee-Swift.h"

@interface ProjectCollectionView()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
@end

@implementation ProjectCollectionView
-(void)awakeFromNib {
    [super awakeFromNib];
    self.cellId  = @"ProjectCollectionViewCell";
    self.itemsPerRow = 1;
    self.sectionInsets = UIEdgeInsetsMake(8, 20, 8, 20);
    
    UINib* nibCell = [UINib nibWithNibName:self.cellId bundle:nil];
    
    [self registerNib:nibCell forCellWithReuseIdentifier:self.cellId];
}

-(void) initialize {
    self.delegate = self;
    self.dataSource = self;
    [self reloadData];
}

//MARK: DATA DELEAGTE
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProjectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellId forIndexPath:indexPath];
    
    AppInfo* appInfo = [self.projectDelegate getDataFor:indexPath];
    if([self.projectDelegate getType]==1){
        [cell loadCellVacation:appInfo color:[self.projectDelegate getColorFor:indexPath]];
    }else{
        [cell loadCellProject:appInfo];
    }
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.projectDelegate getCount];
}

//MARK: FLOW DELEGATE
-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.sectionInsets.left;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return self.sectionInsets.bottom;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return self.sectionInsets;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    int width = [self getAvailableWidth:collectionView];
    int height = 90 * width / 330;
    return CGSizeMake(width, height);
}

-(int) getAvailableWidth:(UICollectionView *) collectionView {
    int paddingSpace = (self.itemsPerRow+1) * self.sectionInsets.left;
    int availableWidth = collectionView.bounds.size.width - paddingSpace;
    return (availableWidth/ _itemsPerRow);
}
@end
