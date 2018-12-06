//
//  OrderDetailViewController.m
//  GuKe
//
//  Created by MYMAc on 2018/8/8.
//  Copyright © 2018年 shangyukeji. All rights reserved.
//

#import "OrderDetailViewController.h"
#import <WebKit/WebKit.h>
//#import <AlipaySDK/AlipaySDK.h>

#import "WebViewJavascriptBridge.h"


@interface OrderDetailViewController ()<WKUIDelegate,WKNavigationDelegate>{
    
    WebViewJavascriptBridge *  _bridge;
    
}
@property (strong,nonatomic) WKWebView *webviews;
@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = [[WKUserContentController alloc] init];
    [configuration.userContentController addScriptMessageHandler:self name:@"pay"];
    [configuration.userContentController addScriptMessageHandler:self name:@"alipay"];
    
     self.webviews = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64) configuration:configuration];
    self.webviews.UIDelegate = self;
    self.webviews.navigationDelegate = self;
    [self.view addSubview:self.webviews];
    
    NSURL *url = [NSURL URLWithString:self.urlStr];

//    NSURL *url = [NSURL URLWithString:@"http://115.28.220.220:8080/bone/app/pay/pay.json?orderNumber=20180809123456792"];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webviews loadRequest:request];
    // Do any additional setup after loading the view.
//     支付成功通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WEPAYSUCCESS:) name:@"WXPAYSUCCESS" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AIRPAYSUCCESS:) name:@"AIRSUCCESS" object:nil];

  
   
    //初始化  WebViewJavascriptBridge
    if (_bridge) { return; }
    [WebViewJavascriptBridge enableLogging];
    _bridge = [WebViewJavascriptBridge bridgeForWebView:self.webviews];
    [_bridge setWebViewDelegate:self];
    
    //请求加载html，注意：这里h5加载完，会自动执行一个调用oc的方法
//    [self loadExamplePage:self.webviews];
    
    //申明js调用oc方法的处理事件，这里写了后，h5那边只要请求了，oc内部就会响应
    [self JS2OC];
    
    //模拟操作：2秒后，oc会调用js的方法
    //注意：这里厉害的是，我们不需要等待html加载完成，就能处理oc的请求事件；此外，webview的request 也可以在这个请求后面执行（可以把上面的[self loadExamplePage:webView]放到[self OC2JS]后面执行，结果是一样的）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self OC2JS];
    });
    
}

-(void)JS2OC{
    /*
     含义：JS调用OC
     @param registerHandler 要注册的事件名称(比如这里我们为loginAction)
     @param handel 回调block函数 当后台触发这个事件的时候会执行block里面的代码
     */
    [_bridge registerHandler:@"messageHandlers" handler:^(id data, WVJBResponseCallback responseCallback) {
        // data js页面传过来的参数  假设这里是用户名和姓名，字典格式
        NSLog(@"JS调用OC，并传值过来");
        
        // 利用data参数处理自己的逻辑
        NSDictionary *dict = (NSDictionary *)data;
        NSString *str = [NSString stringWithFormat:@"用户名：%@  姓名：%@",dict[@"userId"],dict[@"name"]];
        [self renderButtons:str];
        
        // responseCallback 给js的回复
        responseCallback(@"报告，oc已收到js的请求");
    }];
    
}
-(void)renderButtons:(NSString *)str{
    
    NSLog(@"str = %@",str);
}

-(void)OC2JS{
    /*
     含义：OC调用JS
     @param callHandler 商定的事件名称,用来调用网页里面相应的事件实现
     @param data id类型,相当于我们函数中的参数,向网页传递函数执行需要的参数
     注意，这里callHandler分3种，根据需不需要传参数和需不需要后台返回执行结果来决定用哪个
     */
    
    //[_bridge callHandler:@"registerAction" data:@"我是oc请求js的参数"];
    [_bridge callHandler:@"alipayForPhone" data:@"IOS" responseCallback:^(id responseData) {
        NSLog(@"oc请求js后接受的回调结果：%@",responseData);
    }];
    
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    if ([message.name isEqualToString:@"pay"]) {
        //     微信
        [self weixinZhifu:message.body];
    }else if([message.name isEqualToString:@"alipay"]){
        //     支付宝
        [self AliPay:message.body];
        
    }
}
// APP调用h5
-(void)hellacton{

    [self.webviews evaluateJavaScript:@"hello('hellosd')" completionHandler:^(id _Nullable item, NSError * _Nullable error) {
        NSLog(@"alert");
    }];


}

  // 支付宝支付
-(void)AliPay:(NSString *)signedString{
//    if (signedString != nil) {
//         //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
//        NSString *appScheme = @"BoneProject";
//
//          // NOTE: 调用支付结果开始支付
//        [[AlipaySDK defaultService] payOrder:signedString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
//            NSLog(@"reslut = %@",resultDic);
//
//            if ([[NSString stringWithFormat:@"%@",[resultDic objectForKey:@"resultStatus"]] caseInsensitiveCompare:@"9000"] == NSOrderedSame) {
////支付成
//            }
//        }];
//    }
}

-(void)weixinZhifu:(NSDictionary *)dict{
//    if(dict != nil){
//        NSMutableString *retcode = [dict objectForKey:@"appid"];
//        if (retcode.length > 0){
//            NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
//            //调起微信支付
//            PayReq* req = [[PayReq alloc] init];
//            req.partnerId = [dict objectForKey:@"mch_id="];// 商家ID
//            req.prepayId            = [dict objectForKey:@"out_trade_no"];// 订单号
//            req.nonceStr = [dict objectForKey:@"nonce_str"]; /** 随机串，防重发 */
//            req.timeStamp = stamp.intValue;/** 时间戳，防重发 */
//            req.package             = [dict objectForKey:@"package"];/** 商家根据财付通文档填写的数据和签名 */
//            req.sign                = [dict objectForKey:@"sign"];/** 商家根据微信开放平台文档对数据做的签名 */
//            [WXApi sendReq:req];
//            //日志输出
//            NSLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",[dict objectForKey:@"appid"],req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign );
//        }else{
//            //                NSLog([dict objectForKey:@"retmsg"])";
//        }
//    }else{
//        NSLog(@"服务器返回错误，未获取到json对象");
//    }
}

//支付宝 成功
-(void)AIRPAYSUCCESS:(NSNotification *)center{
    
//    NSDictionary   * resultDic = (NSDictionary*)center.object;
//
//
//    if ([[NSString stringWithFormat:@"%@",[resultDic objectForKey:@"resultStatus"]] caseInsensitiveCompare:@"9000"] == NSOrderedSame) {
//        if(self.reloadBlock){
//            self.reloadBlock();
//            [self.navigationController popViewControllerAnimated:YES];
//        }
//        //         成功
//    }else{
//        [self showHint:@"支付失败"];
//    }
    
}
//微信 成功
-(void)WEPAYSUCCESS:(NSNotification *)center{
//    BaseResp  * baseResp = (BaseResp*)center.object;
//    if (baseResp.errCode ==0) {
//        if(self.reloadBlock){
//            self.reloadBlock();
//        }
//        [self.navigationController popViewControllerAnimated:YES];
//
//        //        [self Paysuccess];
//    }else if (baseResp.errCode ==-1){
//                [self showHint:@"支付失败"];
//    }else{
//        //        [self showHint:@"您已取消支付"];
//    }
//
    
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
