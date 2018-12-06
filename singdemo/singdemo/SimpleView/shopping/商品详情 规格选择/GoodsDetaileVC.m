//
//  GoodsDetaileVC.m
//  singdemo
//
//  Created by MYMAc on 2018/8/2.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "GoodsDetaileVC.h"
#import "goodsdetailBottomView.h"
#import "StandardsView.h"

@interface GoodsDetaileVC ()<StandardsViewDelegate>{
    StandardsView *mystandardsView;//选择 规格的 view；

}

@end

@implementation GoodsDetaileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self  addbottomView];
    [self  makeguige];
    // Do any additional setup after loading the view.
}
-(void)makeguige{
    
    mystandardsView = [self buildStandardView:[UIImage imageNamed:@"gril"]  andIndex:1];
    mystandardsView.delegate=  self;
    __weak typeof(self)  WeakSelf = self;
    mystandardsView.ShowBlock = ^(NSString *ShowMessage) {
        [WeakSelf showHint:ShowMessage];
    };
    //    mystandardsView.GoodDetailView = self.view;//设置该属性 对应的view 会缩小
    mystandardsView.iscollect  =  @"1";
    
    [mystandardsView show];
}


// 数据
-(StandardsView *)buildStandardView:(UIImage *)img andIndex:(NSInteger)index
{
    
    
    
    StandardsView *standview = [[StandardsView alloc] init];
    standview.tag = index;
    standview.delegate = self;
    
    standview.mainImgView.image = img;
    standview.mainImgView.backgroundColor = [UIColor whiteColor];
    standview.priceLab.text =[NSString stringWithFormat:@"￥300"];
    standview.price =[NSString stringWithFormat:@"100"];
    //    standview.tipLab.text = @"请选择规格";
    standview.goodNum.text = [NSString stringWithFormat:@"商品编号:13232342"];
    standview.goodAttriNumber =1234;
    standview.customBtns = @[@"确定"];
    
  
    
    NSMutableArray * standardArr =[[NSMutableArray alloc]init];

    for (int i = 0 ;i< 5; i++) {

        NSMutableArray * tempClassInfoArr =[[NSMutableArray alloc]init];
        for(int j = 0 ; j< 3; j++) {
            standardClassInfo *tempClassInfo1 = [standardClassInfo StandardClassInfoWith:[NSString stringWithFormat:@"%d234",j] andStandClassName:[NSString stringWithFormat:@"第%d个属性",j]];
            [tempClassInfoArr addObject:tempClassInfo1];
        }
        StandardModel *tempModel = [StandardModel StandardModelWith:tempClassInfoArr andStandName:[NSString stringWithFormat:@"第%d个名字",i]];
        [standardArr addObject:tempModel];
    }
    standview.standardArr = standardArr ;
    return standview;
}



#pragma mark - standardView  delegate 选完规格 点击确认
//点击自定义按键
-(void)StandardsView:(StandardsView *)standardView CustomBtnClickAction:(UIButton *)sender
{
    [standardView dismiss];
    
    NSLog(@"点击自定义按键");
 
}

//点击规格代理
-(void)Standards:(StandardsView *)standardView SelectBtnClick:(UIButton *)sender andSelectID:(NSString *)selectID andStandName:(NSString *)standName andIndex:(NSInteger)index
{
    // 判断是不是有库存 ；成功记下状态   加入购物车之前进行判断
//    [self  judgeisExistWithStandId:selectID WithStandName:standName];
    NSLog(@"selectID = %@ standName = %@ index = %ld",selectID,standName,(long)index);
    
}
//设置自定义btn的属性
-(void)StandardsView:(StandardsView *)standardView SetBtn:(UIButton *)btn
{
    NSLog(@"点击自定义btn");

    if (btn.tag == 0) {
        //        btn.backgroundColor = [UIColor yellowColor];
    }
    else if (btn.tag == 1)
    {
        //        btn.backgroundColor = [UIColor orangeColor];
    }
}

//数量加减操作

-(void)StandardsView:(StandardsView *)standardView GoodsNumber:(NSInteger)goodsNumber AndTotalPrice:(NSString *)totlePrice{
    NSLog(@"++ ___");

   
}



-(void)addbottomView{
    goodsdetailBottomView * bottomView =[[goodsdetailBottomView alloc]initWithFrame:CGRectMake(0, ScreenHeight - TabBarHeight ,ScreenWidth, TabBarHeight)];
//    bottomView.backgroundColor = RandomColor;
    
     [self.view addSubview:bottomView];
    
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
