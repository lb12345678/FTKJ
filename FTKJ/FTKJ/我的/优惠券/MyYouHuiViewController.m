//
//  MyYouHuiViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyYouHuiViewController.h"
#import "PGGLinScrillButtonView.h"
#import "MyYouHuiViewCell.h"

@interface MyYouHuiViewController ()<PGGListScrollButtonDegelate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)PGGLinScrillButtonView *pview;



@end

@implementation MyYouHuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的优惠券";
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}


-(void)setUpWithBigView {
    self.pview = [[PGGLinScrillButtonView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(50))];
    self.pview.arrbttitle = [@[@"未使用",@"已使用",@"已过期"]mutableCopy];
    self.pview.degelate = self;
    [self.view addSubview:self.pview];
    self.pview.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pview.frame), kScreenWidth, kScreenHeight - downH - CGRectGetMaxY(self.pview.frame))];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[MyYouHuiViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = newColor(236, 237, 239, 1);
    
    
    
}
-(void)selectTag:(int)tag {
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyYouHuiViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidthChange(94);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kWidthChange(10);
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(10))];
    headerView.backgroundColor = newColor(236, 237, 239, 1);
    return headerView;
    
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
