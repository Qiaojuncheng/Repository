//
//  QJCShoppingtabbar.m
//  singdemo
//
//  Created by MYMAc on 2018/8/1.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "QJCShoppingtabbar.h"
#import "HBK_ShoppingCartViewController.h"
#import "QJCShoppingList.h"
#import "ShippingAddressViewController.h"
@interface QJCShoppingtabbar ()
@property(strong, nonatomic) NSMutableArray * ViewsArray;
@end

@implementation QJCShoppingtabbar

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeViews];
    
    // Do any additional setup after loading the view.
}

-(void)makeViews{
    self.ViewsArray  =[[NSMutableArray alloc]init];
    NSArray * viewsData  = @[
                             @{@"title":@"首页",
                               @"image":@"icon_syshouye",
                               @"Selectimage":@"icon_syshouyea"},
                             @{@"title":@"购物车",
                               @"image":@"icon_syzuoyea",
                               @"Selectimage":@"icon_syzuoyea"},
                             @{@"title":@"地址",
                               @"image":@"icon_sychengzhang",
                               @"Selectimage":@"icon_chengzhanga"},
                             @{@"title":@"我的",
                               @"image":@"icon_sysiliao",
                               @"Selectimage":@"icon_sysiliaoa"},
                            
                             ];
    
    
    
    for (int i = 0 ; i< viewsData.count ;i++){
        NSDictionary * Dic = viewsData[i];
        QJCNavigationViewController *nav ;
        
        if (i == 0) {
            QJCShoppingList *vc  =  [[QJCShoppingList alloc]init];
            nav = [[QJCNavigationViewController alloc]initWithRootViewController:vc];
        }else if ( i ==1){
            HBK_ShoppingCartViewController  *    vc =   [[HBK_ShoppingCartViewController alloc]init];
            vc.isSubPage = YES;
          nav  = [[QJCNavigationViewController alloc] initWithRootViewController:vc];

            
        }else if(i == 2){
            ShippingAddressViewController * vc  =[[ShippingAddressViewController alloc]init];
            nav  = [[QJCNavigationViewController alloc] initWithRootViewController:vc];

            
        } else{
            
            HBK_ShoppingCartViewController  *    vc =   [[HBK_ShoppingCartViewController alloc]init];
            vc.isSubPage = YES;
            nav  = [[QJCNavigationViewController alloc] initWithRootViewController:vc];
        }
        nav.tabBarItem   =
        
        [[UITabBarItem alloc]initWithTitle:Dic[@"title"]
                                     image:[UIImage imageNamed:Dic[@"image"]]
                             selectedImage:[[UIImage imageNamed:Dic[@"Selectimage"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        
        [[UITabBar appearance] setTintColor:[UIColor redColor]]; // 设置TabBar上 字体颜色
        [self.ViewsArray addObject:nav];
    }
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor randomColor] }];
    
    
    [UINavigationBar appearance].barTintColor = [UIColor lightGrayColor];
    
    self.viewControllers = self.ViewsArray;
    
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
