//
//  MeViewController.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/16.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "BaseViewController.h"

@interface MeViewController : BaseViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIView *topInfoView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topHeightCons;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avatarLeadingCons;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIImageView *toLoginImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toLoginImageTrailCons;

// Me Collection part
@property (weak, nonatomic) IBOutlet UICollectionView *meInfoCollection;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *meInfoTopCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *meInfoHeightCons;

// Other CollectionView
@property (weak, nonatomic) IBOutlet UICollectionView *otherInfoCeollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherInfoCollectionTopCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherInfoHeightCons;

@end
