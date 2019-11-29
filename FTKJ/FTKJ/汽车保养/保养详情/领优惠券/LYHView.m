//
//  LYHView.m
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "LYHView.h"
#import "LQYHViewCell.h"

@interface LYHView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UITableView *tableView;

@end



@implementation LYHView

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .4;
    [self addSubview:self.alphaView];
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - downH - kWidthChange(473), kScreenWidth, kWidthChange(483))];
    self.bigView.backgroundColor = [UIColor whiteColor];
    
    self.bigView.layer.masksToBounds = YES;
    self.bigView.layer.cornerRadius = kWidthChange(10);
    [self addSubview:self.bigView];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(473)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[LQYHViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.bigView addSubview:self.tableView];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidthChange(126);
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LQYHViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    
    return kWidthChange(50);
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(50))];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLabel  = [Toos setUpWithUserLabel:@"领取优惠券" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(16)];
    [headerView addSubview:nameLabel];
    
    UIButton *deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBT.frame = CGRectMake(kScreenWidth - kWidthChange(40), kWidthChange(15), kWidthChange(20), kWidthChange(20));
    [deleteBT setImage:[UIImage imageNamed:@"box22"] forState:UIControlStateNormal];
    [deleteBT addTarget:self action:@selector(clickDeleteBT:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:deleteBT];
    return headerView;
    
    
}

-(void)clickDeleteBT:(UIButton *)sender {
    
    
    self.hidden = YES;
}


@end
