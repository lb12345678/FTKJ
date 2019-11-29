//
//  MessageViewController.m
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageViewCell.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UITableView *tableView;

@property(nonatomic,retain)NSMutableArray *dataArray;

@property(nonatomic,assign)int page;

@end

@implementation MessageViewController

-(NSMutableArray *)dataArray {
    if(_dataArray == nil){
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
        
    }
    return _dataArray;
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息通知";
    self.page = 2;
    [self setUpWithTableView];
    [self setUpWithNavigation];
    [self setUpWithData:1];
    // Do any additional setup after loading the view.
}

-(void)setUpWithData:(int)page {
    [Toos dataWithSessionurl:@"/app/member/get_messages" body:@{@"uid":[UserModel shared].uid,@"page":[NSNumber numberWithInt:page],@"limit":@"10"} view:self.view token:@"" Block:^(id tempData) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        if (page == 1) {
            [self.dataArray removeAllObjects];
        }
        
        
        
        if ([tempData[@"code"]intValue] == 200) {
            if ([Toos isNotBlank:tempData[@"data"]]) {
                for (NSDictionary *newDic in tempData[@"data"]) {
                    [self.dataArray addObject:newDic];
                }
            }
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
            
        }
        [self.tableView reloadData];
        
    } failBlock:^(id tempData) {
        
    }];
    
    
}




-(void)setUpWithNavigation {
    
    
    
    
    UIButton *rightBT = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBT.frame = CGRectMake(0, 0, [Toos textRect:@"清空" textFont:[UIFont systemFontOfSize:kWidthChange(16)]], kWidthChange(40));
    [rightBT setTitle:@"清空" forState:UIControlStateNormal];
    [rightBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBT];
    rightBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    
    [rightBT addTarget:self action:@selector(clickQingKong:) forControlEvents:UIControlEventTouchUpInside];
   
    
    
}

-(void)setUpWithTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH - kTopHeight ) style:UITableViewStylePlain];
     self.tableView.backgroundColor = newColor(239, 238, 248, 1);;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MessageViewCell class] forCellReuseIdentifier:@"cell"];
  
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    self.tableView.mj_header  = [MJRefreshHeader headerWithRefreshingBlock:^{
                self.page = 2;
        [self setUpWithData:1];
    }];
    //
            MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
                 [self setUpWithData:self.page++];
            }];
            self.tableView.mj_footer = footer;
            footer.automaticallyRefresh = NO;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setUpWithNewBigDic:[self.dataArray objectAtIndex:indexPath.section]];
    cell.backgroundColor = newColor(239, 238, 248, 1);;
    cell.ClickDelete = ^(NSDictionary * _Nonnull tempDic) {
        [Toos setUpAlertViewController:@"确定删除此条消息" reject:@"取消" agree:@"确定" view:self Block:^{
            [Toos dataWithSessionurl:@"/app/member/del_messages" body:@{@"uid":[UserModel shared].uid,@"id":tempDic[@"id"]} view:self.view token:@"" Block:^(id tempData) {
                [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
                if ([tempData[@"code"]intValue] == 200) {
                    [self.dataArray removeObject:tempDic];
                    [self.tableView reloadData];
                }
            } failBlock:^(id tempData) {
                
            }];
            
        } failBlock:^{
            
        }];
    };
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [MessageViewCell setUpWithBigHeightWithDic:[self.dataArray objectAtIndex:indexPath.section]];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return kWidthChange(50);
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(50))];
    bigView.backgroundColor = newColor(241, 242, 244, 1);
    
    
    
    UILabel *timeLabel = [Toos setUpWithUserLabel:@"今天11:53" CGRect:CGRectMake(0, 0, kScreenWidth, kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(136, 137, 138, 1) textSize:kWidthChange(16)];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    
    [bigView addSubview:timeLabel];
    
    
    
    return bigView;
    
}

#pragma mark--清空
-(void)clickQingKong:(UIButton *)sender {
    
    [Toos setUpAlertViewController:@"确定清空所有消息" reject:@"取消" agree:@"确定" view:self Block:^{
        [Toos dataWithSessionurl:@"/app/member/del_messages" body:@{@"uid":[UserModel shared].uid} view:self.view token:@"" Block:^(id tempData) {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
            if ([tempData[@"code"]intValue] == 200) {
                [self.dataArray removeAllObjects];
                [self.tableView reloadData];
            }
        } failBlock:^(id tempData) {
            
        }];
        
    } failBlock:^{
        
    }];
    

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
