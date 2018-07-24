//
//  QJCBaseViewController.m
//  singdemo
//
//  Created by MYMAc on 2018/7/21.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "QJCBaseViewController.h"

@interface QJCBaseViewController ()

@end

@implementation QJCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationItem setTitle:@"导航标题"];

    [self showHudInView:self.view hint:@"加载中..."];
    
//   时间 自定义demo 省市区三级联动
//    [self showMOfSPickManager];

    //Banner 轮播图
    //    [self makeBanner];
    
    //   启动广告
     //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAd) name:@"ZLPushToAdvert" object:nil];
}
-(void)showMOfSPickManager{
//    先添加几个Btn
    
    NSArray * titleArray = @[@"请选择日期",@"请选择",@"请选择地址"];
    for (int  i  = 0 ; i< titleArray.count; i ++) {
        
        UIButton * titltBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        titltBtn.frame = CGRectMake(0, 200 + i*60, ScreenWidth, 40);
        [titltBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [titltBtn addTarget:self action:@selector(PickViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [titltBtn setTitleColor:DEEPTintColor forState:UIControlStateNormal];
        titltBtn.tag = i+1;
        [self.view addSubview:titltBtn];
    }
    
    
    
}
-(void)PickViewSelect:(UIButton *)sender{
    UIButton * lb =sender;
    if (lb.tag == 1) {
        [MOFSPickerManager shareManger].datePicker.toolBar.cancelBarTintColor = [UIColor redColor];
        [MOFSPickerManager shareManger].datePicker.toolBar.titleBarTitle = @"选择日期";
        [MOFSPickerManager shareManger].datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        [[MOFSPickerManager shareManger] showDatePickerWithTitle:@"Chose your date of birth" cancelTitle:@"Cancel" commitTitle:@"Confirm" firstDate:nil minDate:nil maxDate:nil datePickerMode:UIDatePickerModeTime tag:1 commitBlock:^(NSDate *date) {
            
        } cancelBlock:^{
            
        }];
        //        [[MOFSPickerManager shareManger] showDatePickerWithTag:1 commitBlock:^(NSDate *date) {
        //            lb.text = [df stringFromDate:date];
        //        } cancelBlock:^{
        //
        //        }];
    } else if (lb.tag == 2) {
        //        NSString *str_a = @"疾风剑豪";
        //        str_a.mofs_key = @"自定义id";
        //        [[MOFSPickerManager shareManger] showPickerViewWithDataArray:@[str_a,@"刀锋意志",@"诡术妖姬",@"狂战士"] tag:1 title:@"选择英雄" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString *string) {
        //            lb.text = string;
        //            NSLog(@"%@-%@",string, string.mofs_key);
        //        } cancelBlock:^{
        //
        //        }];
        
        Model *a = [Model new];
        a.age = 17;
        a.name = @"疾风剑豪";
        a.userId = 0001;
        
        Model *b = [Model new];
        b.age = 18;
        b.name = @"刀锋意志";
        b.userId = 0002;
        
        Model *c = [Model new];
        c.age = 22;
        c.name = @"诡术妖姬";
        c.userId = 0003;
        
        [[MOFSPickerManager shareManger] showPickerViewWithCustomDataArray:@[a, b, c] keyMapper:@"name" tag:1 title:@"选择英雄" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(id model) {
            Model *m = (Model *)model;
            NSLog(@"%@-%zd", m.name, m.userId);
        } cancelBlock:^{
            
        }];
        
    } else if (lb.tag == 3) {
        //[MOFSPickerManager shareManger].addressPicker.numberOfSection = 2;
        //        [[MOFSPickerManager shareManger] showMOFSAddressPickerWithDefaultAddress:@"广西壮族自治区-玉林市-容县" title:@"选择地址" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString *address, NSString *zipcode) {
        //            lb.text = address;
        //        } cancelBlock:^{
        //
        //        }];
        
        [[MOFSPickerManager shareManger] showMOFSAddressPickerWithDefaultZipcode:@"450000-450900-450921" title:@"选择地址" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString * _Nullable address, NSString * _Nullable zipcode) {
            NSLog(@"%@", zipcode);
        } cancelBlock:^{
            
        }];
        
    }
    
    
}

-(void)makeBanner{
    
    YSLoopBanner *loop = [[YSLoopBanner alloc] initWithFrame:CGRectMake(0, NavBarHeight, ScreenWidth, 200) scrollDuration:3.f];
    [self.view addSubview:loop];
    loop.imageURLStrings = @[@"111", @"222", @"333"];
    loop.clickAction = ^(NSInteger index) {
        NSLog(@"curIndex: %ld", index);
    };

}

// 进入广告链接页
- (void)pushToAd {
    
    ZLAdvertViewController *adVc = [[ZLAdvertViewController alloc] init];
    self.hidesBottomBarWhenPushed  = YES;
    [self.navigationController pushViewController:adVc animated:YES];
    
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
@implementation Model


@end

