//
//  MeViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/16.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "MeViewController.h"
#import "MeInfoCollectionViewCell.h"
#import "AppDelegate.h"
#import "Constants.h"
#import <PureLayout.h>
#import "LoginViewController.h"

NSString *const kMeCellIdentifier = @"MeInfoCell";
NSString *const kOtherCellIdentifier = @"OtherInfoCell";

NSString *const kMeHeadIdentifier = @"MeHeadIdentifier";
NSString *const kOtherHeadlIdentifier = @"OtherHeadlIdentifier";

@interface MeViewController (){
    CGFloat cellWidth;
    CGFloat cellHeight;
}

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initParams];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.meInfoHeightCons.constant = self.meInfoCollection.contentSize.height;
    self.otherInfoHeightCons.constant = self.otherInfoCeollectionView.contentSize.height;
}

- (void)initViews {
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationController.navigationBar.hidden = YES;
    
    self.avatarLeadingCons.constant = 25 * self.scale;
    self.avatarImage.layer.cornerRadius = 80 / 2;
    
    self.userName.text = @"点击登录";
    self.userName.font = [UIFont systemFontOfSize:22];
    
    self.toLoginImage.backgroundColor = [UIColor redColor];
    self.toLoginImageTrailCons.constant = 15 * self.scale;
    
    self.topInfoView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(go2Login:)];
    [self.topInfoView addGestureRecognizer:tap];
    
    // me collection
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]  init];
    layout.minimumInteritemSpacing = kCellInteritemSpacing;
    layout.minimumLineSpacing = kCellLineSpacing;
    layout.estimatedItemSize = CGSizeMake(cellWidth, cellHeight);
    layout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 30);
    
    self.meInfoCollection.collectionViewLayout = layout;
    self.meInfoCollection.tag = 0;
    self.meInfoCollection.dataSource = self;
    self.meInfoCollection.delegate = self;
    [self.meInfoCollection registerClass:[MeInfoCollectionViewCell class] forCellWithReuseIdentifier:kMeCellIdentifier];
    [self.meInfoCollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kMeHeadIdentifier];
    
    // other Collection
    UICollectionViewFlowLayout *layout1 = [[UICollectionViewFlowLayout alloc]  init];
    layout1.minimumInteritemSpacing = kCellInteritemSpacing;
    layout1.minimumLineSpacing = kCellLineSpacing;
    layout1.estimatedItemSize = CGSizeMake(cellWidth, cellHeight);
    layout1.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 30);
    self.otherInfoCeollectionView.collectionViewLayout = layout1;
    self.otherInfoCeollectionView.tag = 1;  // tag的设置需要在dataSource之前 否则崩溃
    self.otherInfoCeollectionView.delegate = self;
    self.otherInfoCeollectionView.dataSource = self;
    [self.otherInfoCeollectionView registerClass:[MeInfoCollectionViewCell class] forCellWithReuseIdentifier:kOtherCellIdentifier];
    [self.otherInfoCeollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kOtherHeadlIdentifier];
}

- (void)initParams {
    UIImage *image = [UIImage imageNamed:@"tabbar_me_selected"];
    UILabel * label = [[UILabel alloc] init];
    label.text = @"ces";
    label.font = [UIFont systemFontOfSize:kCellLableFontSize];
    [label sizeToFit];
    cellHeight = kCellTopMargin + image.size.height + kCellLabelTopMargin + label.bounds.size.height + kCellLableBottomMargin;
    cellWidth = (((AppDelegate *)[UIApplication sharedApplication].delegate).screenWidth - 3 * kCellInteritemSpacing) / 4;
}

#pragma UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView.tag == 0) {
        return 8;
    }else {
        return 4;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MeInfoCollectionViewCell *cell;
    if (collectionView.tag == 0) {
        cell = [_meInfoCollection dequeueReusableCellWithReuseIdentifier:kMeCellIdentifier forIndexPath:indexPath];
        cell.cellImage.image = [UIImage imageNamed:@"tabbar_me_selected"];
        cell.cellName.text = @"主题";
    }else {
        cell = [_otherInfoCeollectionView dequeueReusableCellWithReuseIdentifier:kOtherCellIdentifier forIndexPath:indexPath];
        cell.cellImage.image = [UIImage imageNamed:@"tabbar_me"];
        cell.cellName.text = @"其他";
    }
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *header;
        UILabel *label = [[UILabel alloc] init];

        if (collectionView.tag == 0) {
            header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kMeHeadIdentifier forIndexPath:indexPath];
            label.text = @"头部";
        }else {
            header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kOtherHeadlIdentifier forIndexPath:indexPath];
            label.text = @"其他";
        }
        
        label.textColor = [UIColor grayColor];
        UIImageView *headImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_me"]];
        [header addSubview:headImage];
        [header addSubview:label];
        
        [headImage autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:header withOffset:15];
        [headImage autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [label autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:headImage withOffset:10];
        [label autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        header.backgroundColor = [UIColor greenColor];
        return header;
    }else{
        return nil;
    }
}

#pragma UICollectionViewDelegateFlowLayout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(cellWidth, cellHeight);
//}


#pragma all UIGestureRecognizer
- (void)go2Login:(UITapGestureRecognizer *)recognizer {
    // TODO go to login
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LoginViewController *vc = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma personal mehood



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
