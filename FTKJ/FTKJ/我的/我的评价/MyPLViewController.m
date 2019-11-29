//
//  MyPLViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyPLViewController.h"
#import "MyPLViewCell.h"
#import "IXAttributeTapLabel.h"

@interface MyPLViewController ()

@end

@implementation MyPLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的评价";
    // Do any additional setup after loading the view.
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}
-(void)setUpWithBigView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH - kTopHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [self.tableView registerClass:[MyPLViewCell class] forCellReuseIdentifier:@"threeCell"];
    
    
    
    
    
    
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    return [MyPLViewCell setUpWithHeightWithNewDic:@{}];
}






-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    MyPLViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeCell" forIndexPath:indexPath];
//    [cell setUpWithNewBigDic:@{}];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kWidthChange(62);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(62))];
    headerView.backgroundColor = newColor(241, 242, 244, 1);
    
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(50))];
    bigView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:bigView];
    
    
    IXAttributeTapLabel * MyMoneyLabel = [[IXAttributeTapLabel alloc] initWithFrame:CGRectMake(kWidthChange(20) ,0, kScreenWidth - kWidthChange(100) , kWidthChange(50))];
    MyMoneyLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    MyMoneyLabel.backgroundColor = [UIColor clearColor];
    
    //文本点击回调
    MyMoneyLabel.tapBlock = ^(NSString *string) {
        
        
        
        NSLog(@" -- %@ --",string);
    };
    
    //设置需要点击的字符串，并配置此字符串的样式及位置
    IXAttributeModel    * model = [IXAttributeModel new];
    model.range = [@"还有 2 件商品暂未评价" rangeOfString:@"2"];
    model.string = @"2";
    //            model.alertImg = [UIImage imageNamed:@"alert"];
    model.attributeDic = @{NSForegroundColorAttributeName : newColor(249, 106, 0, 1), NSFontAttributeName: [UIFont systemFontOfSize:kWidthChange(16)]};
    
    [MyMoneyLabel setText:@"还有 2 件商品暂未评价" attributes:@{NSForegroundColorAttributeName:newColor(13, 14, 15, 1),NSFontAttributeName:[UIFont systemFontOfSize:kWidthChange(16) weight:UIFontWeightLight]}
           tapStringArray:@[model]];
    [bigView addSubview:MyMoneyLabel];
    
    
    
    UIButton *newBT = [UIButton buttonWithType:UIButtonTypeCustom];
    newBT.frame  = CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(75),  kWidthChange(10) , kWidthChange(75), kWidthChange(30));
    newBT.layer.masksToBounds = YES;
    newBT.layer.cornerRadius = kWidthChange(15);
    newBT.backgroundColor = newColor(255, 255, 255, 1);
    [newBT setTitle:@"去评价" forState:UIControlStateNormal];
    [newBT setTitleColor:newColor(245, 113, 0, 1) forState:UIControlStateNormal];
    newBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    [newBT addTarget:self action:@selector(clickpingJia:) forControlEvents:UIControlEventTouchUpInside];
    newBT.layer.borderWidth = 1;
    newBT.layer.borderColor = newColor(245, 113, 0, 1).CGColor;
    [bigView addSubview:newBT];
    return headerView;
    
}

#pragma mark---去评价
-(void)clickpingJia:(UIButton *)sender {
    
    
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
