//
//  DDSPView.m
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "DDSPView.h"
#import "DDSPViewCell.h"

@interface DDSPView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UITableView *tableView;


@end



@implementation DDSPView



-(void)layoutSubviews {
    [super layoutSubviews];
    
    UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    alphaView.backgroundColor = [UIColor lightGrayColor];
    alphaView.alpha = .5;
    [self addSubview:alphaView];
    [alphaView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickDisMiss)]];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kScreenHeight / 2, kScreenWidth, kScreenHeight / 2) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[DDSPViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView];
    
    

    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidthChange(100);
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
 
    
    DDSPViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setUpWithNewDic:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
   
    
    
    return kWidthChange(45);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(45))];
    oneView.backgroundColor = newColor(255, 255, 255, 1);
    UILabel *SPLabel = [Toos setUpWithUserLabel:@"订单商品" CGRect:CGRectMake(kWidthChange(40), 0, kScreenWidth - kWidthChange(45), kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(85, 93,104, 1) textSize:kWidthChange(18)];
    
    [oneView addSubview:SPLabel];
    
    
    
    UIButton *deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBT.frame = CGRectMake( kScreenWidth - kWidthChange(20) - kWidthChange(25), kWidthChange(45) / 2 - kWidthChange(25) / 2, kWidthChange(25), kWidthChange(25));
    [deleteBT setImage:[UIImage imageNamed:@"box45"] forState:UIControlStateNormal];
    
    [deleteBT addTarget:self action:@selector(clickDisMiss) forControlEvents:UIControlEventTouchUpInside];
    [oneView addSubview:deleteBT];
    
    
    return oneView;
    
}

-(void)clickDisMiss {
    
    
    self.hidden = YES;
}


@end
