//
//  TopicWriteViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/15.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicWriteViewController.h"
#import "TopicWriteTextCell.h"
#import "TopicWriteImageCell.h"
#import <TPKeyboardAvoidingTableView.h>
#import <PureLayout.h>
#import "Helper.h"
#import <ZLPhotoActionSheet.h>
#import "TopicModel.h"
#import "LocationViewController.h"
#import "BaseNavigationController.h"

static NSString *const kTextCell = @"TextCell";
static NSString *const kImageCell = @"ImageCell";

@interface TopicWriteViewController ()

@property (strong, nonatomic) UITableView *tableViewOfSend;

// 图片选择
@property (nonatomic, strong) NSMutableArray<UIImage *> *lastSelectPhotos;
@property (nonatomic, strong) NSMutableArray<PHAsset *> *lastSelectAssets;
@property (nonatomic, strong) NSArray *arrDataSources;
@property (nonatomic, assign) BOOL isOriginal;

@end

@implementation TopicWriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.topic = [[TopicModel alloc] init];
    
    [self configNavBar];
    [self configTableView];

    [self addConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configNavBar {
    _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 44)];
    _navItem = [[UINavigationItem alloc] initWithTitle:@"发帖"];
    
    _navBar.items = [NSArray arrayWithObject:_navItem];
    _navBar.barTintColor = [UIColor whiteColor];
//    _navBar.translucent = NO;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"close"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navItem.leftBarButtonItem =leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(sendTopic:)];
    self.navItem.rightBarButtonItem = rightItem;
    
    [self.view addSubview:_navBar];
}

- (void)configTableView {
    _tableViewOfSend = ({
        TPKeyboardAvoidingTableView *tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 200;
        tableView.rowHeight = UITableViewAutomaticDimension;
        [tableView registerClass:[TopicWriteTextCell class] forCellReuseIdentifier:kTextCell];
        [tableView registerClass:[TopicWriteImageCell class] forCellReuseIdentifier:kImageCell];
        [self.view addSubview:tableView];
        tableView;
    });
}

- (void)addConstraints {
    
    [_tableViewOfSend autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_navBar withOffset:1];
    [_tableViewOfSend autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
    [_tableViewOfSend autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
    [_tableViewOfSend autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self inputBecomeFirstResponse];
}

#pragma  private method
- (BOOL)inputBecomeFirstResponse {
    TopicWriteTextCell *cell = (TopicWriteTextCell *)[_tableViewOfSend cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    if ([cell respondsToSelector:@selector(inputBecomeFirstResponder)]) {
        [cell inputBecomeFirstResponder];
    }
    return YES;
}

#pragma action 

- (void)backAction:(id)sender {
    [self removeBottomToolBar];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sendTopic:(id)sender {
    
}

#pragma UITableViewDataSource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 一个文字 一个图片
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 文字区域
    __weak typeof(self) weakSelf = self;
    if (0 == indexPath.row) {
        TopicWriteTextCell *cell = [tableView dequeueReusableCellWithIdentifier:kTextCell forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSLog(@"current thread1 %@", [NSThread currentThread]);
        cell.photoBtnBlock = ^{
            [weakSelf showActionForPhoto];
        };
        cell.locationBtnBlock = ^{
            LocationViewController *lvc = [[LocationViewController alloc] init];
            BaseNavigationController *baseNv = [[BaseNavigationController alloc] initWithRootViewController:lvc];
            [weakSelf presentViewController:baseNv animated:YES completion:nil];
        };
//        [cell.textView becomeFirstResponder];
        return cell;
    }else {  // 图片区域
        TopicWriteImageCell *imageCell = [tableView dequeueReusableCellWithIdentifier:kImageCell forIndexPath:indexPath];
        imageCell.selectionStyle = UITableViewCellSelectionStyleNone;
        imageCell.backgroundColor = [UIColor redColor];
        imageCell.images = self.topic.topicImages;
        return imageCell;
    }
}

#pragma UIAction
- (void)showActionForPhoto {
    
    __weak typeof(self) weakSelf = self;
    UIAlertController * ac = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [ac dismissViewControllerAnimated:YES completion:nil];

    }];
    
    UIAlertAction *paizhao = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *pickFromAblum = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if([Helper checkPhotoLibraryAuthorization]){
            [weakSelf openAlbum];
        }else {
            // 注意requestAuthorization 是开启了新的线程获取权限.因此后面要回到主线程更新UI
            [Helper requestPhotoLibraryAuthorizationStatus:^(BOOL authoried) {
                if (authoried) {
                    // 打开相册
                    [weakSelf openAlbum];
                }else {
                    // 引导打开设置
                    NSLog(@"current thread2 %@", [NSThread currentThread]);
                    dispatch_sync(dispatch_get_main_queue(), ^{
                         [weakSelf showSheetTips:@"请在iPhone的“设置->隐私->照片”中打开本应用的访问权限"];
                    });
                }
            }];
        }
        
    }];
    
    [ac addAction:cancel];
    [ac addAction:paizhao];
    [ac addAction:pickFromAblum];
    [self presentViewController:ac animated:YES completion:nil];
}

- (void)openAlbum {
    ZLPhotoActionSheet *actionSheet = [[ZLPhotoActionSheet alloc] init];
    actionSheet.maxSelectCount = 9;
    actionSheet.sender = self;
    __weak typeof(self) weakSelf = self;
    [actionSheet setSelectImageBlock:^(NSArray<UIImage *> * _Nonnull images, NSArray<PHAsset *> * _Nonnull assets, BOOL isOriginal) {
        weakSelf.arrDataSources = images;
        weakSelf.lastSelectAssets = assets.mutableCopy;
        weakSelf.lastSelectPhotos = images.mutableCopy;
        weakSelf.isOriginal = isOriginal;
        [weakSelf.topic.topicImages addObjectsFromArray:images];
        [weakSelf.tableViewOfSend reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:1 inSection:0], nil] withRowAnimation:UITableViewRowAnimationFade];
        
    }];
    [actionSheet showPhotoLibraryWithSender:self];
}

- (void)showSheetTips:(NSString *)tips {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:tips preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"不允许" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [ac addAction:cancelAction];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIApplication *app = [UIApplication sharedApplication];
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([app canOpenURL:settingsURL]) {
            [app openURL:settingsURL];
        }
    }];
    [ac addAction:okAction];
    
    [self presentViewController:ac animated:YES completion:nil];
}

#pragma Helper
- (void)removeBottomToolBar {
    [self.view endEditing:YES];
    TopicWriteTextCell *cell = [self.tableViewOfSend cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    if (cell.footerToolBar) {
        [cell.footerToolBar removeFromSuperview];
    }
}
@end
