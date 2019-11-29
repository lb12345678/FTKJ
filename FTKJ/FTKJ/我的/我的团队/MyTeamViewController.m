//
//  MyTeamViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/27.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyTeamViewController.h"
#import "MyTeamViewCell.h"
#import "MyMoneyViewController.h"
@interface MyTeamViewController ()

@end

@implementation MyTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的团队";
    [self setUpWithBigView];
    [self setUpWithNavigation];
    // Do any additional setup after loading the view.
}
-(void)setUpWithNavigation {
    
    
    
    
    UIButton *rightBT = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBT.frame = CGRectMake(0, 0, [Toos textRect:@"我的明细" textFont:[UIFont systemFontOfSize:kWidthChange(16)]], kWidthChange(18));
    [rightBT setTitle:@"我的明细" forState:UIControlStateNormal];
    [rightBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBT];
    rightBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    
    [rightBT addTarget:self action:@selector(clickQingKong:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

-(void)clickQingKong:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    MyMoneyViewController *MyMoney = [[MyMoneyViewController alloc]init];
    MyMoney.fromStr = @"1";
    [self.navigationController pushViewController:MyMoney animated:YES];
    
}


-(void)setUpWithBigView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[MyTeamViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTeamViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidthChange(85);
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
