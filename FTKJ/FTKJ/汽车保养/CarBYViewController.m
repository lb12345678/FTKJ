//
//  CarBYViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "CarBYViewController.h"
#import "CarBayViewCell.h"
#import "BYXQViewController.h"
#import "SPFLView.h"
#import "SCFLView.h"
@interface CarBYViewController ()

@property(nonatomic,retain)UITextField *searchField;

@property(nonatomic,retain)NSMutableArray *BTArray;

@property(nonatomic,assign)int page;

@property(nonatomic,retain)SPFLView *SPView;

@property(nonatomic,retain)SCFLView *SXView;
@end

@implementation CarBYViewController
-(NSMutableArray *)BTArray {
    if (_BTArray == nil) {
        self.BTArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _BTArray;
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 2;
    [self setUpWithBTArray];
    [self setUpWithBigView];
    [self setUpWithTableView];
    // Do any additional setup after loading the view.
}
-(void)setUpWithBTArray {
    
    NSMutableDictionary *oneDic = [@{@"title":@"综合",@"icon":@"box15",@"state":@"1"}mutableCopy];
    NSMutableDictionary *twoDic = [@{@"title":@"价格",@"icon":@"box17",@"state":@"0"}mutableCopy];
    NSMutableDictionary *threeDic;
    if ([DataBaseManager sharedFMDBManager].selectNumber == 1) {
        threeDic = [@{@"title":@"分类",@"icon":@"",@"state":@"0"}mutableCopy];
    }else {
        threeDic = [@{@"title":@"销量",@"icon":@"box17",@"state":@"0"}mutableCopy];
        
        
    }
   

    NSMutableDictionary *fourDic = [@{@"title":@"筛选",@"icon":@"box18",@"state":@"0"}mutableCopy];
    
    [self.BTArray addObject:oneDic];
    
    [self.BTArray addObject:twoDic];
    
    [self.BTArray addObject:threeDic];
    
    [self.BTArray addObject:fourDic];
    
    //      [self.BTArray addObject:fourDic];
    
}
-(void)setUpWithBigView {
    
   
        UIImageView *bigView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kTopHeight + kWidthChange(12) )];
    bigView.image = [UIImage imageNamed:@"bg7-1"];
        
        [self.view addSubview:bigView];
        
    bigView.userInteractionEnabled = YES;

        UIButton *leftBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBT setImage:[UIImage imageNamed:@"box14-1"] forState:UIControlStateNormal];
        leftBT.frame = CGRectMake(kWidthChange(15), kStatusBarHeight + kWidthChange(10), kWidthChange(20), kWidthChange(20));
        [leftBT addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
        //[bigView addSubview:leftBT];
        
    
        UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake( kWidthChange(20),kStatusBarHeight + kWidthChange(5)  ,kScreenWidth - kWidthChange(40)  , kWidthChange(35))];
        searchView.layer.masksToBounds = YES;
        searchView.backgroundColor = newColor(255, 255, 255, 1);
        searchView.layer.cornerRadius = kWidthChange(17.5);
        [bigView addSubview:searchView];
        searchView.layer.borderWidth = 1;
        searchView.layer.borderColor = newColor(221, 221, 221, 1).CGColor;
        
        
        
        
        self.searchField = [[UITextField alloc]initWithFrame:CGRectMake( kWidthChange(15), 0,kScreenWidth - 24 - kWidthChange(50) , kWidthChange(35))];
        self.searchField.delegate = self;
        
        self.searchField.placeholder = @"请输入搜索内容";
        [self.searchField setValue:newColor(218, 219, 220, 1) forKeyPath:@"_placeholderLabel.font"];
        [self.searchField setValue:[UIFont systemFontOfSize:kWidthChange(16)] forKeyPath:@"_placeholderLabel.font"];
        self.searchField.font = [UIFont systemFontOfSize:kWidthChange(16)];
        self.searchField.textColor = newColor(51, 51, 51, 1);
        
        
        [searchView addSubview:self.searchField];
        
        
        
        
        UIButton *searchImage = [UIButton buttonWithType:UIButtonTypeCustom];
        [searchImage setImage:[UIImage imageNamed:@"box37"] forState:UIControlStateNormal];
        
        searchImage.frame = CGRectMake(kScreenWidth - kWidthChange(40)  - kWidthChange(15) - kWidthChange(20),   kWidthChange(7.5) , kWidthChange(20), kWidthChange(20));
        [searchView addSubview:searchImage];
        
        [searchImage addTarget:self action:@selector(clickSearch:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        
  

    
    
    
}

-(void)clickReturn:(UIButton *)sender {
    
    
    
}

- (void)setUpWithTableView{
    
    
    
    UIView *categoryView = [[UIView alloc]initWithFrame:CGRectMake(0, kTopHeight + kWidthChange(12), kScreenWidth , kWidthChange(50))];
    categoryView.backgroundColor = [UIColor whiteColor];
    
    
    
    
    [self.view addSubview:categoryView];
    
    
    
    
    for (int i = 0; i < self.BTArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(kScreenWidth / self.BTArray.count * i, 0, kScreenWidth / self.BTArray.count, kWidthChange(50));
        [button setTitle:[self.BTArray objectAtIndex:i][@"title"] forState:UIControlStateNormal];
        
        
        if (i == 0) {
            [button setTitleColor:newColor(229, 0, 0, 1) forState:UIControlStateNormal];
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
    
    
    UILabel *lineDownLabel  = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, kWidthChange(50) - 1, kScreenWidth, 1) color:newColor(230, 230, 230, 1) textColor:[UIColor whiteColor] textSize:kWidthChange(8)];
    
    [categoryView addSubview:lineDownLabel];
    
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(categoryView.frame) , kScreenWidth, kScreenHeight  - kTabBarHeight - CGRectGetMaxY(categoryView.frame) ) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [self.tableView registerClass:[CarBayViewCell class] forCellReuseIdentifier:@"cell"];
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

-(void)clickSearch:(UIButton *)sender {
    
    
    
}



#pragma mark----tableView代理


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
   
    
    
    return 5;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    
    
    
    CarBayViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setUpWithNewBigDic:@{}];
    //    cell.nameLabel.text = [self.sectionArray objectAtIndex:indexPath.row];
    //[cell.shareBT addTarget:self action:@selector(clickGouWuCheBT:) forControlEvents:UIControlEventTouchUpInside];
    
 
    return cell;
    
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    
    return kWidthChange(137);;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
   
        
        
        self.hidesBottomBarWhenPushed = YES;
        BYXQViewController *SPXQ = [[BYXQViewController alloc]init];
    
     if ([DataBaseManager sharedFMDBManager].selectNumber == 1) {
    SPXQ.fromStr = @"2";
     }else {
         SPXQ.fromStr = @"1";
         
         
     }
    
    
//        SPXQ.typeID = [self.dataArray objectAtIndex:indexPath.row][@"id"];
        [self.navigationController pushViewController:SPXQ animated:YES];
    
    self.hidesBottomBarWhenPushed = NO;
    
}



-(void)clickButton:(UIButton *)sender {
    
    
    if (sender.tag == 102) {
        
        if (self.SPView) {
            self.SPView.hidden = NO;
            [self.SPView setUpWithBigType:@""];
        }else {
            
            self.SPView = [[SPFLView alloc]initWithFrame:CGRectMake(0, kWidthChange(125), kScreenWidth, kScreenHeight - downH - kWidthChange(125))];
            [[UIApplication sharedApplication].keyWindow addSubview:self.SPView];
            
            
        }
        
        
    }
    
    if (sender.tag == 103) {
        if (self.SXView) {
            self.SXView.hidden = NO;
            //        [self.SXView setUpWithBigArray:[@[]mutableCopy] twoArray:self.categoryArray];
        }else {
            self.SXView = [[SCFLView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
            self.SXView.hidden = NO;
            self.SXView.bigType = @"1";
            //self.SXView.bigArray = self.bigArray;
            [[UIApplication sharedApplication].keyWindow addSubview:self.SXView];
        }
        __weak typeof(self)weakSelf = self;
        self.SXView.QueDing = ^(NSString *oneString, NSString *twoString, NSString *threeString,NSString *fourString, NSString *beginMoney, NSString *endMoney) {
            
//            weakSelf.brand = twoString;
//            weakSelf.min_price = beginMoney;
//            weakSelf.max_price = endMoney;
//
//            if ([Toos isNotBlank:weakSelf.twoType]) {
//
//                weakSelf.twoType = oneString;
//                [weakSelf setUpWithOnetype:weakSelf.price_type min_price:beginMoney max_price:endMoney brand:twoString type:weakSelf.oneType t_type:oneString keyword:weakSelf.searchField.text page:1 sale_type:weakSelf.XiaoLiang_Type];
//            }else {
//                weakSelf.oneType = oneString;
//                [weakSelf setUpWithOnetype:weakSelf.price_type min_price:beginMoney max_price:endMoney brand:twoString type:oneString t_type:@"" keyword:weakSelf.searchField.text page:1 sale_type:weakSelf.XiaoLiang_Type];
//
//            }
//
//
            
            
            
            
            
            
        };
    
    }
    
    
//    self.SXTableView.hidden = YES;
//    self.page = 2;
//
//    NSArray *imageArray = @[@"",@"icon_list_down",@"icon_list_down",@"icon_list_filter"];
//
//
//    for (int i = 100; i < 104; i++) {
//        UIButton *button = (UIButton *)[self.view viewWithTag:i];
//        [button setImage:[UIImage imageNamed:[imageArray objectAtIndex: i - 100]] forState:UIControlStateNormal];
//        if (button == sender) {
//            [sender setTitleColor:newColor(70, 199, 224, 1) forState:UIControlStateNormal];
//        }else {
//
//            for (int j = 0; j < 3; j++) {
//                NSMutableDictionary *newDic = [self.BTArray objectAtIndex:button.tag - 100];
//                [newDic setObject:@"0" forKey:@"state"];
//            }
//
//            [button setTitleColor:newColor(102, 105, 114, 1) forState:UIControlStateNormal];
//        }
//
//
//
//    }
//
//
//
//    if (sender.tag == 103) {
//        if (self.SXView) {
//            self.SXView.hidden = NO;
//            //        [self.SXView setUpWithBigArray:[@[]mutableCopy] twoArray:self.categoryArray];
//        }else {
//            self.SXView = [[SCFLView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//            self.SXView.hidden = NO;
//            self.SXView.bigType = @"1";
//            self.SXView.bigArray = self.bigArray;
//            [[UIApplication sharedApplication].keyWindow addSubview:self.SXView];
//        }
//        __weak typeof(self)weakSelf = self;
//        self.SXView.QueDing = ^(NSString *oneString, NSString *twoString, NSString *threeString,NSString *fourString, NSString *beginMoney, NSString *endMoney) {
//
//            weakSelf.brand = twoString;
//            weakSelf.min_price = beginMoney;
//            weakSelf.max_price = endMoney;
//
//            if ([Toos isNotBlank:weakSelf.twoType]) {
//
//                weakSelf.twoType = oneString;
//                [weakSelf setUpWithOnetype:weakSelf.price_type min_price:beginMoney max_price:endMoney brand:twoString type:weakSelf.oneType t_type:oneString keyword:weakSelf.searchField.text page:1 sale_type:weakSelf.XiaoLiang_Type];
//            }else {
//                weakSelf.oneType = oneString;
//                [weakSelf setUpWithOnetype:weakSelf.price_type min_price:beginMoney max_price:endMoney brand:twoString type:oneString t_type:@"" keyword:weakSelf.searchField.text page:1 sale_type:weakSelf.XiaoLiang_Type];
//
//            }
//
//
//
//
//
//
//
//
//        };
        
//    }else {
//
//
//        self.page = 2;
//
//        if (sender.tag == 100) {
//
//
////            self.price_type = @"";
////            self.XiaoLiang_Type = @"";
////            [self setUpWithOnetype:@"1" min_price:@"" max_price:@"" brand:@"" type:@"" t_type:@"" keyword:self.searchField.text page:1 sale_type:self.XiaoLiang_Type];
//
//
//
//        }else if (sender.tag == 101) {
//
//            self.XiaoLiang_Type = @"";
//            NSMutableDictionary *newDic = [self.BTArray objectAtIndex:sender.tag - 100];
//            if ([newDic[@"state"]intValue] == 0) {
//                [newDic setObject:@"1" forKey:@"state"];
//                [sender setImage:[UIImage imageNamed:@"icon_list_up"] forState:UIControlStateNormal];
//
//                if (sender.tag == 101) {
//
//                    self.price_type = @"1";
//
//                }
//
//                [self setUpWithOnetype:self.price_type min_price:self.min_price max_price:self.max_price brand:self.brand type:self.oneType t_type:self.twoType keyword:self.searchField.text page:1 sale_type:self.XiaoLiang_Type];
//
//                return;
//            }else if ([newDic[@"state"]intValue] == 1){
//                [sender setImage:[UIImage imageNamed:@"icon_list_down"] forState:UIControlStateNormal];
//                [newDic setObject:@"2" forKey:@"state"];
//
//                if (sender.tag == 101) {
//
//                    self.price_type = @"2";
//
//                }
//
//                [self setUpWithOnetype:self.price_type min_price:self.min_price max_price:self.max_price brand:self.brand type:self.oneType t_type:self.twoType keyword:self.searchField.text page:1 sale_type:self.XiaoLiang_Type];
//
//                return;
//
//            }else if ([newDic[@"state"]intValue] == 2){
//                [sender setImage:[UIImage imageNamed:@"icon_list_up"] forState:UIControlStateNormal];
//                [newDic setObject:@"1" forKey:@"state"];
//
//                if (sender.tag == 101) {
//
//                    self.price_type = @"1";
//
//                }
//
//                [self setUpWithOnetype:self.price_type min_price:self.min_price max_price:self.max_price brand:self.brand type:self.oneType t_type:self.twoType keyword:self.searchField.text page:1 sale_type:self.XiaoLiang_Type];
//
//
//                return;
//
//            }
//
//        }else if(sender.tag == 102){
//            self.price_type = @"";
//            NSMutableDictionary *newDic = [self.BTArray objectAtIndex:sender.tag - 100];
//            if ([newDic[@"state"]intValue] == 0) {
//                [newDic setObject:@"1" forKey:@"state"];
//                [sender setImage:[UIImage imageNamed:@"icon_list_up"] forState:UIControlStateNormal];
//
//                if (sender.tag == 102) {
//
//                    self.XiaoLiang_Type = @"1";
//
//                }
//
//                [self setUpWithOnetype:self.price_type min_price:self.min_price max_price:self.max_price brand:self.brand type:self.oneType t_type:self.twoType keyword:self.searchField.text page:1 sale_type:self.XiaoLiang_Type];
//
//                return;
//            }else if ([newDic[@"state"]intValue] == 1){
//                [sender setImage:[UIImage imageNamed:@"icon_list_down"] forState:UIControlStateNormal];
//                [newDic setObject:@"2" forKey:@"state"];
//
//                if (sender.tag == 102) {
//
//                    self.XiaoLiang_Type = @"2";
//
//                }
//
//                [self setUpWithOnetype:self.price_type min_price:self.min_price max_price:self.max_price brand:self.brand type:self.oneType t_type:self.twoType keyword:self.searchField.text page:1 sale_type:self.XiaoLiang_Type];
//
//                return;
//
//            }else if ([newDic[@"state"]intValue] == 2){
//                [sender setImage:[UIImage imageNamed:@"icon_list_up"] forState:UIControlStateNormal];
//                [newDic setObject:@"1" forKey:@"state"];
//
//                if (sender.tag == 102) {
//
//                    self.XiaoLiang_Type = @"1";
//
//                }
//
//                [self setUpWithOnetype:self.price_type min_price:self.min_price max_price:self.max_price brand:self.brand type:self.oneType t_type:self.twoType keyword:self.searchField.text page:1 sale_type:self.XiaoLiang_Type];
//
//
//                return;
//
//            }
//
//        }
//
//
//    }
    
}


//#pragma mark---
//-(void)clickGouWuCheBT:(UIButton *)sender {
//    SCViewCell *cell = (SCViewCell *)[sender.superview superview];
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
//    [Toos dataWithSessionurl:@"/app/mall/add_cart" body:@{@"uid":[UserModel shared].uid,@"id":[self.dataArray objectAtIndex:indexPath.row][@"id"],@"num":@"1"} view:self.view token:@"" Block:^(id tempData) {
//        [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
//    } failBlock:^(id tempData) {
//
//    }];
//
//
//}
//#pragma mark---分享
-(void)clickShareBT:(UIButton *)sender {
//    SCViewCell *cell = (SCViewCell *)[sender.superview superview];
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
//    if (self.moreShare) {
//        self.moreShare.hidden = NO;
//    }else {
//        self.moreShare = [[MoreShare alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//        self.moreShare.hidden = NO;
//        self.moreShare.bigType = @"1";
//        [[UIApplication sharedApplication].keyWindow addSubview:self.moreShare];
//
//    }
//    __weak typeof(self)weakSelf = self;
//    self.moreShare.ClickBlock = ^(NSString *type) {
//        if ([type isEqualToString:@"分享给微信好友"]) {
//
//        }else if ([type isEqualToString:@"分享朋友圈"]) {
//
//
//        }
//
//    };
}

@end
