//
//  AppDelegate.m
//  singdemo
//
//  Created by MYMAc on 2018/7/13.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
   
    
    [self firstCome];
   
    
    
    [IQKeyboardManager sharedManager].shouldToolbarUsesTextFieldTintColor = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    return YES;
}
-(void)firstCome{
    BOOL  isFirst =  YES;
    isFirst =( BOOL )[[NSUserDefaults standardUserDefaults]  boolForKey:@"MMIsFirst"];
//    NSLog(@" ++  %d",isFirst);
    if (!isFirst) {
        GuideViewController * gvc =[[GuideViewController alloc]init];
        self.window.rootViewController  = gvc;
    }else{
 
        
        
        // 判断登陆没登录
//        if ([UserId length] > 0) {
//        QJCTabBarController *Tab =[[QJCTabBarController alloc]init];
//        self.window.rootViewController = Tab;

//        }else{
//            QJLoginViewController *view = [QJLoginViewController new];
//            UINavigationController * na= [[UINavigationController alloc]initWithRootViewController:view];
//            self.window.rootViewController = na;
//        }
        
        [self.window makeKeyAndVisible];
        ViewController  *view = [ViewController new];
                    UINavigationController * na= [[UINavigationController alloc]initWithRootViewController:view];
        view.title = @"态度很重要！";
                    self.window.rootViewController = na;

        [self setupAdvert];

    }
}


/**
 *  设置启动页广告
 */
- (void)setupAdvert {
    
    // 1.判断沙盒中是否存在广告图片，如果存在返回显示，不存在返回nil
    ZLAdManage * ZLAdmanage  = [[ZLAdManage alloc]init];
    [ZLAdmanage ShowAdView];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
