//
//  QJCBaseViewController.m
//  singdemo
//
//  Created by MYMAc on 2018/7/21.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "QJCBaseViewController.h"
#import "QJCCodeView.h"
#import "TagsFrame.h"
#import "QJCItemsScrollerView.h"
#import "MianScrollViewController.h"
#import "MiddleItemView.h"

#import "QJCShoppingtabbar.h"
#import "tempViewController.h"

@interface QJCBaseViewController (){
    TagsFrame *_frame;
    NSArray *_tagsArray;
    
}

@end

@implementation QJCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationItem setTitle:self.showType];
    
//
//    _dataArray =@[@"下拉无数据显示",@"图片验证码",@"添加阴影和边框",@"轮播图",@"启动广告",@"标签导航栏",@"引导页",@""];
    if ([self.showType isEqualToString:@"图片验证码"]) {
            [self ImageCode];

    }else if([self.showType isEqualToString:@"添加阴影和边框"]){
        [self imageShaow];
    }else if([self.showType isEqualToString:@"picker联动"]){
        //   时间 自定义demo 省市区三级联动
        [self showMOfSPickManager];
    }else if([self.showType isEqualToString:@"轮播图"]){
        [self makeBanner];
    }else if([self.showType isEqualToString:@"多标签展示"]){
        [self makeLable];
    }else if ([self.showType isEqualToString:@"标签导航栏"]){
        [self makeLabelItem];
    }else if([self.showType isEqualToString:@"图片+文字Item"]){
        [self mkeImaegTextitem];
    }else if ([self.showType isEqualToString:@"商城模块(购物车、订单、地址)"]) {
    QJCShoppingtabbar * bar= [[QJCShoppingtabbar alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = bar;
        
        
    } else if([self.showType isEqualToString:@"启动广告"]){
        
        tempViewController  * pv =[[tempViewController
                                    alloc]init];
        [self.navigationController pushViewController:pv animated:YES];
    }
    
//    [self showHudInView:self.view hint:@"加载中..."];
    
    //   启动广告
     //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAd) name:@"ZLPushToAdvert" object:nil];
}

#pragma mark 图片验证码
-(void)ImageCode{
    QJCCodeView* CodeView = [[QJCCodeView alloc]initWithFrame:CGRectMake(0, 80, ScreenWidth, 100)];
    CodeView.backgroundColor = [UIColor whiteColor];
    CodeView.ReaultBlock = ^(NSString *token, NSString *code_name, NSString *code_value) {
        NSLog(@"token =%@\n code_name = %@ \n code_value = %@",token,code_name,code_value);
    };
    [self.view addSubview:CodeView];
}

#pragma mark  添加阴影和边框  外加旋转 动画

-(void)imageShaow{
    UIImageView * imagView =[[UIImageView alloc]initWithFrame:CGRectMake(0,0 ,300, 300)];
    UIView *iageBack = [[UIView alloc]initWithFrame:imagView.frame];
    imagView.image =[UIImage imageWithContentsOfFile:@"/Users/mymac/Desktop/NewRepository/Repository/singdemo/scr/lige.png"];
    [iageBack createCornerRadiusShadowWithCornerRadius:iageBack.height/2 shadowColor:[UIColor redColor] offset:CGSizeMake(0,0) opacity:1 radius:30];
    
    [imagView setCornerRadius:imagView.width/2];
    iageBack.center = self.view.center;
    [iageBack addSubview:imagView];
    [self.view addSubview:iageBack];
    
    //        动画旋转
    //        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //        动画缩放
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果  z 按照Z轴进行旋转
    //    animation.fromValue = [NSValue valueWithCGSize:CGSizeMake(20, 20)];
    //        animation.toValue =[NSValue valueWithCGSize:CGSizeMake(300, 300)];
    animation.fromValue = [NSNumber numberWithFloat:.5f];
    animation.toValue = [NSNumber numberWithFloat: 1.5];
    animation.duration = 5;
    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    [iageBack.layer addAnimation:animation forKey:nil];
    

}

#pragma mark   日期地址 自定义模式选择

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
#pragma mark  轮播图

-(void)makeBanner{
    
    YSLoopBanner *loop = [[YSLoopBanner alloc] initWithFrame:CGRectMake(0, NavStatusBarHeight, ScreenWidth, 200) scrollDuration:3.f];
    [self.view addSubview:loop];
    loop.imageURLStrings = @[@"http://pic.616pic.com/bg_w1180/00/06/42/KJjUgWzPYM.jpg", @"http://pic.616pic.com/bg_w1180/00/24/67/UTGD84Psk6.jpg", @"http://pic.616pic.com/bg_w1180/00/03/29/Wcsb9keWmv.jpg"];
    loop.clickAction = ^(NSInteger index) {
        NSLog(@"curIndex: %ld", index);
    };

    
    
    MiddleItemView * middle =[[MiddleItemView alloc]initWithFrame:CGRectMake(0, loop.bottom, ScreenWidth, 140)];
    middle.titleColor = [UIColor randomColor];
    middle.selectItem = ^(NSInteger index) {
        NSLog(@"选中了第 %ld个",(long)index);
    };
    [self.view addSubview:middle];
}
#pragma mark  标签显示 暂时没有选中状态

-(void)makeLable{
    
//   多行显示
    [self createSubView];
//单行显示
    [self makeshowScroll];
    
    
}
- (void)createSubView
{
    
    UILabel  * titleLB =[[UILabel alloc]initWithFrame:CGRectMake(20, 84, ScreenWidth - 40, 30)];
    titleLB.text = @"多行显示";
    [self.view addSubview:titleLB];
    
    UILabel  * titleLBone =[[UILabel alloc]initWithFrame:CGRectMake(20, 390, ScreenWidth - 40, 30)];
    titleLBone.text = @"单行显示";
    [self.view addSubview:titleLBone];
//     多行显示
     _tagsArray = @[@"全部",@"哈哈哈哈哈哈",@"的点点滴滴多多",@"他啦啦啦啦啦啦",@"发哈几个",@"鞥UNv",@"麓山国际后悔过",@"lllllldaffff",@"lalalalall",@"啦啦啦啦啦啦",@"喵喵吗喵毛",@"囖囖囖囖大家开发及囖囖咯",@"安安",@"对对对",@"错",@"初音MIKU",@"ANIMENZ哈哈哈哈哈哈哈",@"PENBEAT",@"OP",@"ILEM",@"原创",@"作业用BGM",@"打到车才",@"大卫反反复复",@"BGM"];
    QJCItemsScrollerView *backView = [[QJCItemsScrollerView alloc] initWithFrame:CGRectMake(0, 130, self.view.frame.size.width, 250)];
    backView.Tagframe.oneLine = NO;
    backView.tagsArray = _tagsArray;
    [self.view addSubview:backView];
}
-(void)makeshowScroll{
    
    
    NSArray *  titleArray = @[@"全部",@"哈哈哈哈哈哈",@"的点点滴滴多多",@"他啦啦啦啦啦啦",@"发哈几个",@"鞥UNv",@"麓山国际后过",@"lllllldaffff",@"lalalalall",@"啦啦啦啦啦啦",@"喵喵吗喵毛",@"囖囖囖囖大家开发及囖囖咯",@"安安",@"对对对"];
 
    QJCItemsScrollerView *backView = [[QJCItemsScrollerView alloc] initWithFrame:CGRectMake(0, 450, ScreenWidth, 40)];
    backView.Tagframe.oneLine = YES;
    backView.tagsArray = titleArray;
    [self.view addSubview:backView];
    
 
   
    
    
}
#pragma  mark 标签导航栏
-(void)makeLabelItem{
    MianScrollViewController * main =[[MianScrollViewController alloc]init];
    [self.navigationController pushViewController:main animated:NO];    
}
#pragma  mark  图片文字item
-(void)mkeImaegTextitem{
    
    MiddleItemView * middle =[[MiddleItemView alloc]initWithFrame:CGRectMake(0, 100, ScreenWidth, 140)];
    middle.titleColor = [UIColor randomColor];
    middle.selectItem = ^(NSInteger index) {
        NSLog(@"选中了第 %ld个",(long)index);
    };
    [self.view addSubview:middle];
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

