//
//  SPFLView.m
//  FTKJ
//
//  Created by ios on 2019/11/21.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "SPFLView.h"
#import "LeftTableViewCell.h"

#import "RightTableViewCell.h"

@interface SPFLView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UITableView *lefttableView;

@property(nonatomic,retain)UITableView *rightTableView;

@property(nonatomic,assign)NSInteger numberType;



@end



@implementation SPFLView

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH - kWidthChange(125))];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .4;
    [self addSubview:self.alphaView];
    
    
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH - kWidthChange(125))];
    oneView.backgroundColor = [UIColor clearColor];
    [self addSubview:oneView];
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
    self.bigView.backgroundColor = newColor(241, 242, 244, 1);
    [oneView addSubview:self.bigView];
    
    self.lefttableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidthChange(120), 0) style:UITableViewStylePlain];
    self.lefttableView.delegate = self;
    self.lefttableView.dataSource = self;
    
    self.lefttableView.rowHeight = kWidthChange(46);
    [self.lefttableView registerClass:[LeftTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.lefttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.bigView addSubview:self.lefttableView];
    
    
    
    
    
    
    
    self.rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.lefttableView.frame) + kWidthChange(10), kWidthChange(10), kScreenWidth - kWidthChange(130), 0) style:UITableViewStylePlain];
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    
    
    [self.rightTableView registerClass:[RightTableViewCell class] forCellReuseIdentifier:@"rightCell"];
    self.rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.bigView addSubview:self.rightTableView];
    self.numberType = 0;
    [self setUpWithBigType:@""];
    
    
}

-(void)setUpWithBigType:(NSString *)type {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.numberType inSection:0];
    [self.lefttableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    [UIView animateWithDuration:.3 animations:^{
        CGRect bigFrame = self.bigView.frame;
        
        CGRect leftFrame = self.lefttableView.frame;
        
        CGRect rightFrame = self.rightTableView.frame;
        
        bigFrame.size.height = kScreenHeight  - downH  - kWidthChange(125);
        
          leftFrame.size.height = kScreenHeight  - downH  - kWidthChange(125);
        
        
          rightFrame.size.height = kScreenHeight  - downH  - kWidthChange(135);
        
        self.bigView.frame = bigFrame;
        self.lefttableView.frame = leftFrame;
        self.rightTableView.frame = rightFrame;
        
    }];
    
    
    
}

#pragma mark----tableView代理


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.rightTableView) {
        
       
        
        
        return 1;
    }
    
    
    return 5;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (tableView == self.rightTableView) {
        RightTableViewCell *cell = [self.rightTableView dequeueReusableCellWithIdentifier:@"rightCell" forIndexPath:indexPath];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        //cell.numberType = self.numberType;
        [cell setUpWithOneBigArray:[@[@{@"title":@"123",@"img":@""},@{@"title":@"123",@"img":@""},@{@"title":@"123",@"img":@""},@{@"title":@"123",@"img":@""}]mutableCopy]];
        __weak typeof(self)weakSelf = self;
        cell.ClickBlock = ^(NSString * _Nonnull type) {
            [UIView animateWithDuration:.3 animations:^{
                CGRect bigFrame = self.bigView.frame;
                
                CGRect leftFrame = self.lefttableView.frame;
                
                CGRect rightFrame = self.rightTableView.frame;
                
                bigFrame.size.height = 0;
                
                leftFrame.size.height = 0;
                
                
                rightFrame.size.height = 0;
                
                weakSelf.bigView.frame = bigFrame;
                weakSelf.lefttableView.frame = leftFrame;
                weakSelf.rightTableView.frame = rightFrame;
                
            }completion:^(BOOL finished) {
                weakSelf.hidden = YES;
            }];
            
        };
        //    cell.nameLabel.text = [self.sectionArray objectAtIndex:indexPath.row];
        return cell;
        
    }
    
    
    
    LeftTableViewCell *cell = [self.lefttableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.nameLabel.text = @"女装新款";
//    NSMutableArray *dataArray = [[Toos readDataByPath:@"category"]mutableCopy];
//
//
//
//    cell.nameLabel.text = [dataArray objectAtIndex:indexPath.row][@"title"];
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == self.lefttableView) {
        return 0;
    }
    return kWidthChange(0);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.lefttableView) {
        return kWidthChange(46);
    }
    
    return [RightTableViewCell tableViewHeightWithArray:[@[@{@"title":@"123",@"img":@""},@{@"title":@"123",@"img":@""},@{@"title":@"123",@"img":@""},@{@"title":@"123",@"img":@""}]mutableCopy]];
}







- (void)selectRow:(NSInteger )section {
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:section inSection:0];
    
    
    [self.lefttableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    self.numberType = section;
//    if ([Toos isNotBlank:[[Toos readDataByPath:@"category"]objectAtIndex:self.numberType][@"son"]]) {
//        self.dataArray = [[Toos readDataByPath:@"category"]objectAtIndex:self.numberType][@"son"];
//    }else {
//        self.dataArray = [NSMutableArray arrayWithCapacity:1 ];
//    }
//
    
    
    [self.rightTableView reloadData];
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.lefttableView) {
//        self.selectIndex = indexPath.row;
        [self selectRow:indexPath.row];
        
        //        NSIndexPath *indexPathleft = [NSIndexPath indexPathForRow:self.selectIndex inSection:0];
        //
        //
        //
        //        [self.tableView scrollToRowAtIndexPath:indexPathleft atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
    }else {
        
        
      
        
        
        
        
        //        self.hidesBottomBarWhenPushed = YES;
        //        SCFLViewController *SCFL = [[SCFLViewController alloc]init];
        //        SCFL.searchStr = @"";
        //        SCFL.bigArray = self.dataArray;
        //        SCFL.oneType = [[Toos readDataByPath:@"category"]objectAtIndex:self.numberType][@"id"];
        //        SCFL.twoType = [self.dataArray objectAtIndex:indexPath.row][@"id"];
        //
        //
        //
        //        [self.navigationController pushViewController:SCFL animated:YES];
        
        
    }
}








@end
