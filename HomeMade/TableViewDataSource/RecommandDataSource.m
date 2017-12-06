//
//  RecommandDataSource.m
//  HomeMade
//
//  Created by He,Yulong on 2017/8/27.
//  Copyright © 2017年 He,Yulong. All rights reserved.
//

#import "RecommandDataSource.h"
#import "RecomCellView.h"
#import "FlyImage.h"
#import "DuoBanBean.h"
@implementation RecommandDataSource

- (instancetype)initWithData:(NSArray *)data {
    if (self = [super init]) {
        _dataSource = data;
    }
    
    return self;
}

#pragma UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count - 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecomCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    DuoBanBean *bean = _dataSource[indexPath.row];
    cell.titleLabel.text = bean.title;
    cell.abstractLabel.text = bean.abstract;
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:bean.thumbs[0]];
    NSDictionary *dic1 = [dic objectForKey:@"small"];
    NSString *url = [dic1 objectForKey:@"url"];
    
    [cell.topImage setImageURL: [NSURL URLWithString:url]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


@end
