//
//  ZFNavigationController.m
//  QuZhiFu
//
//  Created by ios on 2017/10/23.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "ZFNavigationController.h"


@interface ZFNavigationController ()

@end

@implementation ZFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
//    [[UINavigationBar appearance] setTitleTextAttributes:
//     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
//       NSForegroundColorAttributeName:White_Default}];
   
    self.navigationController.navigationBar.alpha = 1;
//    //self.navigationBar.tintColor = [UIColor whiteColor];
//  
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"背景"] forBarMetrics:(UIBarMetricsDefault)];
//    [UIApplication sharedApplication].statusBarStyle = UIBarStyleBlackOpaque;
 
    
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
        NSString *title = @"";
        
        // 判断当前navigationController的级数
        if (self.childViewControllers.count == 1) {
            title = self.viewControllers.firstObject.title != nil ? self.viewControllers.firstObject.title : @"";
        }
        // 设置返回按钮
        if ([viewController isKindOfClass:[BaseViewController
                                           class]]) {
            BaseViewController *vc = (BaseViewController *)viewController;
            UIBarButtonItem *leftBarButtonItem = [UIBarButtonItem lk_barButtonWithTitle:@"" target:self action:@selector(popToParent) isBack:YES];
//            UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//            space.width = 0;
//            vc.navigationItem.leftBarButtonItems = @[space, leftBarButtonItem];
            
            
          
            vc.navigationItem.leftBarButtonItem =  leftBarButtonItem;
        }
    }
    [super pushViewController:viewController animated:animated];
}

- (void)popToParent {
    [self popViewControllerAnimated:YES];
    
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
