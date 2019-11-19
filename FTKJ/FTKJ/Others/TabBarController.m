//
//  TabBarController.m
//  AntApp
//
//  Created by 4 on 17/2/22.
//  Copyright © 2017年 4. All rights reserved.
//
#import "TabBarController.h"
#import "HomeViewController.h"
#import "GoodsViewController.h"

#import "CarBYViewController.h"

#import "MyOrderViewController.h"
#import "MyViewController.h"
//
#import "MCTabBar.h"
//
#import "ZFNavigationController.h"

@interface TabBarController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) MCTabBar *mcTabbar;
@property (nonatomic, assign) NSUInteger selectItem;//选中的item


@end



@implementation TabBarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabBar];
}
- (void)setUpTabBar {
    
    
    _mcTabbar = [[MCTabBar alloc] init];
    [_mcTabbar.centerBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    //选中时的颜色
    _mcTabbar.tintColor = newColor(202, 26, 49, 1);
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    _mcTabbar.translucent = NO;
    //利用KVC 将自己的tabbar赋给系统tabBar
    [self setValue:_mcTabbar forKeyPath:@"tabBar"];
    
    self.selectItem = 0; //默认选中第一个
    self.delegate = self;
    [self addChildViewControllers];
    
}
- (UIImage *)imageWithColor:(UIColor *)color image:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextClipToMask(context, rect, image.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



//添加子控制器
- (void)addChildViewControllers{
    //图片大小建议32*32
    [self addChildrenViewController:[[HomeViewController alloc] init] andTitle:@"首页" andImageName:@"首页0" andSelectImage:@"首页1"];
    [self addChildrenViewController:[[GoodsViewController alloc] init] andTitle:@"商品" andImageName:@"记忆0" andSelectImage:@"记忆1"];
    //中间这个不设置东西，只占位
    [self addChildrenViewController:[[CarBYViewController alloc] init] andTitle:@"汽车保养" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[MyOrderViewController alloc] init] andTitle:@"订单" andImageName:@"消息0" andSelectImage:@"消息1"];
    [self addChildrenViewController:[[MyViewController alloc] init] andTitle:@"我的" andImageName:@"我的0" andSelectImage:@"我的1"];
}

- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectImage:(NSString *)selectedImage{
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage =  [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.title = title;
    
   
    ZFNavigationController*baseNav = [[ZFNavigationController alloc] initWithRootViewController:childVC];
    
    baseNav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);
    baseNav.tabBarItem.imageInsets = UIEdgeInsetsMake(-1, 0, 1, 0);
    
    [self addChildViewController:baseNav];
}

- (void)buttonAction:(UIButton *)button{
    
//    if ([Toos isBlank:[UserModel shared].uid]) {
//
//        LoginViewController *login = [[LoginViewController alloc]init];
//        ZFNavigationController *ZF = [[ZFNavigationController alloc]initWithRootViewController:login];
//        [self presentViewController:ZF animated:YES completion:nil];
//
//
//
//    }else {
//        SHReleaseViewController *vc=[[SHReleaseViewController  alloc]init];
//        ZFNavigationController *ZF = [[ZFNavigationController alloc]initWithRootViewController:vc];
//        [self presentViewController:ZF animated:YES completion:nil];
//    }
//
    

    
//    self.selectedIndex = 2;//关联中间按钮
    
    
//    if ([Toos isBlank:[UserModel shared].uid]) {

//        LoginViewController *login = [[LoginViewController alloc]init];
//        ZFNavigationController *ZF = [[ZFNavigationController alloc]initWithRootViewController:login];
//        [self presentViewController:ZF animated:YES completion:nil];




//    }else {
    
//        FaQiTieZiViewController *message = [[FaQiTieZiViewController alloc]init];
//
//        ZFNavigationController *ZFNavi = [[ZFNavigationController alloc]initWithRootViewController:message];
//
//
//        [self presentViewController:ZFNavi animated:YES completion:nil];
//


//    if (self.AddQuanZi == nil) {
//
//
//
//
//
//
//        self.AddQuanZi = [[AddQuanZiView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//        self.AddQuanZi.hidden = NO;
//        [[UIApplication sharedApplication].keyWindow addSubview:self.AddQuanZi];
//
//    }else {
//        self.AddQuanZi.hidden = NO;
//    }
//
//    if (self.selectItem != 2){
//        [self rotationAnimation];
//    }
//
//    __weak typeof(self)weakSelf = self;
//    self.AddQuanZi.ClickBlock = ^(NSString * _Nonnull type) {
//
//
//        if ([type intValue] == 0) {
//            FaQiQuanZiController *message = [[FaQiQuanZiController alloc]init];
//
//            ZFNavigationController *ZFNavi = [[ZFNavigationController alloc]initWithRootViewController:message];
//
//
//            [weakSelf presentViewController:ZFNavi animated:YES completion:nil];
//        }else {
//            FaQiTieZiViewController *message = [[FaQiTieZiViewController alloc]init];
//
//            ZFNavigationController *ZFNavi = [[ZFNavigationController alloc]initWithRootViewController:message];
//
//
//            [weakSelf presentViewController:ZFNavi animated:YES completion:nil];
//
//        }
//
//
//
//    };
    
//    }
//
//    self.selectItem = 2;
}

//tabbar选择时的代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    if (tabBarController.selectedIndex == 2){//选中中间的按钮
//        if (self.selectItem != 2){
//            [self rotationAnimation];
//        }
//    }else {
//        [_mcTabbar.centerBtn.layer removeAllAnimations];
//    }
//    self.selectItem = tabBarController.selectedIndex;
}
//旋转动画
- (void)rotationAnimation{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 3.0;
    rotationAnimation.repeatCount = HUGE;
    [_mcTabbar.centerBtn.layer addAnimation:rotationAnimation forKey:@"key"];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    
//    if ([viewController isKindOfClass:[UINavigationController class]]){//选中中间的按钮
//        if ([viewController.tabBarItem.title isEqualToString:@"我的"]||[viewController.tabBarItem.title isEqualToString:@"记忆"]||[viewController.tabBarItem.title isEqualToString:@"消息"]||[viewController.tabBarItem.title isEqualToString:@""]) {
//            if ([Toos isBlank:[UserModel shared].uid]) {
//                tishiView *zview = [[tishiView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//                //    [zview setValue:self.zyArr forKey:@"zyArr"];
//                
//                [[UIApplication sharedApplication].keyWindow addSubview:zview];
//
////                LoginViewController *login = [[LoginViewController alloc]init];
////                ZFNavigationController *ZF = [[ZFNavigationController alloc]initWithRootViewController:login];
////                [self presentViewController:ZF animated:YES completion:nil];
//                
//                
//                return NO;
//                
//                
//            }
//        }
//
//    }
//    if ([viewController isKindOfClass:[UINavigationController class]]) {
//        if ([viewController.tabBarItem.title isEqualToString:@""]) {
//            return NO;
//        }
//    }
    
    return YES;
    
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
