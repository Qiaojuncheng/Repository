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
#import "QJCShoppingtabbar.h"
#import "HBK_ShoppingCartViewController.h"
#import "OrderDetailViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong , nonatomic) UITableView * tableView ;
@property (copy , nonatomic) NSArray * dataArray;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    _dataArray =@[@"下拉无数据显示",@"图片验证码",@"添加阴影和边框",@"picker联动",@"轮播图",@"多标签展示",@"标签导航栏",@"图片+文字Item",@"商城模块(购物车、订单、地址)",@"商城订单",@"",@"启动广告",@"引导页",@""];
    
//      图片验证码
//          tableview  无数据 需要下拉一次才能显示来
    [self addtableview];
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
    [self showHudInView:self.view hint:@"加载中..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHud];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    });
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
     return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 

    
    
        NSString * StrType =  _dataArray[indexPath.row];
    
        QJCBaseViewController * bacVc =[[QJCBaseViewController alloc]init];
        bacVc.showType  =  StrType;
        [self.navigationController pushViewController:bacVc animated:YES];
    
    
    
    
//    if ([StrType isEqualToString:@"商城模块(购物车、订单、地址)"]) {
//        QJCShoppingtabbar * bar= [[QJCShoppingtabbar alloc]init];
//        [UIApplication sharedApplication].keyWindow.rootViewController = bar;
////        HBK_ShoppingCartViewController  *    vc =   [[HBK_ShoppingCartViewController alloc]init];
////        vc.isSubPage = YES;
////        [self.navigationController pushViewController:vc animated:NO];
//    }
    

    
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
