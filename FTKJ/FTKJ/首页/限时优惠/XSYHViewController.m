//
//  XSYHViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/21.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "XSYHViewController.h"
#import "XSYHViewCell.h"
#import "HomeTwoHeaderView.h"
@interface XSYHViewController ()

@property(nonatomic,retain)NSMutableArray *BTArray;

@property(nonatomic,retain)NSString *timeStr;

@end

@implementation XSYHViewController
-(NSMutableArray *)BTArray {
    if (_BTArray == nil) {
        self.BTArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _BTArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"限时优惠";
    [self setUpWithBTArray];
    [self setUpWithTableView];
    // Do any additional setup after loading the view.
}


-(void)setUpWithBTArray {
    
    NSMutableDictionary *oneDic = [@{@"title":@"剩余数量",@"icon":@"box17",@"state":@"0"}mutableCopy];
    NSMutableDictionary *twoDic = [@{@"title":@"到期时间",@"icon":@"box17",@"state":@"0"}mutableCopy];
   
    
    [self.BTArray addObject:oneDic];
    
    [self.BTArray addObject:twoDic];

    
}


- (void)setUpWithTableView{
    
    
    
    UIView *categoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kWidthChange(50))];
    categoryView.backgroundColor = [UIColor whiteColor];
    
    
    
    
    [self.view addSubview:categoryView];
    
    
    
    
    for (int i = 0; i < self.BTArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(kScreenWidth / self.BTArray.count * i, 0, kScreenWidth / self.BTArray.count, kWidthChange(50));
        [button setTitle:[self.BTArray objectAtIndex:i][@"title"] forState:UIControlStateNormal];
        
        
        if (i == 0) {
            [button setTitleColor:newColor(250, 123, 35, 1) forState:UIControlStateNormal];
        }else {
            [button setTitleColor:newColor(77, 77, 77, 77) forState:UIControlStateNormal];
        }
        
        button.tag = 100 + i;
        
        
        button.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
        [button setImage:[UIImage imageNamed:[self.BTArray objectAtIndex:i][@"icon"]] forState:UIControlStateNormal];
        [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:2 weight:2];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [categoryView addSubview:button];
        
    }
    
    
    UILabel *lineDownLabel  = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, kWidthChange(50) - 1, kScreenWidth, 1) color:lineColor_gary textColor:[UIColor whiteColor] textSize:kWidthChange(8)];
    
    [categoryView addSubview:lineDownLabel];
    
    
    UILabel *lineShuLabel  = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kScreenWidth / 2 - kWidthChange(0.5), kWidthChange(15), kWidthChange(1), kWidthChange(20)) color:newColor(219, 220, 221, 1) textColor:[UIColor whiteColor] textSize:kWidthChange(8)];
    
    [categoryView addSubview:lineShuLabel];
    
    
    
    
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(categoryView.frame) , kScreenWidth, kScreenHeight  - downH - CGRectGetMaxY(categoryView.frame)-kTopHeight ) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [self.tableView registerClass:[XSYHViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[HomeTwoHeaderView class] forHeaderFooterViewReuseIdentifier:@"twoHeader"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        //        self.page = 2;
        //        [self setUpWithOnetype:self.price_type min_price:self.min_price max_price:self.max_price brand:self.brand type:self.oneType t_type:self.twoType keyword:self.searchField.text page:1 sale_type:self.XiaoLiang_Type];
        
    }];
    
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        //        //        [self setUpWithData:self.page++];
        //        [self setUpWithOnetype:self.price_type min_price:self.min_price max_price:self.max_price brand:self.brand type:self.oneType t_type:self.twoType keyword:self.searchField.text page:self.page++ sale_type:self.XiaoLiang_Type];
        
        
    }];
    footer.automaticallyRefresh = NO;
    //    footer.stateLabel.hidden = YES;
    
    //self.tableView.mj_footer = footer;
    //
    
}

#pragma mark---类别
-(void)clickButton:(UIButton *)sender {
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidthChange(140);
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XSYHViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kWidthChange(45);
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(45))];
    oneView.backgroundColor = [UIColor whiteColor];
    self.timeStr = [NSString stringWithFormat:@"%d",3700 - ([[Toos getCurrentTimestamp]intValue] - [self.oneTimeStr intValue])] ;
    
    HomeTwoHeaderView *twoHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"twoHeader"];
    [twoHeader setUpWithNewBigTimeStr:self.timeStr type:@"1"];
    [oneView addSubview:twoHeader];
    
    
    return oneView;
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
