//
//  LocationViewController.m
//  HomeMade
//
//  Created by He,Yulong on 10/27/17.
//  Copyright © 2017 He,Yulong. All rights reserved.
//

#import "LocationViewController.h"
#import <PureLayout.h>
#import <CoreLocation/CoreLocation.h>
#import "LocationHelper.h"

static NSString * const kTableViewCellIndentity = @"localcationCell";

@interface LocationViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, CLLocationManagerDelegate>

@property (nonatomic, strong) UITableView *tableViewOfLocation;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchController *searchCtl;
// 定位
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic) CLLocationCoordinate2D bdCoordinate;
// 位置信息
@property (nonatomic, strong) NSString *cityName;  // 城市
@property (nonatomic, strong) NSString *district;  // 区

// 数据源数组
@property (nonatomic, strong) NSMutableArray *datas;
// 搜索结果数组
@property (nonatomic, strong) NSMutableArray *results;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initDatas];
    [self initViews];
    [self initLocation];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 初始化一些本地数据
- (void)initDatas {
    _datas = [NSMutableArray arrayWithCapacity:0];
    _results = [NSMutableArray arrayWithCapacity:0];
    _datas = [@[@{@"title":@"不显示位置",@"cellType":@"defualt"}] mutableCopy];
}

- (void)initViews {
    self.view.backgroundColor =[UIColor whiteColor];
    // 导航栏
    self.title = @"所在位置";
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem * leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(close:)];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    
    // UISearchControl
    _searchCtl = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchCtl.searchResultsUpdater = self;
    _searchCtl.dimsBackgroundDuringPresentation = NO;
    _searchCtl.hidesNavigationBarDuringPresentation = YES;
    [self.searchCtl.searchBar sizeToFit];
    // 添加如下两句 否则搜索框激活的时候searchbar不见了
    self.definesPresentationContext = YES;
//    self.extendedLayoutIncludesOpaqueBars  = YES;
    
    // tableview
    _tableViewOfLocation = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableViewOfLocation.estimatedRowHeight = 80;
    _tableViewOfLocation.rowHeight = UITableViewAutomaticDimension;
    _tableViewOfLocation.delegate = self;
    _tableViewOfLocation.dataSource = self;
    _tableViewOfLocation.tableHeaderView = _searchCtl.searchBar;
    _tableViewOfLocation.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_tableViewOfLocation];
    [_tableViewOfLocation autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view];
    [_tableViewOfLocation autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
    [_tableViewOfLocation autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
    [_tableViewOfLocation autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view];
}


- (void)initLocation {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;  // 精确度
    // 设置定位距离过滤参数 (当本次定位和上次定位之间的距离大于或等于这个值时，调用代理方法)
    self.locationManager.distanceFilter = kCLDistanceFilterNone;   // 如果设置为none就表明移动就会调用代理 如果设置为100,那么表示移动了100才会调用代理
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {//iOS 8
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startMonitoringSignificantLocationChanges];
    [self.locationManager startUpdatingLocation];
}

#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_searchCtl.isActive) {
        return self.results.count;
    }
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellIndentity];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kTableViewCellIndentity];
    }
    if (_searchCtl.isActive) {
//        cell.textLabel.text = [self.results objectAtIndex:indexPath.row];
//        cell.detailTextLabel.text = [NSString stringWithFormat:@"这是%@", [self.results objectAtIndex:indexPath.row]];
    }else {
        cell.textLabel.text = self.datas[indexPath.row][@"title"];
//        cell.detailTextLabel.text = [NSString stringWithFormat:@"这是%@", [self.datas objectAtIndex:indexPath.row]];;
    }
    
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    return cell;
}

#pragma UISearchResultsUpdating
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *inputStr = _searchCtl.searchBar.text;
    if (self.results.count > 0) {
        [self.results removeAllObjects];
    }
    for (NSString *str in self.datas) {
        
        if ([str.lowercaseString rangeOfString:inputStr.lowercaseString].location != NSNotFound) {
            
            [self.results addObject:str];
        }
    }
    
    [self.tableViewOfLocation reloadData];
    
}

#pragma CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.location = (CLLocation *)[locations lastObject];
    self.bdCoordinate = [LocationHelper ggToBDEncrypt:self.location.coordinate];
    
    // 反地理编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    __weak typeof(self) weakSelf = self;
    [geocoder reverseGeocodeLocation:self.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = [placemarks objectAtIndex:0];
            // 城市
            NSString *city = placeMark.locality;
            if (!city) {
                // 直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placeMark.administrativeArea;
            }
            weakSelf.cityName = city;
            weakSelf.district = placeMark.subLocality;
            
            if (weakSelf.datas.count > 1) {
                NSString *cityName = weakSelf.datas[1][@"cityName"];
                NSString *checkMark = weakSelf.datas[1][@"checkMark"];
                //                if (cityName.length > 0) {
                //                    weakSelf.datas replaceObjectAtIndex:1 withObject:@{@"cityName": city, @"location":@{@"lat": weakSelf}}
                //                }
            }else if (weakSelf.datas) {
                //                weakSelf.datas insertObject:(nonnull id) atIndex:<#(NSUInteger)#>
            }
            
            [weakSelf.tableViewOfLocation reloadData];
        }
    }];
}

#pragma Actions
- (void)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
