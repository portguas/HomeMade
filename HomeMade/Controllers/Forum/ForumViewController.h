//
//  ForumViewController.h
//  HomeMade
//
//  Created by He,Yulong on 2017/8/16.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "BaseViewController.h"

@interface ForumViewController : BaseViewController<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) UICollectionView *forumCollectionView;

@end
