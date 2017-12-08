//
//  ForumViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/16.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "ForumViewController.h"
#import "MeInfoCollectionViewCell.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "PureLayout.h"
#import "TopicViewController.h"

static NSString *const kForumCell = @"kForumCell";
@interface ForumViewController (){
    CGFloat cellWidth;
    NSArray *categoryArray;
}

@end

@implementation ForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self configTabbarItem];
    [self initParams];
    [self initViews];
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initParams {
    cellWidth = (((AppDelegate *)[UIApplication sharedApplication].delegate).screenWidth - 2 * kCellInteritemSpacing) / 3;
    categoryArray = @[@"运动", @"娱乐", @"摄影", @"二次元", @"车友交流",@"大嘴夸"];
}

- (void)initViews {
    
    self.navigationItem.title = @"社区";
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = kCellInteritemSpacing;
    layout.minimumLineSpacing = kCellLineSpacing;
    layout.estimatedItemSize = CGSizeMake(cellWidth, 200);
    
    self.forumCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.forumCollectionView.backgroundColor = [UIColor brownColor];
    self.forumCollectionView.delegate = self;
    self.forumCollectionView.dataSource =self;
    
    [self.forumCollectionView registerClass:[MeInfoCollectionViewCell class] forCellWithReuseIdentifier:kForumCell];
    [self.view addSubview:self.forumCollectionView];
    
    [self.forumCollectionView autoPinToTopLayoutGuideOfViewController:self withInset:0];
    [self.forumCollectionView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
    [self.forumCollectionView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
    [self.forumCollectionView autoPinToBottomLayoutGuideOfViewController:self withInset:0];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
}

#pragma UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return categoryArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MeInfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kForumCell forIndexPath:indexPath];
    cell.cellImage.image = [UIImage imageNamed:@"wow"];
    cell.cellName.text = categoryArray[indexPath.row];
    return cell;
}

#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    TopicViewController *vc = [[TopicViewController alloc] init];
    [vc setValue:[self categoryForIndex:indexPath.row] forKey:@"cateInfo"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma helper
- (NSString *)categoryForIndex:(NSInteger)index {
    NSString *str = nil;
    switch (index) {
        case 0:
            str = @"yishiting";
            break;
        case 1:
            str = @"juntuan";
            break;
        case 2:
            str = @"qianzhan";
            break;
        case 3:
            str = @"tiexue";
            break;
        case 4:
            str = @"shengguang";
            break;
        case 5:
            str = @"heifeng";
            break;
        case 6:
            str = @"lieshou";
            break;
        case 7:
            str = @"fengbao";
            break;
        case 8:
            str = @"anying";
            break;
        case 9:
            str = @"feicui";
            break;
        case 10:
            str = @"yili";
            break;
        default:
            str= nil;
            break;
    }
    return str;
}

@end
