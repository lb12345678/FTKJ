//
//  SHDZViewController.m
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "SHDZViewController.h"
#import "AddressViewCell.h"
#import "AddAddressViewController.h"
@interface SHDZViewController ()<UITableViewDelegate,UITableViewDataSource>



@property(nonatomic,retain)NSMutableArray *dataArray;


@end

@implementation SHDZViewController

-(NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[self setUpWithData:1];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择收获地址";
    [self setUpWithTableView];
   
    // Do any additional setup after loading the view.
}

-(void)setUpWithData:(int)page {
    [Toos dataWithSessionurl:@"/app/member/my_address" body:@{@"uid":[UserModel shared].uid} view:self.view token:@"" Block:^(id tempData) {
        if (page == 1) {
            [self.dataArray removeAllObjects];
        }
        if ([tempData[@"code"]intValue] == 200) {
            if ([Toos isNotBlank:tempData[@"data"]]) {
                
                for (NSDictionary *tempDic in tempData[@"data"]) {
                    [self.dataArray addObject:tempDic];
                }
                
                
            }
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
            
        }
        
        [self.tableView reloadData];
    } failBlock:^(id tempData) {
        
    }];
    
    
}






-(void)setUpWithTableView {
self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH - kTopHeight) style:UITableViewStylePlain];
self.tableView.delegate = self;
self.tableView.dataSource = self;
[self.tableView registerClass:[AddressViewCell class] forCellReuseIdentifier:@"cell"];
self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
[self.view addSubview:self.tableView];


self.tableView.backgroundColor = [UIColor clearColor];


    
    UIButton *downBT = [UIButton buttonWithType:UIButtonTypeCustom];
    downBT.frame = CGRectMake(0, kWidthChange(0), kWidthChange(60), kWidthChange(50));
    [downBT setTitle:@"添加" forState:UIControlStateNormal];
    [downBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   
    
    downBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
   
    
    [downBT addTarget:self action:@selector(clickAddAddress:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:downBT];


//self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//    self.page = 2;
//    [self setUpWithData:1];
//}];
//MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
//    [self setUpWithData:self.page++];
//}];
//self.tableView.mj_footer = footer;
//footer.automaticallyRefresh = NO;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
//    [cell setUpWithNewName:[self.dataArray objectAtIndex:indexPath.section]];
    [cell.editBT addTarget:self action:@selector(clickEditAddress:) forControlEvents:UIControlEventTouchUpInside];
     [cell.deleteBT addTarget:self action:@selector(clickDeleteAddress:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kWidthChange(143);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *bigView = [Toos setBigView:kWidthChange(15) origin:0];
    return bigView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kWidthChange(15);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.ClickBlock) {
        self.ClickBlock([self.dataArray objectAtIndex:indexPath.section]);
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}


-(void)clickEditAddress:(UIButton *)sender {
    AddressViewCell *cell = (AddressViewCell *)[[sender.superview superview]superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    self.hidesBottomBarWhenPushed = YES;
    AddAddressViewController *AddAddress = [[AddAddressViewController alloc]init];
    AddAddress.myDic = [self.dataArray objectAtIndex:indexPath.section];
    [self.navigationController pushViewController:AddAddress animated:YES];
    
    
    
}

-(void)clickDeleteAddress:(UIButton *)sender {
    [Toos setUpAlertViewController:@"确定删除该地址" reject:@"取消" agree:@"确定" view:self Block:^{
        
        AddressViewCell *cell = (AddressViewCell *)[[sender.superview superview]superview];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [Toos dataWithSessionurl:@"/app/member/del_address" body:@{@"id":[self.dataArray objectAtIndex:indexPath.section][@"id"],@"uid":[UserModel shared].uid} view:self.view token:@"" Block:^(id tempData) {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
            if ([tempData[@"code"]intValue] == 200) {
                [self.dataArray removeObjectAtIndex:indexPath.section];
                [self.tableView reloadData];
            }
        } failBlock:^(id tempData) {
            
        }];
        
    } failBlock:^{
        
    }];
    
}


#pragma mark---新增收获地址
-(void)clickAddAddress:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    AddAddressViewController *AddAddress = [[AddAddressViewController alloc]init];
    [self.navigationController pushViewController:AddAddress animated:YES];
    
    
    
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
