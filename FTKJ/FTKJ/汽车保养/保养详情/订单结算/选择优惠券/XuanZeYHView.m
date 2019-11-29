//
//  XuanZeYHView.m
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "XuanZeYHView.h"

#import "MyYouHuiViewCell.h"
@interface XuanZeYHView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UITableView *tableView;

@end


@implementation XuanZeYHView
-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .4;
    [self addSubview:self.alphaView];
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - downH - kWidthChange(400), kScreenWidth, kWidthChange(420))];
    self.bigView.backgroundColor = [UIColor whiteColor];
    
    self.bigView.layer.masksToBounds = YES;
    self.bigView.layer.cornerRadius = kWidthChange(10);
    [self addSubview:self.bigView];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(400)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[MyYouHuiViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.bigView addSubview:self.tableView];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidthChange(94);
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyYouHuiViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    
    return kWidthChange(50);
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(50))];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLabel  = [Toos setUpWithUserLabel:@"使用优惠券" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(18)];
    [headerView addSubview:nameLabel];
    
    UIButton *deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - [Toos textRect:@"不使用优惠券" textFont:[UIFont systemFontOfSize:kWidthChange(14)]], kWidthChange(15),[Toos textRect:@"不使用优惠券" textFont:[UIFont systemFontOfSize:kWidthChange(14)]], kWidthChange(20));
    [deleteBT setTitle:@"不使用优惠券" forState:UIControlStateNormal];
    [deleteBT setTitleColor:newColor(147, 148, 149, 1) forState:UIControlStateNormal];
    deleteBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    [deleteBT addTarget:self action:@selector(clickDeleteBT:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:deleteBT];
    return headerView;
    
    
}

-(void)clickDeleteBT:(UIButton *)sender {
    
    
    self.hidden = YES;
}










@end
