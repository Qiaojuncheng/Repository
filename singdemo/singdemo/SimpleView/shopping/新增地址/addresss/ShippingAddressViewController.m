//
//  ShippingAddressViewController.m
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/19.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ShippingAddressViewController.h"
#import "ShippingAddressTableViewCell.h"
#import "ZAddNewAddressViewController.h"
//#import "CloseAnAccountViewController.h"
@interface ShippingAddressViewController ()<UITableViewDelegate,UITableViewDataSource,ShippingAddressTableViewCellDelegate>
{
    NSMutableArray *listArray;
    UITableView *_tableView;
    ShippingAddressModel *sighModel;
}
@end

@implementation ShippingAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收货地址";
    listArray = [NSMutableArray array];
    [self creatView];
    [self getDataFromService];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(commitButtonClick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
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
-(void)getDataFromService{
   int  rand =  random()%8 ;
    
         [listArray removeAllObjects];
    for (int i = 0;i< 50; i++) {
        
        ShippingAddressModel *model = [[ShippingAddressModel alloc]init];
       
//            "id":"2",（ID）
//            "user_id":"1",（用户ID）
//            "name":"宝宝",（收件人名称）
//            "phone":"110",（联系电话）
//            "location":"河南郑州",（地址）
//            "address":"大学科技园",（详细地址）
//            "default":"0",（1默认）
//            "create_time":"1491549846"
            
            model.id = @"dsaf";
            model.user_id = @"1";
            model.name = @"宝宝";
            model.phone = @"110";
            model.location = @"河南郑州";
            model.address = @"大学科技园";
            model.isSelected = NO;
            model.isDefault = @"1";
            model.create_time = @"1491549846";
        if (i  == rand) {
            model.isSelected = YES;
        }
        
                    [listArray addObject:model];
    
                    if ([model.isDefault isEqualToString:@"1"]) {
                        sighModel = model;
                    }
                }
                [_tableView reloadData];
    
    
    
//    NSArray *keysArray = @[@"uid"];
//    NSArray *valuesArray = @[UserId];
//    NSDictionary *dic = [NSDictionary dictionaryWithObjects:valuesArray forKeys:keysArray];
//    NSString *urlString = [NSString stringWithFormat:@"%@%@",requestURL,AddressList];
//    [ZJNRequestManager postWithUrlString:urlString parameters:dic success:^(id data) {
//        NSLog(@"%@",data);
//        NSNumber *status = data[@"code"];
//        if ([[status stringValue] isEqualToString:@"200"]) {
//            NSArray *array = data[@"info"];
//            [listArray removeAllObjects];
//            for (NSDictionary *dic in array) {
//                ShippingAddressModel *model = [[ShippingAddressModel alloc]initWithDictionary:dic];
//                [listArray addObject:model];
//
//                if ([model.isDefault isEqualToString:@"1"]) {
//                    sighModel = model;
//                }
//            }
//            [_tableView reloadData];
//        }else{
//            [self showHint:data[@"mes"]];
//        }
//
//        if(listArray.count ==0){
//            [self ShowNoDataViewWithStr:@"暂无数据" yOffset:-60];
//        }else{
//            [self hintNodataView];
//        }
//    } failure:^(NSError *error) {
//        [self ShowNoDataViewWithStr:@"暂无数据" yOffset:-60];
//        [self showHint:@"请求服务器失败"];
//    }];
}
//选择收货地址后点击确认按钮
-(void)commitButtonClick:(id)sender{
   
    if (self.EnsureIsBack) {
         [self.navigationController popViewControllerAnimated:YES];
        
        return;
    }else{
    if (sighModel == nil) {
        [self showHint:@"请选择收货地址"];
        return;
    }
//    CloseAnAccountViewController *view = [[CloseAnAccountViewController alloc]init];
//    view.model = sighModel;
//    self.OrderModel.address_id  = sighModel.a_id;
//    view.OrderModel = self.OrderModel;
//    view.totalMoneyStr = self.totalMoneyStr;
//    view.goodsArray = self.goodsArray;
//    [self.navigationController pushViewController:view animated:NO];
    }
}
-(void)creatView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.view.backgroundColor =MainBackColor;
    _tableView.tableFooterView =[[UIView alloc]init];
    _tableView.separatorColor = LINECOLOR;
    [self.view addSubview:_tableView];
}

#pragma mark--UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return listArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil];
//    ShippingAddressModel *model = listArray[indexPath.section];
//    CGSize size = [model.address boundingRectWithSize:CGSizeMake(ScreenWidth-40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return 116;//+size.height;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cellid";
    ShippingAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ShippingAddressTableViewCell" owner:self options:nil]lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = listArray[indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.EnsureIsBack) {
        self.BackModel(listArray[indexPath.section]) ;
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

#pragma mark--ShippingAddressTableViewCellDelegate

//默认按钮点击实现方法
-(void)shippingAddressTableViewCellMoRenButtonClick:(UIButton *)button{
    
    NSLog(@"默认按钮点击实现方法");
    for (ShippingAddressModel *model in listArray) {
        model.isSelected = NO;
    }
    ShippingAddressTableViewCell *cell = (ShippingAddressTableViewCell *)[button superview].superview;
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    ShippingAddressModel *model = listArray[indexPath.section];
 //     [self ChangeDefaultAddressWithModel:model];
    model.isSelected = button.isSelected;
    sighModel = model;
//
    [_tableView reloadData];
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
//编辑按钮点击实现方法
-(void)shippingAddressTableViewCelleditButtonClick:(UIButton *)button{
    ShippingAddressTableViewCell *cell = (ShippingAddressTableViewCell *)[button superview].superview;
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    ShippingAddressModel *model = listArray[indexPath.section];
    ZAddNewAddressViewController *view = [[ZAddNewAddressViewController alloc]init];
    view.refershAddressListBlock = ^(void){
        [self getDataFromService];
    };
    view.model = model;
    [self.navigationController pushViewController:view animated:NO];
    NSLog(@"编辑按钮点击实现方法");
}
//删除按钮点击实现方法
-(void)shippingAddressTableViewCelldeleteButtonClick:(UIButton *)button{
//    ShippingAddressTableViewCell *cell = (ShippingAddressTableViewCell *)[button superview].superview;
//    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
//    ShippingAddressModel *model = listArray[indexPath.section];
//    NSLog(@"删除按钮点击实现方法");
//    NSArray *keysArray = @[@"id"];
//    NSArray *valuesArray = @[model.address_id];
//    NSDictionary *dic = [NSDictionary dictionaryWithObjects:valuesArray forKeys:keysArray];
//    NSString *urlString = [NSString stringWithFormat:@"%@%@",requestURL,AddressDel];
//    [self showHudInView:self.view hint:nil];
//    [ZJNRequestManager postWithUrlString:urlString parameters:dic success:^(id data) {
//        NSLog(@"%@",data);
//        NSNumber *status = data[@"code"];
//        if ([[status stringValue] isEqualToString:@"200"]) {
//            sighModel  = nil;
//            [self getDataFromService];
//        }else{
//            [self showHint:data[@"info"]];
//        }
//        [self hideHud];
//    } failure:^(NSError *error) {
//        [self showHint:@"请求服务器失败"];
//        [self hideHud];
//    }];
//
//
//}
 
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//// 更改默认地址
//
//-(void)ChangeDefaultAddressWithModel:(ShippingAddressModel *)model{
//
//     NSDictionary *dic;
//         NSArray *keysArray = @[@"uid",@"name",@"phone",@"location",@"address",@"default",@"id"];
//        NSArray *valuesArray = @[UserId,model.name,model.phone,model.location,model.address,@"1",model.address_id];
//        dic = [NSDictionary dictionaryWithObjects:valuesArray forKeys:keysArray];
//
//    NSString *urlString = [NSString stringWithFormat:@"%@%@",requestURL,ShoppingCarAddAddress];
//    [ZJNRequestManager postWithUrlString:urlString parameters:dic success:^(id data) {
//        NSLog(@"%@",data);
//        NSNumber *status = data[@"code"];
//        if ([[status stringValue] isEqualToString:@"200"]) {
//            model.isSelected = YES;
//            sighModel = model;
//
//            if (self.EnsureIsBack) {
//                self.BackModel(sighModel);
//            }
//
//            [_tableView reloadData];
//        }else{
//            [self showHint:@"请求失败"];
//        }
//    } failure:^(NSError *error) {
//        [self showHint:@"请求失败"];
//    }];
//

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addNewAdressButtonClick:(id)sender {
    //添加新地址
    ZAddNewAddressViewController *view = [[ZAddNewAddressViewController alloc]init];
    view.refershAddressListBlock = ^(void){
        [self getDataFromService];
    };
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:NO];

}
@end
