//
//  ViewController.m
//  singdemo
//
//  Created by MYMAc on 2018/7/13.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "ViewController.h"
#import "QJCCodeView.h"
#import "ZLAdvertViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong , nonatomic) UITableView * tableView ;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
//      图片验证码
//    [self ImageCode];
//          tableview  无数据 需要下拉一次才能显示来
//    [self addtableview];
//   启动广告
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAd) name:@"ZLPushToAdvert" object:nil];
}

// 进入广告链接页
- (void)pushToAd {
    
    ZLAdvertViewController *adVc = [[ZLAdvertViewController alloc] init];
    [self.navigationController pushViewController:adVc animated:YES];
    
}

#pragma mark 图片验证码

//-(void)ImageCode{

    //    QJCCodeView* CodeView = [[QJCCodeView alloc]initWithFrame:CGRectMake(0, 80, ScreenWidth, 100)];
    //    CodeView.backgroundColor = [UIColor whiteColor];
    //    CodeView.ReaultBlock = ^(NSString *token, NSString *code_name, NSString *code_value) {
    //        NSLog(@"token =%@\n code_name = %@ \n code_value = %@",token,code_name,code_value);
    //    };
    //    [self.view addSubview:CodeView];
//}
#pragma mark
-(void)addtableview{
    self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, StatusBarHeight, ScreenWidth, ScreenHeight - StatusBarHeight )];
    self.tableView.clipsToBounds = YES;
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header  = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    [self.view addSubview:self.tableView];
    
}

- (void)loadData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    });
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

#pragma mark - TableView 占位图

//- (UIImage *)xy_noDataViewImage {
//    return [UIImage imageNamed:@"note_list_no_data"];
//}

- (NSString *)xy_noDataViewMessage {
    return @"都用起来吧, 起飞~";
}

- (UIColor *)xy_noDataViewMessageColor {
    return [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
