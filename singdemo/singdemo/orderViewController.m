//
//  orderViewController.m
//  singdemo
//
//  Created by MYMAc on 2018/8/6.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "orderViewController.h"
#import "QJCRequestManager.h"
#import "QJCOrderModel.h"
#import "QJCOrdercell.h"
@interface orderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong ,nonatomic) NSMutableArray  * dataArray;
@property (strong ,nonatomic) UITableView * tableView;
@end

@implementation orderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self addtableview];
    // Do any additional setup after loading the view.
}
-(void)addtableview{
    self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavStatusBarHeight -40 )];
    self.tableView.clipsToBounds = YES;
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.separatorInset = UIEdgeInsetsMake(0,  ScreenWidth, 0, 0);
    self.tableView.tableFooterView = [UIView new];
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header  = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    [self.view addSubview:self.tableView];
    
}
-(void)loadData{
    self.dataArray = [[NSMutableArray alloc]init];

    NSString *urlString = [NSString stringWithFormat:@"http://115.28.220.220:8080/bone/app/order/list.json"];
    NSArray *keysArray = @[@"sessionId",@"state"];
 
    NSArray *valueArray = @[@"1",self.statc];
 NSDictionary *dic = [NSDictionary dictionaryWithObjects:valueArray forKeys:keysArray];
    [QJCRequestManager postWithUrlString:urlString parameters:dic success:^(id data) {
        NSLog(@" dic = %@ \ndata = %@",dic,data);
        NSString *retcode = [NSString stringWithFormat:@"%@",data[@"retcode"]];
        if ([retcode isEqualToString:@"0000"]) {
            for (NSDictionary * datadic  in data[@"data"]) {
                QJCOrderListmodel * model =[QJCOrderListmodel yy_modelWithJSON:datadic];
//                model.list = [datadic objectForKey:data[@"data"][@"userList"]];
                [self.dataArray addObject:model ];
            }
          }
        [self.tableView reloadData];

        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }  failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];

}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QJCOrderListmodel  *modle = self.dataArray[indexPath.row];

    QJCOrdercell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"QJCOrdercell" owner:self options:nil]lastObject];
    }
    cell.modle= modle;

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QJCOrderListmodel  *modle = self.dataArray[indexPath.row];
    if (modle.userList.count > 0){
        return 115 + modle.userList.count * 25;
    }
    else{
        return 115  ;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
     NSString * StrType =  _dataArray[indexPath.row];
  
    
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
