//
//  MDLBViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MDLBViewController.h"
#import "MDLBViewCell.h"
#import "MapViewController.h"
@interface MDLBViewController ()

@end

@implementation MDLBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"门店列表";
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}


-(void)setUpWithBigView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTopHeight)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MDLBViewCell class] forCellReuseIdentifier:@"cell"];
  
    [self.view addSubview:self.tableView];
    
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MDLBViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  return   kWidthChange(126);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return kWidthChange(45);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(45))];
    headerView.backgroundColor = newColor(241, 242, 244, 1);
    
     UILabel *oneLabel = [Toos setUpWithUserLabel:@"共19家门店" CGRect:CGRectMake( kWidthChange(20),0 , kScreenWidth , kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(89, 90, 91, 1) textSize:kWidthChange(15)];
    
    [headerView addSubview:oneLabel];
    
    UIButton *daohangBT = [UIButton buttonWithType:UIButtonTypeCustom];
    daohangBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(45), 0, kWidthChange(45), kWidthChange(45));
    
    
        [daohangBT setImage:[UIImage imageNamed:@"box34"] forState:UIControlStateNormal];
        //
    [daohangBT setTitle:@" 重庆" forState:UIControlStateNormal];
    [daohangBT setTitleColor:newColor(251, 107, 0, 1) forState:UIControlStateNormal];
    daohangBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    [headerView addSubview:daohangBT];
    //[daohangBT addTarget:self action:@selector(clickAddGouWuChe:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return headerView;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.hidesBottomBarWhenPushed = YES;
    MapViewController *MapView = [[MapViewController alloc]init];
    [self.navigationController pushViewController:MapView animated:YES];
    
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
