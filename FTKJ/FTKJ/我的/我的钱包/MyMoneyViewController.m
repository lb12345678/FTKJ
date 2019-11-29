//
//  MyMoneyViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyMoneyViewController.h"
#import "MyMoneyViewCell.h"
#import "TwoTimeKeyboardView.h"
#import "TXViewController.h"
@interface MyMoneyViewController ()<TwoTimeKeyboardViewDegelate>

@end

@implementation MyMoneyViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self.fromStr intValue] != 1) {
         [self.navigationController.navigationBar setHidden:YES];
    }
    
    
   
    
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillAppear:animated];
  
        [self.navigationController.navigationBar setHidden:NO];
   
    
    
   
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpWithBigView];
    
    if ([self.fromStr intValue] == 1) {
        self.navigationItem.title = @"我的明细";
        [self setUpWithNavigation];
    }
    
    
    
    // Do any additional setup after loading the view.
}

-(void)setUpWithNavigation {
    
    
    
    
    UIButton *rightBT = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBT.frame = CGRectMake(0, 0, [Toos textRect:@"规则" textFont:[UIFont systemFontOfSize:kWidthChange(16)]], kWidthChange(18));
    [rightBT setTitle:@"规则" forState:UIControlStateNormal];
    [rightBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBT];
    rightBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    
    [rightBT addTarget:self action:@selector(clickGuiZe:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
-(void)clickGuiZe:(UIButton *)sender {
    
    
}


-(void)setUpWithBigView {
    UIImageView *bigView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(153))];
    bigView.image = [UIImage imageNamed:@"bg5"];
    [self.view addSubview:bigView];
    bigView.userInteractionEnabled = YES;
    UIButton *leftBT = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBT setImage:[UIImage imageNamed:@"box14-1"] forState:UIControlStateNormal];
    leftBT.frame = CGRectMake(kWidthChange(15), kStatusBarHeight + kWidthChange(10), kWidthChange(25), kWidthChange(25));
    [leftBT addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBT];
    
    UILabel *nameLabel = [Toos setUpWithUserLabel:@"我的钱包" CGRect:CGRectMake(kScreenWidth / 2 - kWidthChange(80), kStatusBarHeight + kWidthChange(10), kWidthChange(160), kWidthChange(25)) color:[UIColor clearColor] textColor:[UIColor whiteColor] textSize:kWidthChange(22)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameLabel];
    
    UILabel *oneLabel = [Toos setUpWithUserLabel:@"账户余额(元)" CGRect:CGRectMake(kWidthChange(20), kWidthChange(80), kScreenWidth - kWidthChange(40), kWidthChange(30)) color:[UIColor clearColor] textColor:[UIColor whiteColor] textSize:kWidthChange(16)];
   
    [bigView addSubview:oneLabel];
    
    UILabel *oneMoneyLabel = [Toos setUpWithUserLabel:@"4540.22" CGRect:CGRectMake(kWidthChange(20), CGRectGetMaxY(oneLabel.frame) , [Toos textRect:@"4540.22" textFont:[UIFont systemFontOfSize:kWidthChange(23) weight:UIFontWeightBold]], kWidthChange(30)) color:[UIColor clearColor] textColor:[UIColor whiteColor] textSize:kWidthChange(16)];
    oneMoneyLabel.font = [UIFont systemFontOfSize:kWidthChange(23) weight:UIFontWeightBold];
    [bigView addSubview:oneMoneyLabel];
    
    
    
    UIButton *TXBT = [UIButton buttonWithType:UIButtonTypeCustom];
    TXBT.frame = CGRectMake(CGRectGetMaxX(oneMoneyLabel.frame) + kWidthChange(20), CGRectGetMaxY(oneLabel.frame) , kWidthChange(60), kWidthChange(30));
    
    [TXBT setImage:[UIImage imageNamed:@"bg6"] forState:UIControlStateNormal];
    
    
     [bigView addSubview:TXBT];
    
    [TXBT addTarget:self action:@selector(clickTXBT:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *twoLabel = [Toos setUpWithUserLabel:@"赚取佣金金额" CGRect:CGRectMake(kScreenWidth - kWidthChange(20) - [Toos textRect:@"4540.22" textFont:[UIFont systemFontOfSize:kWidthChange(23) weight:UIFontWeightBold]], kWidthChange(80), [Toos textRect:@"4540.22" textFont:[UIFont systemFontOfSize:kWidthChange(23) weight:UIFontWeightBold]] , kWidthChange(30)) color:[UIColor clearColor] textColor:[UIColor whiteColor] textSize:kWidthChange(16)];
    
    [bigView addSubview:twoLabel];
    
    
   
    
    
    UILabel *twoMoneyLabel = [Toos setUpWithUserLabel:@"4540.22" CGRect:CGRectMake(kScreenWidth - kWidthChange(20) - [Toos textRect:@"4540.22" textFont:[UIFont systemFontOfSize:kWidthChange(23) weight:UIFontWeightBold]], CGRectGetMaxY(oneLabel.frame) , [Toos textRect:@"4540.22" textFont:[UIFont systemFontOfSize:kWidthChange(23) weight:UIFontWeightBold]], kWidthChange(30)) color:[UIColor clearColor] textColor:[UIColor whiteColor] textSize:kWidthChange(16)];
    twoMoneyLabel.font = [UIFont systemFontOfSize:kWidthChange(23) weight:UIFontWeightBold];
    [bigView addSubview:twoMoneyLabel];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bigView.frame), kScreenWidth, kScreenHeight - downH - CGRectGetMaxY(bigView.frame)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.tableView registerClass:[MyMoneyViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    if ([self.fromStr intValue] == 1) {
        bigView.hidden = YES;
        leftBT.hidden = YES;
        nameLabel.hidden = YES;
        CGRect tableFrame = self.tableView.frame;
        tableFrame.origin.y = 0;
        tableFrame.size.height = kScreenHeight - downH;
        self.tableView.frame = tableFrame;
    }
    
    
}
-(void)clickReturn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidthChange(70);
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyMoneyViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return kWidthChange(35);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(35))];
    oneView.backgroundColor = newColor(241, 242, 244, 1);
    UILabel *timeLabel  = [Toos setUpWithUserLabel:@"本月" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(35)) color:[UIColor clearColor] textColor:newColor(40, 41, 42, 1) textSize:kWidthChange(16)];
            
    [oneView addSubview:timeLabel];
    
    UIButton *TimeBT = [UIButton buttonWithType:UIButtonTypeCustom];
    TimeBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(20),  kWidthChange(7.5), kWidthChange(20), kWidthChange(20));
    
    [TimeBT setImage:[UIImage imageNamed:@"box36-1"] forState:UIControlStateNormal];
    
    
    [oneView addSubview:TimeBT];
    [TimeBT addTarget:self action:@selector(timeAction) forControlEvents:UIControlEventTouchUpInside];
    return oneView;
}


#pragma mark - 选择时间
-(void)timeAction
{
    TwoTimeKeyboardView *two = [[TwoTimeKeyboardView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    two.iline = 3;
    [two setDegelate:self];
    [self.view addSubview:two];
}

-(void)TwochangetimeValue:(NSString *)strvalue andendvalue:(NSString *)strendvalue
{
   
    
}

#pragma mark--提现
-(void)clickTXBT:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    TXViewController *TXView = [[TXViewController alloc]init];
    [self.navigationController pushViewController:TXView animated:YES];
    
    
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
