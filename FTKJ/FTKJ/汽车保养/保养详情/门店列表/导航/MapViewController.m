//
//  MapViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/28.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MapViewController.h"
#import "MapView.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"地图导航";
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}
-(void)setUpWithBigView {
    
    MapView *Map = [[MapView alloc]initWithFrame:CGRectMake(kWidthChange(33), (kScreenHeight - downH - kTopHeight) / 2 - kWidthChange(75), kScreenWidth - kWidthChange(66), kWidthChange(55))];
    [self.view addSubview:Map];
    
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
