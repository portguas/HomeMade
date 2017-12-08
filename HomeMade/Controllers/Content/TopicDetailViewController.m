//
//  TopicDetailViewController.m
//  HomeMade
//
//  Created by He,Yulong on 2017/9/10.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "TopicDetailViewController.h"
#import "TopicTitleCell.h"
#import "TopicInfoCell.h"
#import "TopicBodyCell.h"
#import "TopicReplyCell.h"

static NSString *const kTopicTitle = @"topicTitle";
static NSString *const kTopicInfo = @"topicInfo";
static NSString *const kTopicBody = @"topicBody";
static NSString *const kTopicReply = @"topicReply";

@interface TopicDetailViewController ()

@end

@implementation TopicDetailViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // TODO
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor= [UIColor brownColor];
    [self configNav];
    [self configTableView];
    [self configHeaderView];
    [self configGestures];
    
}

#pragma  Config
- (void)configNav {
    self.navigationItem.title = @"主题";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navigationBack"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem =leftItem;
}

- (void)configTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.backgroundColor = [UIColor yellowColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[TopicTitleCell class] forCellReuseIdentifier:kTopicTitle];
    [_tableView registerClass:[TopicInfoCell class] forCellReuseIdentifier:kTopicInfo];
    [_tableView registerClass:[TopicBodyCell class] forCellReuseIdentifier:kTopicBody];
    [_tableView registerClass:[TopicReplyCell class] forCellReuseIdentifier:kTopicReply];
}

- (void)configHeaderView {
    
}

- (void)configGestures {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:panGesture];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 作为楼主的帖子
    if (section == 0) {
        return 3;
    }else {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTitleCell *titleCell = [tableView dequeueReusableCellWithIdentifier:kTopicTitle forIndexPath:indexPath];
    
    TopicInfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:kTopicInfo forIndexPath:indexPath];
    
    TopicBodyCell *bodyCell = [tableView dequeueReusableCellWithIdentifier:kTopicBody forIndexPath:indexPath];
    
    TopicReplyCell *replyCell = [tableView dequeueReusableCellWithIdentifier:kTopicReply forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                return [self confitTitleCellWithtCell:titleCell indexPath:indexPath];
                break;
            case 1:
                return [self confitInfoCellWithtCell:infoCell indexPath:indexPath];
                break;
            case 2:
                return [self confitBodyCellWithtCell:bodyCell indexPath:indexPath];
                break;
            default:
                break;
        }
    }else {
        return [self confitReplyCellWithtCell:replyCell indexPath:indexPath];
    }
    
    return [UITableViewCell new];
}

#pragma Config Cell

/**
 主题信息

 @param cell 主题cell
 @param indexPath 行数
 @return 返回cell
 */
- (TopicTitleCell *)confitTitleCellWithtCell:(TopicTitleCell *)cell indexPath:(NSIndexPath *)indexPath {
    cell.title.text = @"这是一个测试的主题啊,测试的啊,真的是测试的啊";
    return cell;
}

/**
 主题用户信息

 @param cell 用户cell
 @param indexPath 行数
 @return 用户信息cell
 */
- (TopicInfoCell *)confitInfoCellWithtCell:(TopicInfoCell *)cell indexPath:(NSIndexPath *)indexPath {
    cell.avatarImage.image = [UIImage imageNamed:@"tabbar_me_selected"];
    cell.userNickName.text = @"portguas";
    return cell;
}

- (TopicBodyCell *)confitBodyCellWithtCell:(TopicBodyCell *)cell indexPath:(NSIndexPath *)indexPath {
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"这是主题的内容啊,主题的内容啊,,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊,主题的内容啊"];
    str.yy_font = [UIFont boldSystemFontOfSize:17];
    str.yy_color = [UIColor blackColor];
//    [str yy_setColor:[UIColor redColor] range:NSMakeRange(0, 4)];
    str.yy_lineSpacing = 10;
    UIFont *font = [UIFont systemFontOfSize:16];
    {
        UIImage *image = [UIImage imageNamed:@"tabbar_rating_selected"];
        image = [UIImage imageWithCGImage:image.CGImage scale:2 orientation:UIImageOrientationUp];
        NSMutableAttributedString *attch = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeLeft attachmentSize:CGSizeMake(self.view.bounds.size.width, image.size.height) alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        [str appendAttributedString:attch];
    }
    {
        NSMutableAttributedString *attch1 = [[NSMutableAttributedString alloc] initWithString:@"sdasd"];
        [str appendAttributedString:attch1];
    }
//    CGSize size = CGSizeMake(self.view.bounds.size.width , CGFLOAT_MAX);
//    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:str];
//    cell.yyBodyLable.bounds = layout.textBoundingRect;
//    cell.yyBodyLable.textLayout = layout;
    cell.yyBodyLable.attributedText = str;

   
    return cell;
}

- (TopicReplyCell *)confitReplyCellWithtCell:(TopicReplyCell *)cell indexPath:(NSIndexPath *)indexPath {
    cell.replyLabel.text =  @"这是回复, 写的不错。写的不错!";
    return cell;
}

#pragma Gesture

- (void)panGesture:(UIPanGestureRecognizer *)regognizer {
    // TODO 添加手动侧滑返回的手势
    NSLog(@"pan");
}
@end
