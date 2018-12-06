//
//  SelectAreaViewController.m
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/21.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "SelectAreaViewController.h"

@interface SelectAreaViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *provicesArray;
    NSArray *areaArray;
    NSIndexPath *signIndexPath;
    NSInteger sign;
    UITableView *_tableView;
    NSString *provice;
    NSString *city;
    NSString *area;
}
@end

@implementation SelectAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择地址";
    provicesArray = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil]];
    sign = 1;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    [self creatView];
    // Do any additional setup after loading the view from its nib.
}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.hidden = YES;
//}
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    self.tabBarController.tabBar.hidden = NO;
//}
-(void)creatView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
#pragma mark--UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (sign == 1) {
        return provicesArray.count;
    }else if (sign == 2){
        return areaArray.count;
    }else if (sign == 3){
        return areaArray.count;
    }else{
        return 0;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.textColor = [UIColor colorWithHex:0x333333];
    if (sign == 1) {
        NSDictionary *dic = provicesArray[indexPath.row];
        cell.textLabel.text = dic[@"state"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }else if (sign == 2){
        NSDictionary *dic = areaArray[indexPath.row];
        cell.textLabel.text = dic[@"city"];
        
    }else if (sign == 3){
        
        cell.textLabel.text = areaArray[indexPath.row];
        
    }
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (sign ==1) {
        signIndexPath = indexPath;
        NSDictionary *dic = provicesArray[indexPath.row];
        provice = dic[@"state"];
        areaArray = dic[@"cities"];
        sign = 2;
        [_tableView reloadData];
    }else if (sign == 2){
        NSDictionary *dic = provicesArray[signIndexPath.row];
        NSArray *array = dic[@"cities"];
        NSDictionary *areaDic = array[indexPath.row];
        city = areaDic[@"city"];
        areaArray = areaDic[@"areas"];
        if (areaArray!=nil && areaArray.count>0) {
            sign = 3;
            [_tableView reloadData];
        }else{
            NSLog(@"没有区，直接返回就行了");
            NSString *areaString = [NSString stringWithFormat:@"%@%@",provice,city];
            if (self.selectAreaBlack) {
                self.selectAreaBlack(areaString);
            }
            [self.navigationController popViewControllerAnimated:NO];
        }
        
        
    }else if (sign == 3){
        NSLog(@"到区一级直接返回");
        area = areaArray[indexPath.row];
        NSString *areaString = [NSString stringWithFormat:@"%@%@%@",provice,city,area];
        if (self.selectAreaBlack) {
            self.selectAreaBlack(areaString);
        }
        [self.navigationController popViewControllerAnimated:NO];
        
    }else{
        
    }
}
//返回按钮点击实现方法
-(void)backButtonClick{
    if (sign == 1) {
        [self.navigationController popViewControllerAnimated:NO];
    }else if (sign == 2){
        sign = 1;
        [_tableView reloadData];
    }else if (sign == 3){
        sign = 2;
        NSDictionary *dic = provicesArray[signIndexPath.row];
        areaArray = dic[@"cities"];
        [_tableView reloadData];
    }
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
