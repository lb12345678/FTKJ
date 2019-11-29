//
//  SCFLView.m
//  JZGL
//
//  Created by ios on 2019/8/6.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "SCFLView.h"

#import "SXViewCell.h"

@interface SCFLView()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property(nonatomic,retain)UITableView *tableView;

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)NSMutableArray *dataArray;

@property(nonatomic,retain)DownPickerView *downView;

@property(nonatomic,retain)NSMutableArray *threeArray;

@property(nonatomic,retain)NSMutableArray *fourArray;

@property(nonatomic,retain)NSString *user_type;//服务类型

@property(nonatomic,retain)NSString *FuWuType;//服务品牌

@property(nonatomic,retain)NSString *sort;//服务商

@property(nonatomic,retain)NSString *fangShi;//服务方式

@property(nonatomic,retain)UITextField *beginMoney;

@property(nonatomic,retain)UITextField *endMoney;

@property(nonatomic,retain)UITextField *timeTF;

@property(nonatomic,assign)BOOL oneSection;

@property(nonatomic,assign)BOOL twoSection;
@end
@implementation SCFLView

-(NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}
-(NSMutableArray *)oneArray {
    if (_oneArray == nil) {
        self.oneArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _oneArray;
}

-(NSMutableArray *)twoArray {
    if (_twoArray == nil) {
        self.twoArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _twoArray;
}

-(NSMutableArray *)threeArray {
    if (_threeArray == nil) {
        self.threeArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _threeArray;
}

-(NSMutableArray *)fourArray {
    if (_fourArray == nil) {
        self.fourArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _fourArray;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dianJiShaiXuan:) name:@"shaiXuan" object:nil];
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .5;
    [self addSubview:self.alphaView];
    
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth - kWidthChange(302), 0, kWidthChange(302), self.frame.size.height)];
    self.bigView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bigView];
    
    
    
    UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bigView.frame.size.width, kWidthChange(50))];
    smallView.backgroundColor = newColor(244, 245, 246, 1);
    
    [self.bigView addSubview:smallView];
    
    UILabel *ShaiXuan = [Toos setUpWithUserLabel:@"筛选" CGRect:CGRectMake(kWidthChange(15), 0, kWidthChange(100), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(151, 153, 154, 1) textSize:kWidthChange(16)];
    [smallView addSubview:ShaiXuan];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(smallView.frame) + 5 , self.bigView.frame.size.width, self.bigView.frame.size.height -CGRectGetMaxY(smallView.frame)  - 10 ) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.bigView addSubview:self.tableView];
    
    [self.tableView registerClass:[SXViewCell class] forCellReuseIdentifier:@"cell"];
    [self setUpWithFooterView];
    
    [self setUpWithNewData];
    
  
    
}


-(void)setUpWithNewData {
    
   
    
    [Toos dataWithSessionurl:@"/app/mall/get_brand" body:@{} view:[UIApplication sharedApplication].keyWindow token:@"" Block:^(id tempData) {
        
        if ([tempData[@"code"]intValue] == 200) {
            
            for (NSDictionary *tempDic in self.bigArray) {
                NSMutableDictionary *bigDic = [[NSMutableDictionary alloc]initWithDictionary:tempDic];
                [bigDic setObject:@"0" forKey:@"click"];
                [self.oneArray addObject:bigDic];
            }
            
            
            
            
            if ([Toos isNotBlank:tempData[@"data"]]) {
                for (NSDictionary *oneDic in tempData[@"data"]) {
                    NSMutableDictionary *tempDic = [[NSMutableDictionary alloc]initWithDictionary:oneDic];
                    [tempDic setObject:@"0" forKey:@"click"];
                    [self.twoArray addObject:tempDic];
                }
            }
            
            
            
            
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:[UIApplication sharedApplication].keyWindow];
            
            
        }
        
        [self.tableView reloadData];
        
        
    } failBlock:^(id tempData) {
        
    }];
    
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //    if ([self.bigType intValue] == 1) {
    return 2;
    //    }
    //    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *string = [NSString stringWithFormat:@"cell%ld",indexPath.row];
    
    
    SXViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    
    // 判断为空进行初始化  --（当拉动页面显示超过主页面内容的时候就会重用之前的cell，而不会再次初始化）
    if (cell == nil) {
        cell = [[SXViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSMutableArray *array;
    cell.bigType = @"1";
    if (indexPath.section == 0) {
        
        if (self.oneSection == NO) {
            if (self.oneArray.count > 3) {
                array = [[self.oneArray subarrayWithRange:NSMakeRange(0, 3)]mutableCopy];
            }else {
                
                
                array = self.oneArray;
            }
        }else {
            
             array = self.oneArray;
            
        }
        
        
        
        
       
    }else if (indexPath.section == 1){
        
        if (self.twoSection == NO) {
            if (self.twoArray.count > 3) {
                array = [[self.twoArray subarrayWithRange:NSMakeRange(0, 3)]mutableCopy];
            }else {
                
                
                array = self.twoArray;
            }
        }else {
            
            array = self.twoArray;
            
        }
        
        
       
    }else if(indexPath.section == 2){
        array = self.threeArray;
    }else {
        array = self.fourArray;
    }
    
  
    [cell setUpWithNameLabel:@"" imageArray:array nsIndexPath:indexPath];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *array;
    if (indexPath.section == 0) {
        
        if (self.oneSection == NO) {
            if (self.oneArray.count > 3) {
                array = [[self.oneArray subarrayWithRange:NSMakeRange(0, 3)]mutableCopy];
            }else {
                
                
                array = self.oneArray;
            }
        }else {
            
            array = self.oneArray;
            
        }
        
        
        
        
       
    }else if (indexPath.section == 1){
        if (self.twoSection == NO) {
            if (self.twoArray.count > 3) {
                array = [[self.twoArray subarrayWithRange:NSMakeRange(0, 3)]mutableCopy];
            }else {
                
                
                array = self.twoArray;
            }
        }else {
            
            array = self.twoArray;
            
        }
    }else if(indexPath.section == 2){
        array = self.threeArray;
    }else {
        array = self.fourArray;
    }
    return [SXViewCell heightWithMyName:@"" imageArray:array];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return kWidthChange(45);
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *bigView = [[UIView alloc]init];
    bigView.backgroundColor = [UIColor whiteColor];
    

    NSArray *nameArray;
    
    if ([self.bigType intValue] == 1) {
        nameArray = @[@"按类型",@"按品牌"];
    }else {
        
        nameArray = @[@"选择分类",@"选择服务商",@"价格区间",@"服务方式"];
        
    }
    
    
    
    UILabel *nameLabel = [Toos setUpWithUserLabel:[nameArray objectAtIndex:section] CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth, kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(38, 38, 39, 1) textSize:kWidthChange(15)];
    
    [bigView addSubview:nameLabel];
    
    
    
    bigView.frame = CGRectMake(0, 0, kScreenWidth / 2 , kHeightChange(30));
    
    
    UIButton *RightBT = [UIButton buttonWithType:UIButtonTypeCustom];
    RightBT.frame = CGRectMake(kWidthChange(302) - [Toos textRect:@"更多 " textFont:[UIFont systemFontOfSize:kWidthChange(15)]] - kWidthChange(15) - kWidthChange(15), 0, [Toos textRect:@"更多 " textFont:[UIFont systemFontOfSize:kWidthChange(15)]] + kWidthChange(15), kHeightChange(30));
    [RightBT setTitle:@"更多 " forState:UIControlStateNormal];
    [RightBT setTitleColor:newColor(197, 197, 197, 1) forState:UIControlStateNormal];
    RightBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    
    if (section == 0) {
        if (self.oneSection == NO) {
             [RightBT setImage:[UIImage imageNamed:@"box15"] forState:UIControlStateNormal];
        }else {
             [RightBT setImage:[UIImage imageNamed:@"box15"] forState:UIControlStateNormal];
            
            
            
        }
    }
    if (section == 1) {
        if (self.twoSection == NO) {
            [RightBT setImage:[UIImage imageNamed:@"box15"] forState:UIControlStateNormal];
        }else {
            [RightBT setImage:[UIImage imageNamed:@"box15"] forState:UIControlStateNormal];
            
            
            
        }
    }
    
    
    
   
    [bigView addSubview:RightBT];
    [RightBT layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:2 weight:2];
    [RightBT addTarget:self action:@selector(clickOpenMore:) forControlEvents:UIControlEventTouchUpInside];
    RightBT.tag = 10 + section;
    
    return bigView;
}


-(void)clickOpenMore:(UIButton *)sender {
    if (sender.tag == 10) {
        if (self.oneSection == NO) {
            self.oneSection = YES;
        }else if (self.oneSection == YES){
            self.oneSection = NO;
            
        }
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    }else {
        if (self.twoSection == NO) {
            self.twoSection = YES;
        }else if (self.twoSection == YES){
            self.twoSection = NO;
            
        }
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
        
        
    }
    
    
}




-(void)setUpWithFooterView {
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidthChange(302), kWidthChange(600))];
    
    
    self.tableView.tableFooterView = bigView;
    
    NSArray *oneArray ;
    UILabel *nameLabel = [Toos setUpWithUserLabel:@"价格区间（元）" CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth, kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(38, 38, 39, 1) textSize:kWidthChange(14)];
    
    
    self.beginMoney = [[UITextField alloc]initWithFrame:CGRectMake(kWidthChange(15), CGRectGetMaxY(nameLabel.frame) + 5, kWidthChange(101),kWidthChange(35))];
    self.beginMoney.layer.masksToBounds = YES;
    self.beginMoney.layer.cornerRadius = 1;
    self.beginMoney.placeholder = @"最低价格";
    self.beginMoney.backgroundColor = newColor(255, 255, 255, 1);
    //    self.beginMoney.layer.borderWidth = 1;
    //    self.beginMoney.layer.borderColor = newColor(230, 230, 230, .6).CGColor;
    [self.beginMoney setValue:newColor(140, 140, 140, 1) forKeyPath:@"_placeholderLabel.Color"];
    
    [self.beginMoney setValue:[UIFont systemFontOfSize:kWidthChange(14)] forKeyPath:@"_placeholderLabel.Font"];
    self.beginMoney.font = [UIFont systemFontOfSize:kWidthChange(14)];
    self.beginMoney.textAlignment = NSTextAlignmentCenter;
    
    self.beginMoney.layer.masksToBounds = YES;
    self.beginMoney.layer.cornerRadius = kWidthChange(35) / 2;
    self.beginMoney.layer.borderWidth = 1;
    self.beginMoney.layer.borderColor = lineColor_gary.CGColor;
    UILabel *LineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(CGRectGetMaxX(self.beginMoney.frame) + kWidthChange(15), CGRectGetMaxY(nameLabel.frame) + kWidthChange(17) + 5, kWidthChange(28), 1) color:newColor(230, 230, 230, 1) textColor:newColor(51, 51, 51, .8) textSize:kWidthChange(14)];
    
    
    
    self.endMoney = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(LineLabel.frame) + kWidthChange(15), CGRectGetMaxY(nameLabel.frame) + 5, kWidthChange(101), kWidthChange(35))];
    self.endMoney.layer.masksToBounds = YES;
    self.endMoney.layer.cornerRadius = 5;
    self.endMoney.placeholder = @"最高价格";
    //    self.endMoney.layer.borderWidth = 1;
    //    self.endMoney.layer.borderColor = newColor(230, 230, 230, .6).CGColor;
    [self.endMoney setValue:newColor(140, 140, 140, 1) forKeyPath:@"_placeholderLabel.Color"];
    self.endMoney.backgroundColor = newColor(255, 255, 255, 1);
    [self.endMoney setValue:[UIFont systemFontOfSize:kWidthChange(14)] forKeyPath:@"_placeholderLabel.Font"];
    self.endMoney.font = [UIFont systemFontOfSize:kWidthChange(14)];
    self.endMoney.textAlignment = NSTextAlignmentCenter;
    self.endMoney.layer.masksToBounds = YES;
    self.endMoney.layer.cornerRadius = kWidthChange(35) / 2;
    self.endMoney.layer.borderWidth = 1;
    self.endMoney.layer.borderColor = lineColor_gary.CGColor;
    
    [bigView addSubview:nameLabel];
    [bigView addSubview:self.beginMoney];
    [bigView addSubview:LineLabel];
    [bigView addSubview:self.endMoney];
    
    

    oneArray = @[@"重置",@"确定"];
    
    
    for (int i = 0; i < oneArray.count; i++) {
        UIButton *newBT = [UIButton buttonWithType:UIButtonTypeCustom];
        newBT.frame = CGRectMake(kWidthChange(15) + (kWidthChange(302) - (oneArray.count * kWidthChange(30))) / oneArray.count * i + i * kWidthChange(30),CGRectGetMaxY(self.endMoney.frame) + kWidthChange(100), (kWidthChange(302)  - (oneArray.count * kWidthChange(30))) /  oneArray.count , kWidthChange(45));
        
        [newBT setTitle:[oneArray objectAtIndex:i] forState:UIControlStateNormal];
        
        
        newBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
        [bigView addSubview:newBT];
        
        newBT.layer.masksToBounds = YES;
        newBT.layer.cornerRadius = kWidthChange(45) / 2;
        newBT.layer.borderColor = newColor(230, 230, 230, 1).CGColor;
        if (i == 0) {
            newBT.backgroundColor = [UIColor whiteColor];
            [newBT setTitleColor:newColor(51, 51, 51, 1) forState:UIControlStateNormal];
            newBT.layer.borderWidth = 1;
        }else {
            [newBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            newBT.backgroundColor = newColor(233, 20, 50, 1);
            newBT.layer.borderWidth = 0;
        }
        
        
        [newBT addTarget:self action:@selector(clickChaKan:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
    
}


- (void)clickChaKan:(UIButton *)sender {
    
    
    
    
    
    if ([sender.titleLabel.text isEqualToString:@"重置"]) {
        self.timeTF.text = @"";
        self.user_type = @"";
        self.FuWuType = @"";
        self.sort = @"";
        self.fangShi = @"";
        self.beginMoney.text = @"";
        self.endMoney.text = @"";
        for (NSMutableDictionary *newDic in self.oneArray) {
            [newDic setObject:@"0" forKey:@"click"];
        }
        
        for (NSMutableDictionary *newDic in self.twoArray) {
            [newDic setObject:@"0" forKey:@"click"];
        }
        
        for (NSMutableDictionary *newDic in self.threeArray) {
            [newDic setObject:@"0" forKey:@"click"];
        }
        
        for (NSMutableDictionary *newDic in self.fourArray) {
            [newDic setObject:@"0" forKey:@"click"];
        }
        
        [self.tableView reloadData];
        
        
        //        if (self.QueDing) {
        //            self.QueDing(self.user_type, self.FuWuType, self.sort,self.fangShi,self.beginMoney.text,self.endMoney.text);
        //            self.hidden = YES;
        //        }
    }else {
        self.hidden = YES;
        if (self.QueDing) {
            self.QueDing(self.user_type, self.FuWuType, self.sort,self.fangShi,self.beginMoney.text,self.endMoney.text);
            self.hidden = YES;
        }
        
        
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.hidden = YES;
}
- (void)clickDeleter:(UIButton *)sender {
    self.hidden = YES;
}
- (void)dianJiShaiXuan:(NSNotification *)noti {
    NSLog(@"----------%d",[noti.object intValue] );
    
    
    
    if ([noti.object intValue] > 99 && [noti.object intValue] < self.oneArray.count + 100) {
        
        
        for (NSMutableDictionary *newDic in self.oneArray) {
            [newDic setObject:@"0" forKey:@"click"];
        }
        NSMutableDictionary *tempDic = [self.oneArray objectAtIndex:[noti.object intValue] - 100];
        [tempDic setObject:@"1" forKey:@"click"];
        
        
        if ([Toos isNotBlank:tempDic[@"title"]]) {
            self.user_type = tempDic[@"id"];
        }else {
            
            self.user_type = @"";
            
        }
        
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    }
    
    
    if ([noti.object intValue] > 199 && [noti.object intValue] < self.twoArray.count + 200) {
        
        
        for (NSMutableDictionary *newDic in self.twoArray) {
            [newDic setObject:@"0" forKey:@"click"];
        }
        NSMutableDictionary *tempDic = [self.twoArray objectAtIndex:[noti.object intValue] - 200];
        [tempDic setObject:@"1" forKey:@"click"];
        
        
        if ([Toos isNotBlank:tempDic[@"title"]]) {
            self.FuWuType = [NSString stringWithFormat:@"%@",tempDic[@"id"]];
        }else {
            
            self.FuWuType = @"";
            
        }
        
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
    }
    
    if ([noti.object intValue] > 299 && [noti.object intValue] < self.threeArray.count + 300) {
        
        
        for (NSMutableDictionary *newDic in self.threeArray) {
            [newDic setObject:@"no" forKey:@"click"];
        }
        NSMutableDictionary *tempDic = [self.threeArray objectAtIndex:[noti.object intValue] - 300];
        [tempDic setObject:@"yes" forKey:@"click"];
        
        
        if ([Toos isNotBlank:tempDic[@"id"]]) {
            self.sort = [self.threeArray objectAtIndex:[noti.object intValue] - 300][@"id"];
        }else {
            
            self.sort = @"";
            
        }
        
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
    }
    
    
    if ([noti.object intValue] > 399 && [noti.object intValue] < self.fourArray.count + 400) {
        
        
        for (NSMutableDictionary *newDic in self.fourArray) {
            [newDic setObject:@"no" forKey:@"click"];
        }
        NSMutableDictionary *tempDic = [self.fourArray objectAtIndex:[noti.object intValue] - 400];
        [tempDic setObject:@"yes" forKey:@"click"];
        
        
        if ([Toos isNotBlank:tempDic[@"id"]]) {
            self.fangShi = [self.fourArray objectAtIndex:[noti.object intValue] - 400][@"id"];
        }else {
            
            self.fangShi = @"";
            
        }
        
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationNone];
    }
    
    
    
}


- (void)clickQueDing:(UIButton *)sender {
    
}


@end
