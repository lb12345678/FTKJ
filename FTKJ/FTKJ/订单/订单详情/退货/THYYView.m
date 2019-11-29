//
//  THYYView.m
//  JZGL
//
//  Created by ios on 2019/8/23.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "THYYView.h"
#import "THYYViewCell.h"

@interface THYYView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UITableView *tableView;

@property(nonatomic,retain)UIView *oneView;

@property(nonatomic,retain)NSString *titleStr;


@end



@implementation THYYView

-(void)layoutSubviews {
    [super layoutSubviews];
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .5;
    [self addSubview:self.alphaView];
    
    [self.alphaView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickDismiss)]];
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, kWidthChange(300), kScreenWidth, kScreenHeight - downH - kWidthChange(300))];
    self.bigView.backgroundColor = [UIColor whiteColor];
    self.bigView.layer.masksToBounds = YES;
    self.bigView.layer.cornerRadius = 5 ;
    [self addSubview:self.bigView];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kWidthChange(310), kScreenWidth, kScreenHeight - downH - kWidthChange(310)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    [self.tableView registerClass:[THYYViewCell class] forCellReuseIdentifier:@"cell"];
    [self addSubview:self.tableView];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    THYYViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",[self.dataArray objectAtIndex:indexPath.row][@"title"]];
    if ([[self.dataArray objectAtIndex:indexPath.row][@"click"]intValue] == 0) {
        [cell.button setImage:[UIImage imageNamed:@"box35-1"] forState:UIControlStateNormal];
    }else {
         [cell.button setImage:[UIImage imageNamed:@"box34-1"] forState:UIControlStateNormal];
        
    }
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidthChange(55);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return kWidthChange(60);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(60))];
    oneView.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLabel = [Toos setUpWithUserLabel:@"选择申请原因" CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth - kWidthChange(30), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(71, 80, 90, 1) textSize:kWidthChange(18)];
        
    [oneView addSubview:nameLabel];
    
    return oneView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return kWidthChange(80);
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(80))];
    oneView.backgroundColor = [UIColor whiteColor];
    
    UIButton *TJBT = [UIButton buttonWithType:UIButtonTypeCustom];
    
    TJBT.frame = CGRectMake(kWidthChange(40),kWidthChange(30),kScreenWidth - kWidthChange(80), kWidthChange(40));
    TJBT.backgroundColor = newColor(233, 20, 50, 1);
    [TJBT setTitle:@"确定" forState:UIControlStateNormal];
    [TJBT setTitleColor:newColor(255, 255,255, 1) forState:UIControlStateNormal];
    TJBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    TJBT.layer.masksToBounds = YES;
    TJBT.layer.cornerRadius = 5;
    [oneView addSubview:TJBT];
    [TJBT addTarget:self action:@selector(clickTJBT:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    return oneView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    for (NSMutableDictionary *tempDic in self.dataArray) {
        [tempDic setObject:@"0" forKey:@"click"];
    }
    NSMutableDictionary *bigDic = [self.dataArray objectAtIndex:indexPath.row];
    [bigDic setObject:@"1" forKey:@"click"];
    self.titleStr = [NSString stringWithFormat:@"%@",bigDic[@"title"]];
    
    [self.tableView reloadData];
    
 
    
}


-(void)clickDismiss {
    self.hidden = YES;
    
}


#pragma mark---
-(void)clickTJBT:(UIButton *)sender {
    if ([Toos isBlank:self.titleStr]) {
        [Toos setUpWithMBP:@"请选择申请原因" UIView:[UIApplication sharedApplication].keyWindow];
        return;
    }
    
    if (self.clickBlock) {
        self.hidden = YES;
        self.clickBlock(self.titleStr);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
