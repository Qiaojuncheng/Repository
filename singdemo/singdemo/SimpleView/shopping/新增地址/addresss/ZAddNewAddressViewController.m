//
//  AddNewAddressViewController.m
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/17.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ZAddNewAddressViewController.h"
#import "RightTextFieldTableViewCell.h"
#import "TextFieldTableViewCell.h"
#import "MoRenSelectedView.h"
//#import "CloseAnAccountViewController.h"
#import "SelectAreaViewController.h"
@interface ZAddNewAddressViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    NSString *name;
    NSString *phone;
    NSString *address;
    NSString *detailAddress;
    NSString *moRen;
    
    UITableView *_tableView;
}
@end

@implementation ZAddNewAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新增收货地址";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(goToNextView)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self settingString];
    // Do any additional setup after loading the view from its nib.
}
-(void)settingString{
    if (self.model != nil) {
        name = self.model.name;
        phone = self.model.phone;
        address = self.model.location;
        detailAddress = self.model.address;
        if ([self.model.isDefault isEqualToString:@"0"]) {
            moRen = @"0";
        }else{
            moRen = @"1";
        }
        
    }else{
        name = @"";
        phone = @"";
        address = @"";
        detailAddress = @"";
        moRen = @"0";
    }
    [self creatView];

}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.hidden = YES;
//}
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    self.tabBarController.tabBar.hidden = NO;
//}
#pragma mark--UITableViewDelegate,UITableViewDataSource
-(void)creatView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =[UIColor whiteColor];
    _tableView.separatorInset =UIEdgeInsetsMake(0, 15, 0, 15);
    _tableView.separatorColor = [UIColor colorWithHex:0xececec];
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 60;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    MoRenSelectedView *view = [[MoRenSelectedView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    [view.cSwithch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    if ([moRen isEqualToString:@"0"]) {
        view.cSwithch.on = NO;
    }else{
        view.cSwithch.on = YES;
    }
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 || indexPath.row == 1) {
        static NSString *cellid = @"cellid";
        RightTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"RightTextFieldTableViewCell" owner:self options:nil]lastObject];
        }
        cell.textField.delegate = self;
        cell.textField.textAlignment = NSTextAlignmentLeft;
        if (indexPath.row == 0) {
            cell.label.text = @"收货人:";
            cell.textField.text = name;
        cell.textField.placeholder=@"请填写收货人";
        }else{
            cell.label.text = @"手机号:";
            cell.textField.text = phone;
            cell.textField.placeholder=@"请输入手机号码";
        }
        cell.textLabel.textColor = DEEPTintColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row == 2){
        static NSString *cellid = @"cellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"所在地区：%@",address];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = DEEPTintColor;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        static NSString *cellid = @"cellId";
        TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"TextFieldTableViewCell" owner:self options:nil]lastObject];
        }
        cell.textField.text = detailAddress;
        cell.textField.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        SelectAreaViewController *view = [[SelectAreaViewController alloc]init];
        view.selectAreaBlack = ^(NSString *areaString){
            UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = [NSString stringWithFormat:@"所在地区：%@",areaString];
            address = areaString;
        };
        view.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:view animated:NO];
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    UITableViewCell *cell = (UITableViewCell *)[textField superview].superview;
    NSIndexPath *indexpath = [_tableView indexPathForCell:cell];
    if (indexpath.row == 0) {
        name = textField.text;
    }else if (indexpath.row == 1){
        phone = textField.text;
    }else if (indexpath.row == 3){
        detailAddress = textField.text;
    }
}
//switch触发方法
-(void)switchChanged:(UISwitch *)cSwitch
{
    if (cSwitch.isOn) {
        moRen = @"1";
    }else{
        moRen = @"0";
    }
}
//保存后跳转到结算页面
-(void)goToNextView{
    /*
     id：修改传收货地址ID，添加不传
     uid：用户ID
     name：收货人姓名
     phone：联系方式
     location：省市区
     address：详细地址
     default：是否默认（1默认）
//     */
//    if (name.length == 0) {
//        [self showHint:@"请输入收货人姓名"];
//        return;
//    }else if (phone.length == 0){
//        [self showHint:@"请输入收货人手机号"];
//        return;
//    }else if (address.length == 0){
//        [self showHint:@"请选择所在地区"];
//        return;
//    }else if (detailAddress.length == 0){
//        [self showHint:@"请输入详细地址"];
//        return;
//    }
//    NSDictionary *dic;
//    if (self.model != nil) {
//        NSArray *keysArray = @[@"uid",@"name",@"phone",@"location",@"address",@"default",@"id"];
//        NSArray *valuesArray = @[UserId,name,phone,address,detailAddress,moRen,self.model.address_id];
//        dic = [NSDictionary dictionaryWithObjects:valuesArray forKeys:keysArray];
//    }else{
//        NSArray *keysArray = @[@"uid",@"name",@"phone",@"location",@"address",@"default"];
//        NSArray *valuesArray = @[UserId,name,phone,address,detailAddress,moRen];
//        dic = [NSDictionary dictionaryWithObjects:valuesArray forKeys:keysArray];
//    }
//    
//    NSString *urlString = [NSString stringWithFormat:@"%@%@",requestURL,ShoppingCarAddAddress];
//    [ZJNRequestManager postWithUrlString:urlString parameters:dic success:^(id data) {
//        NSLog(@"%@",data);
//        NSNumber *status = data[@"code"];
//        if ([[status stringValue] isEqualToString:@"200"]) {
//            if (self.refershAddressListBlock) {
//                self.refershAddressListBlock();
//            }
//            [self.navigationController popViewControllerAnimated:NO];
//        }else{
//            [self showHint:data[@"mes"]];
//        }
//    } failure:^(NSError *error) {
//        [self showHint:@"请求服务器失败"];
//    }];
    
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
