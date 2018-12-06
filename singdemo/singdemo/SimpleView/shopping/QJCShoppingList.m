//
//  QJCShoppingCar.m
//  singdemo
//
//  Created by MYMAc on 2018/8/1.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "QJCShoppingList.h"
#import "GoodsDetaileVC.h"
#import "ShippingAddressViewController.h"
@interface QJCShoppingList ()

@end

@implementation QJCShoppingList

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * showbtu =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    showbtu.center = self.view.center;
    [showbtu setTitleColor:RandomColor forState:UIControlStateNormal];
    [showbtu setTitle:@"商品详情" forState:UIControlStateNormal];
    [showbtu addTarget:self action:@selector(goods) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showbtu];
 
    
    UIButton * showbtus =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    showbtus.center = self.view.center;
    showbtus.top = showbtu.bottom;
    
    [showbtus setTitleColor:RandomColor forState:UIControlStateNormal];
    [showbtus setTitle:@"地址" forState:UIControlStateNormal];
    [showbtus addTarget:self action:@selector(Addressls) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showbtus];
    // Do any additional setup after loading the view.
}
-(void)goods{
    GoodsDetaileVC * detail  =[[GoodsDetaileVC alloc]init];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}
-(void)Addressls{
    
    ShippingAddressViewController * vc  =[[ShippingAddressViewController alloc]init];
     vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
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
