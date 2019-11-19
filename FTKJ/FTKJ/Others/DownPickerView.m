//
//  DownPickerView.m
//  KuaiPai
//
//  Created by ios on 2018/8/1.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "DownPickerView.h"
#import "DownPickerViewCell.h"
@interface DownPickerView()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UITableView *tableView;

@property(nonatomic,retain)NSString *numberStr;

@property(nonatomic,retain)NSString *nameStr;
@end


@implementation DownPickerView


-(void)layoutSubviews {
    [super layoutSubviews];
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTopHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .5;
    [self addSubview:self.alphaView];
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.bigView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bigView];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTap:)];
//    [self.bigView addGestureRecognizer:tap];
    
    
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, 0) style:UITableViewStylePlain];
    self.tableView.delegate  =self;
    self.tableView.dataSource = self;
  
    [self.tableView registerClass:[DownPickerViewCell class] forCellReuseIdentifier:@"cell"];
    [self.bigView addSubview:self.tableView];
    
    
    [self setUpWithAnimation:self.dataArray];
    
    
}

- (void)setUpWithAnimation:(NSMutableArray *)newArray {
    
    self.dataArray = newArray;
    [self.tableView reloadData];
    
    [UIView animateWithDuration:.5 animations:^{
        
        
        CGRect tableFrame = self.tableView.frame;
        
        
        if (newArray.count * (kHeightChange(40) ) + kWidthChange(50) > kHeightChange(300)) {
            tableFrame.origin.y = kScreenHeight  - kHeightChange(300);
            tableFrame.size.height =  kHeightChange(300);
        }else {
            
            
            tableFrame.origin.y = kScreenHeight -kWidthChange(50) - (kHeightChange(40)) * newArray.count;
            tableFrame.size.height =  (kHeightChange(40) ) * newArray.count + kWidthChange(50);
        }
        
        
        self.tableView.frame = tableFrame;
        
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DownPickerViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
 
    cell.nameLabel.text = [self.dataArray objectAtIndex:indexPath.row];
  
    if ([Toos isNotBlank:self.numberStr]) {
        if (indexPath.row == [self.numberStr intValue]) {
            cell.biaoShiImage.hidden = NO;
        }else {
            cell.biaoShiImage.hidden = YES;
        }
    }else {
        cell.biaoShiImage.hidden = YES;
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kWidthChange(40) ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.numberStr = [NSString stringWithFormat:@"%ld",indexPath.row];
    [self.tableView reloadData];
    self.nameStr = [self.dataArray objectAtIndex:indexPath.row];
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kWidthChange(50);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(50))];
    bigView.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *middenLabel = [Toos setUpWithUserLabel:@"退款原因" CGRect:CGRectMake(15,0 , kScreenWidth - 30, kWidthChange(50)) color:[UIColor whiteColor] textColor:newColor(245, 61, 5, 1) textSize:kWidthChange(14)];
    middenLabel.textAlignment = NSTextAlignmentCenter;
    [bigView addSubview:middenLabel];
    
    
    UIButton *canculBT = [UIButton buttonWithType:UIButtonTypeCustom];
  
    
    [canculBT setTitle:@"取消" forState:UIControlStateNormal];
   
    [canculBT setTitleColor:newColor(245, 61, 5, 1) forState:UIControlStateNormal];
    canculBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    canculBT.frame = CGRectMake(15, 0,[Toos textRect:@"取消" textFont:[UIFont systemFontOfSize:kWidthChange(14)]], kWidthChange(50));
    [canculBT addTarget:self action:@selector(clickCanCul:) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:canculBT];
    
    
    
    UILabel *RightLabel = [Toos setUpWithUserLabel:@"确定" CGRect:CGRectMake(kScreenWidth / 2,0, kScreenWidth / 2 - 15, kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(245, 61, 5, 1) textSize:kWidthChange(14)];
    RightLabel.textAlignment = NSTextAlignmentRight;
    [bigView addSubview:RightLabel];
    UITapGestureRecognizer *tapSuccess = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickSuccess:)];
    [RightLabel addGestureRecognizer:tapSuccess];
    
    
      UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0,kWidthChange(50) - 1, kScreenWidth , 1) color:newColor(230, 230, 230, 1) textColor:newColor(245, 61, 5, 1) textSize:kWidthChange(14)];
    
      [bigView addSubview:lineLabel];
    
    
    return bigView;
}
-(void)clickCanCul:(UIButton *)sender {
    
    
    
    
    [UIView animateWithDuration:.25 animations:^{
        CGRect tableFrame = self.tableView.frame;
        tableFrame.origin.y = kScreenHeight;
        tableFrame.size.height =  0;
        self.tableView.frame = tableFrame;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

-(void)clickSuccess:(UITapGestureRecognizer *)sender {
    
    if ([Toos isBlank:self.nameStr]) {
       
        [Toos setUpWithMBP:@"请选择原因" UIView:self.bigView];
        
        return;
    }
    
    [UIView animateWithDuration:.25 animations:^{
        CGRect tableFrame = self.tableView.frame;
        tableFrame.origin.y = kScreenHeight;
        tableFrame.size.height =  0;
        self.tableView.frame = tableFrame;
    } completion:^(BOOL finished) {
        self.hidden = YES;
      
            self.ClickPeople(self.nameStr);
        
    }];
}

@end
