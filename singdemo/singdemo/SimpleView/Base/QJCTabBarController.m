//
//  QJCTabBarController.m
//  singdemo
//
//  Created by MYMAc on 2018/7/21.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "QJCTabBarController.h"

@interface QJCTabBarController ()
@property( strong , nonatomic) NSMutableArray * ViewsArray;
@end

@implementation QJCTabBarController

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
                         @{@"title":@"资讯",
                           @"image":@"icon_syzuoyea",
                           @"Selectimage":@"icon_syzuoyea"},
                         @{@"title":@"成长",
                           @"image":@"icon_sychengzhang",
                           @"Selectimage":@"icon_chengzhanga"},
                         @{@"title":@"聊天",
                           @"image":@"icon_sysiliao",
                           @"Selectimage":@"icon_sysiliaoa"},
                         @{@"title":@"我的",
                           @"image":@"icon_sywode",
                           @"Selectimage":@"icon_sywodea"},
   ];
    

   
    for (NSDictionary * Dic in viewsData) {
     
        QJCBaseViewController * vc = [[QJCBaseViewController alloc]init];
        QJCNavigationViewController *nav = [[QJCNavigationViewController alloc] initWithRootViewController:vc];
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
