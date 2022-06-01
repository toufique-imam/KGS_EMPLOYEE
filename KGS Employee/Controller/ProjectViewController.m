//
//  ProjectViewController.m
//  KGS Employee
//
//  Created by Nuhash on 5/29/22.
//

#import "ProjectViewController.h"
#import "ProjectCollectionView.h"
#import "KGS_Employee-Swift.h"
#define RGBA(r, g, b, a) [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:a]

@interface ProjectViewController ()<
ProjectDelegate
>
@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.projectType = 0;
    // Do any additional setup after loading the view.
}
-(void)initializeType:(int) type{
    self.projectType = type;
    self.projectCollectionView.projectDelegate = self;
    [self.projectCollectionView initialize];
    //[self.projectCollectionView reloadData];
}




- (NSInteger)getCount {
    if(self.projectType==0){
        return 20;
    }else{
        return StaticData.holidayData.count;
    }
}

- (AppInfo * _Nonnull)getDataFor:(NSIndexPath * _Nonnull)indexPath {
    if(self.projectType==0){
        return StaticData.projectData[0];
    }else{
        return StaticData.holidayData[indexPath.row];
    }
}

- (UIColor* _Nonnull)getColorFor:(NSIndexPath * _Nonnull)indexPath {
    CGFloat r = [StaticData.holidayColors[indexPath.row][0] intValue];
    CGFloat g = [StaticData.holidayColors[indexPath.row][1] intValue];
    CGFloat b = [StaticData.holidayColors[indexPath.row][2] intValue];
    CGFloat a = [StaticData.holidayColors[indexPath.row][3] intValue];
    
    return RGBA(r, g, b, a);
}


- (NSInteger)getType {
    return self.projectType;
}


@end
