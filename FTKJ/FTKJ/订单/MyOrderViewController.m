//
//  MyOrderViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyOrderViewController.h"
#import "PGGLinScrillButtonView.h"
#import "MyOrderViewCell.h"
#import "MyOrderHeaderView.h"

@interface MyOrderViewController ()<PGGListScrollButtonDegelate>

@property(nonatomic,retain)PGGLinScrillButtonView *pview;


@end

@implementation MyOrderViewController

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [DataBaseManager sharedFMDBManager].order_str = @"";
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"全部订单";
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}

-(void)setUpWithBigView {
    self.pview = [[PGGLinScrillButtonView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(45))];
    self.pview.backgroundColor = [UIColor whiteColor];
    self.pview.arrbttitle = [NSMutableArray arrayWithObjects:@"保养订单",@"商品订单", nil];
    
    
    [self.pview setBackgroundColor:[UIColor whiteColor]];
    [self.pview setUserInteractionEnabled:YES];
    self.pview.isFrom = @"2";
    [self.pview setDegelate:self];
    
    self.pview.inomoselect = 0;
    
    [self.view addSubview:self.pview];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pview.frame), kScreenWidth, kScreenHeight - kTabBarHeight - CGRectGetMaxY(self.pview.frame) - kTopHeight)];
    self.tableView.backgroundColor = newColor(241, 242, 244, 1);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[MyOrderViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[MyOrderHeaderView class] forHeaderFooterViewReuseIdentifier:@"headerView"];
    [self.view addSubview:self.tableView];
    
    if ([[DataBaseManager sharedFMDBManager].order_str intValue] == 1) {
           self.pview.arrbttitle = [NSMutableArray arrayWithObjects:@"待完成",@"已完成", nil];
        CGRect tableFrame = self.tableView.frame;
        tableFrame.origin.y = CGRectGetMaxY(self.pview.frame) + kWidthChange(15);
        tableFrame.size.height = kScreenHeight - downH - CGRectGetMaxY(self.pview.frame) - kTopHeight - kWidthChange(15);
        self.tableView.frame = tableFrame;
    }
    
    
    
}
-(void)selectTag:(int)tag {
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyOrderViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setUpWithOneBigView: [@{}mutableCopy] indexPath:indexPath];
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    return [MyOrderViewCell setUpWithHeightWithNewDic: [@{}mutableCopy]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if ([[DataBaseManager sharedFMDBManager].order_str intValue] == 1) {
        return 0.00;
    }
    
    
    return kWidthChange(45);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if ([[DataBaseManager sharedFMDBManager].order_str intValue] == 1) {
        return nil;
    }
    MyOrderHeaderView *HeaderView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    [HeaderView setUpWithBigArray:@[@"全部订单",@"待支付",@"待使用",@"待评价",@"已完成"]];
    
    return HeaderView;
    
}


@end
