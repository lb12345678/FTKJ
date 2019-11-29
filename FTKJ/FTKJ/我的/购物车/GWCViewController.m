//
//  GWCViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/27.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "GWCViewController.h"
#import "GouWuCheViewCell.h"

@interface GWCViewController ()

@property(nonatomic,retain)UIButton *AllBT;

@property(nonatomic,retain)UILabel *moneyLabel;

@property(nonatomic,retain)NSMutableArray *dataArray;

@property(nonatomic,retain)NSMutableArray *countArray;

@property(nonatomic,assign)BOOL isAll;


@property(nonatomic,retain)UIView *downView;



@property(nonatomic,retain)UIView *twoSmallView;

@end

@implementation GWCViewController
-(NSMutableArray *)dataArray {
    
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}
-(NSMutableArray *)countArray {
    if (_countArray == nil) {
        self.countArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _countArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物车";
    [self setUpWithBigView];
     [self setUpWithTwoSmallView];
    // Do any additional setup after loading the view.
}
-(void)setUpWithBigView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH  -kWidthChange(65) - kTopHeight ) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[GouWuCheViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor = newColor(239, 238, 248, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    
    self.downView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.tableView.frame) , kScreenWidth, kWidthChange(65))];
    self.downView.backgroundColor = newColor(62, 63, 64, 1);
    [self.view addSubview: self.downView];
    
    
    self.AllBT = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.AllBT.frame = CGRectMake(0, kWidthChange(65) / 2 - kWidthChange(15) ,  kWidthChange(70), kWidthChange(30));
    [self.AllBT setImage:[UIImage imageNamed:@"round 拷贝 5"] forState:UIControlStateNormal];
    
    [self.AllBT setTitle:@" 全选" forState:UIControlStateNormal];
    [self.AllBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    self.AllBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [ self.downView addSubview:self.AllBT];
    
    [self.AllBT addTarget:self action:@selector(clickQuXuanZeBT:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBT.frame = CGRectMake(CGRectGetMaxX(self.AllBT.frame), kWidthChange(65) / 2 - kWidthChange(15) ,  kWidthChange(45), kWidthChange(30));
    
    [deleteBT setTitle:@"删除" forState:UIControlStateNormal];
    [deleteBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    deleteBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [self.downView addSubview:deleteBT];
    [deleteBT addTarget:self action:@selector(clickAllDelete:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *AllLabel =  [Toos setUpWithUserLabel:@"合计:" CGRect:CGRectMake(CGRectGetMaxX(deleteBT.frame) + kWidthChange(10),kWidthChange(65) / 2 - kWidthChange(15) , [Toos textRect:@"合计:" textFont:[UIFont systemFontOfSize:kWidthChange(15)]], kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(255, 255, 255, 1) textSize:kWidthChange(15)];
    
    [ self.downView addSubview:AllLabel];
    
    
    self.moneyLabel = [Toos setUpWithUserLabel:@"¥ 0" CGRect:CGRectMake(CGRectGetMaxX(AllLabel.frame) + kWidthChange(3),kWidthChange(65) / 2 - kWidthChange(15) , kScreenWidth - kWidthChange(61), kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(254, 145, 32, 1) textSize:kWidthChange(18)];
    
    [ self.downView addSubview:self.moneyLabel];
    
    
    
    UIButton *bayBT = [UIButton buttonWithType:UIButtonTypeCustom];
    bayBT.frame = CGRectMake(kScreenWidth - kWidthChange(15) - kWidthChange(100), kWidthChange(12.5),  kWidthChange(100), kWidthChange(40));
    bayBT.backgroundColor = newColor(230, 21, 50, 1);
    bayBT.layer.masksToBounds = YES;
    bayBT.layer.cornerRadius = kWidthChange(20);
    [bayBT setTitle:@"立即购买" forState:UIControlStateNormal];
    [bayBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    bayBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [ self.downView addSubview:bayBT];
    [bayBT addTarget:self action:@selector(clickBayBT:) forControlEvents:UIControlEventTouchUpInside];
}



-(void)setUpWithTwoSmallView {
    
    
    self.twoSmallView = [[UIView alloc]initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight  - downH)];
    self.twoSmallView.backgroundColor = newColor(239, 237, 244, 1);
    [self.view addSubview:self.twoSmallView];
    
    UIImageView *smallImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg10-1"]];
    smallImage.frame = CGRectMake(kScreenWidth / 2 - kWidthChange(120) / 2, kWidthChange(222) - kTopHeight, kWidthChange(120), kWidthChange(73));
    smallImage.contentMode = UIViewContentModeCenter;
    [self.twoSmallView addSubview:smallImage];
    self.twoSmallView.hidden = YES;
    
    
    
    UILabel *titlelabel = [Toos setUpWithUserLabel:@"亲，您的购物车空空如也～" CGRect:CGRectMake(0, CGRectGetMaxY(smallImage.frame) + kWidthChange(15),kScreenWidth, kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(173, 173, 175, 1) textSize:kWidthChange(15)];
    
    
    titlelabel.textAlignment = NSTextAlignmentCenter;
    [self.twoSmallView addSubview:titlelabel];
    
    
    UIButton *guangBT = [UIButton buttonWithType:UIButtonTypeCustom];
    guangBT.frame = CGRectMake(kScreenWidth / 2 - kWidthChange(85) / 2, CGRectGetMaxY(titlelabel.frame) + kWidthChange(35), kWidthChange(85), kWidthChange(27));
    guangBT.layer.masksToBounds = YES;
    guangBT.layer.cornerRadius = kWidthChange(27) / 2;
    [guangBT setTitle:@"随便逛逛" forState:UIControlStateNormal];
    
    guangBT.layer.borderWidth = .5;
    guangBT.layer.borderColor = newColor(233, 29, 56, 1).CGColor;
    [guangBT setTitleColor:newColor(233, 29, 56, 1) forState:UIControlStateNormal];
    guangBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
    [self.twoSmallView addSubview:guangBT];
    [guangBT addTarget:self action:@selector(clickGuangBT:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)clickGuangBT:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    //    self.hidesBottomBarWhenPushed = YES;
    //    SCFLViewController *categoryView = [[SCFLViewController alloc]init];
    //    categoryView.searchStr = @"";
    //
    //
    //    categoryView.oneType = @"";
    //    categoryView.twoType = @"";
    //    categoryView.bigArray = [[Toos readDataByPath:@"category"]mutableCopy];
    //
    //    [self.navigationController pushViewController:categoryView animated:YES];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 5;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GouWuCheViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //[cell setUpWithBigDic:[self.dataArray objectAtIndex:indexPath.section]];
    //cell.backgroundColor = newColor(239, 238, 248, 1);;
    
    [cell.XuanZeBT addTarget:self action:@selector(clickXuanZeOneRow:) forControlEvents:UIControlEventTouchUpInside];
    [cell.JianBT addTarget:self action:@selector(clickDelete:) forControlEvents:UIControlEventTouchUpInside];
    [cell.addBT addTarget:self action:@selector(clickAddBT:) forControlEvents:UIControlEventTouchUpInside];
    [cell.deleteBT addTarget:self action:@selector(clickDeleteOne:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidthChange(130);
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return kWidthChange(50);
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.hidesBottomBarWhenPushed = YES;
//    SPXQController *SPXQ = [[SPXQController alloc]init];
//    SPXQ.typeID = [self.dataArray objectAtIndex:indexPath.section][@"product"][@"id"];
//    [self.navigationController pushViewController:SPXQ animated:YES];
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(15))];
    bigView.backgroundColor = newColor(255, 255, 255, 1);
    
    
    UIButton *XuanZeBT  = [UIButton buttonWithType:UIButtonTypeCustom];
            XuanZeBT.frame = CGRectMake(kWidthChange(45) / 2 - kWidthChange(10), kWidthChange(15),  kWidthChange(20), kWidthChange(20));
            [XuanZeBT setImage:[UIImage imageNamed:@"box57"] forState:UIControlStateNormal];
    [bigView addSubview:XuanZeBT];
    
   
    
   
    
    UILabel *nameLabel  = [Toos setUpWithUserLabel:@"领购物券满200减40" CGRect:CGRectMake(kWidthChange(45),kWidthChange(0) , kScreenWidth - kWidthChange(61) , kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(139, 140, 142, 1) textSize:kWidthChange(17)];
    
     [bigView addSubview:nameLabel];
    
    
    UIButton *LQBT = [UIButton buttonWithType:UIButtonTypeCustom];
    LQBT.frame = CGRectMake(kScreenWidth  - kWidthChange(70) ,  kWidthChange(15), kWidthChange(50), kWidthChange(23));
    LQBT.layer.masksToBounds = YES;
    LQBT.layer.cornerRadius = kWidthChange(23) / 2;
    [LQBT setTitle:@"领券" forState:UIControlStateNormal];
    
    LQBT.layer.borderWidth = .5;
    LQBT.layer.borderColor = newColor(233, 29, 56, 1).CGColor;
    [LQBT setTitleColor:newColor(233, 29, 56, 1) forState:UIControlStateNormal];
    LQBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
    [bigView addSubview:LQBT];
    [LQBT addTarget:self action:@selector(clickLQBT:) forControlEvents:UIControlEventTouchUpInside];
    
    return bigView;
    
}
#pragma mark--领券
-(void)clickLQBT:(UIButton *)sender {
    
    
}
#pragma mark---购买
-(void)clickBayBT:(UIButton *)sender {
    
    if ([Toos isBlank:self.countArray]) {
        [Toos setUpWithMBP:@"请选择您要购买的商品" UIView:self.view];
        return;
    }
    
    
    
    
    self.hidesBottomBarWhenPushed = YES;
//    DDZFViewController *DDZF = [[DDZFViewController alloc]init];
//    NSString *tempStr;
//    NSString *spStr;
//
//    for (NSMutableDictionary *newDic in self.countArray) {
//        if ([Toos isBlank:tempStr]) {
//            tempStr = [NSString stringWithFormat:@"%@",newDic[@"id"]];
//            spStr = [NSString stringWithFormat:@"%@",newDic[@"product_id"]];
//        }else {
//            tempStr = [NSString stringWithFormat:@"%@,%@",tempStr,newDic[@"id"]];
//            spStr = [NSString stringWithFormat:@"%@,%@",spStr,newDic[@"product_id"]];
//        }
//    }
//
//
//    DDZF.product_id = tempStr;
//    DDZF.SPID = spStr;
//
//    [self.navigationController pushViewController:DDZF animated:YES];
    
    
}

#pragma mark---全选
-(void)clickQuXuanZeBT:(UIButton *)sender {
    
    if (self.isAll == NO) {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self.countArray removeAllObjects];
            
            
            float allMoney = 0.00;
            
            for (NSMutableDictionary *tempDic in self.dataArray) {
                [tempDic setObject:@"1" forKey:@"click"];
                
                
                allMoney += [tempDic[@"price"]floatValue] * [tempDic[@"num"]floatValue];
                
                [self.countArray addObject:tempDic];
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.moneyLabel.text = [NSString stringWithFormat:@"￥ %.2f",allMoney];
                
                
                [self.tableView reloadData];
                
                
            });
            
            
        });
        
        
        
        
        [sender setImage:[UIImage imageNamed:@"icon_4cart_CheckBox_s"] forState:UIControlStateNormal];
        self.isAll = YES;
    }else if (self.isAll == YES){
        
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            for (NSMutableDictionary *tempDic in self.dataArray) {
                [tempDic setObject:@"0" forKey:@"click"];
            }
            
            [self.countArray removeAllObjects];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.moneyLabel.attributedText = [Toos setUpWithtext: [NSString stringWithFormat:@"合计：￥0.00"]  color:newColor(91, 94, 105, 1) color1:newColor(21, 45, 122, 1) font:kWidthChange(15) font1:kWidthChange(20) length:3 length1:5];
                
                self.moneyLabel.text = [NSString stringWithFormat:@"￥ 0.00"];
                
                [self.tableView reloadData];
                
                
            });
            
            
        });
        
        
        
        [sender setImage:[UIImage imageNamed:@"icon_4cart_CheckBox_n"] forState:UIControlStateNormal];
        self.isAll = NO;
    }
    
    
}

#pragma mark----结算或删除
-(void)clickAllDelete:(UIButton *)sender {
    
    if ([Toos isBlank:self.countArray]) {
        
        [Toos setUpWithMBP:@"请选择商品" UIView:self.view];
        
        return;
    }
    
    
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSString *tempStr;
        
        
        for (NSMutableDictionary *newDic in self.countArray) {
            if ([Toos isBlank:tempStr]) {
                tempStr = [NSString stringWithFormat:@"%@",newDic[@"id"]];
            }else {
                tempStr = [NSString stringWithFormat:@"%@,%@",tempStr,newDic[@"id"]];
            }
        }
        
        NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:1];
        [tempDic setObject:[Toos setUpWithObjectForKey:@"token"] forKey:@"token"];
        [tempDic setObject:[UserModel shared].uid forKey:@"uid"];
        [tempDic setObject:tempStr forKey:@"cart_id"];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [Toos dataWithSessionurl:@"/app/member/del_cart" body:tempDic view:self.view token:@"" Block:^(id tempData) {
                [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
                if ([tempData[@"code"]intValue] == 200) {
                    
                    for (NSMutableDictionary *newDic in self.countArray) {
                        
                        [self.dataArray removeObject:newDic];
                        
                    }
                    
                    
                    
                    
                    self.moneyLabel.text = [NSString stringWithFormat:@"￥ 0.00"];
                    
                    
                    
                    if (self.dataArray.count == 0) {
                        
                        self.isAll = NO;
                        [ self.AllBT setImage:[UIImage imageNamed:@"icon_4cart_CheckBox_n"] forState:UIControlStateNormal];
                        
                        self.twoSmallView.hidden = NO;
                        self.downView.hidden = YES;
                        
                    }
                    
                    
                    [self.tableView reloadData];
                    
                }
                
                
            } failBlock:^(id tempData) {
                
            }];
            
            
            
        });
        
        
    });
    
    
    
    
}

#pragma mark--删除一个
-(void)clickDeleteOne:(UIButton *)sender {
    GouWuCheViewCell *cell = (GouWuCheViewCell *)[[sender.superview superview]superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSMutableDictionary *newDic = [self.dataArray objectAtIndex:indexPath.section];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:1];
        [tempDic setObject:[Toos setUpWithObjectForKey:@"token"] forKey:@"token"];
        [tempDic setObject:[UserModel shared].uid forKey:@"uid"];
        [tempDic setObject:newDic[@"id"] forKey:@"cart_id"];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [Toos dataWithSessionurl:@"/app/member/del_cart" body:tempDic view:self.view token:@"" Block:^(id tempData) {
                [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
                if ([tempData[@"code"]intValue] == 200) {
                    
                    
                    
                    [self.dataArray removeObject:newDic];
                    
                    
                    
                    
                    
                    [self.tableView reloadData];
                    
                    if (self.dataArray.count == 0) {
                        self.twoSmallView.hidden = NO;
                        self.downView.hidden = YES;
                    }
                    
                    
                    [self setUpWithmoneyArray];
                    
                }
                
                
            } failBlock:^(id tempData) {
                
            }];
            
            
            
        });
        
        
    });
    
    
}


#pragma mark---选择一个row
- (void)clickXuanZeOneRow:(UIButton *)sender {
    GouWuCheViewCell *cell = (GouWuCheViewCell *)[sender.superview superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSMutableDictionary *newDic = [self.dataArray objectAtIndex:indexPath.section];
    [self setUpWithNewSection:newDic];
    
}

#pragma mark---建好
-(void)clickDelete:(UIButton *)sender {
    
    GouWuCheViewCell *cell = (GouWuCheViewCell *)[[sender.superview superview]superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSMutableDictionary *newDic = [self.dataArray objectAtIndex:indexPath.section];
    int number = [cell.XiaoLabel.text intValue];
    
    
    if (number == 1) {
        
        [Toos setUpWithMBP:@"该商品数量不能减少了" UIView:self.view];
        
        return;
    }
    
    
    [self setUpWithGouWuCheJiaJian:@"2" cart_id:newDic[@"product_id"] countLabel:cell.XiaoLabel newDic:newDic];
}

#pragma mark---加号
-(void)clickAddBT:(UIButton *)sender {
    
    
    GouWuCheViewCell *cell = (GouWuCheViewCell *)[[sender.superview superview]superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSMutableDictionary *newDic = [self.dataArray objectAtIndex:indexPath.section];
    
    
    
    [self setUpWithGouWuCheJiaJian:@"1" cart_id:newDic[@"product_id"] countLabel:cell.XiaoLabel newDic:newDic];
    
}



-(void)setUpWithmoneyArray {
    
    if ([Toos isBlank:self.countArray]) {
        return;
    }
    
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        float allMoney = 0.00;
        
        for (NSMutableDictionary *tempDic in self.countArray) {
            
            
            allMoney += [tempDic[@"price"]floatValue] * [tempDic[@"num"]floatValue];
            
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            
            self.moneyLabel.text = [NSString stringWithFormat:@"￥ %.2f",allMoney];
            
            
            
            
        });
        
        
    });
    
    
    
    
    
    
}
#pragma mark---购物车加减
-(void)setUpWithGouWuCheJiaJian:(NSString *)type cart_id:(NSString *)cart_id countLabel:(UITextField *)countLabel newDic:(NSMutableDictionary *)newDic{
    
    NSMutableDictionary *tempDic = [@{@"uid":[UserModel shared].uid,@"token":[UserModel shared].token,@"id":newDic[@"product"][@"id"],@"s_id":newDic[@"s_id"]}mutableCopy];
    
    NSString *urlStr;
    if ([type intValue] == 1) {
        
        [tempDic setObject:@"1" forKey:@"num"];
        
        urlStr = @"/app/mall/add_cart";
    }else {
        urlStr = @"/app/mall/reduce_cart";
        
    }
    
    
    
    [Toos dataWithSessionurl:urlStr body:tempDic view:self.view token:@"" Block:^(id tempData) {
        
        if ([tempData[@"code"]intValue] == 200) {
            
            if ([type intValue] == 1) {
                int number = [countLabel.text intValue];
                number ++ ;
                countLabel.text = [NSString stringWithFormat:@"%d",number];
                
                
                [newDic setObject:[NSNumber numberWithInt:number] forKey:@"num"];
                [self setUpWithmoneyArray];
            }else {
                
                int number = [countLabel.text intValue];;
                number --;
                countLabel.text = [NSString stringWithFormat:@"%d",number];
                
                
                [newDic setObject:[NSNumber numberWithInt:number] forKey:@"num"];
                
                [self setUpWithmoneyArray];
                
            }
            
            
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        }
        
        
    } failBlock:^(id tempData) {
        
    }];
    
    
}

-(void)setUpWithNewSection:(NSMutableDictionary *)newDic {
    if ([newDic[@"click"]intValue] == 0) {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [newDic setObject:@"1" forKey:@"click"];
            
            [self.countArray addObject:newDic];
            
            float allMoney = 0.00;
            
            for (NSMutableDictionary *tempDic in self.countArray) {
                
                if ([tempDic[@"id"]isEqualToString:newDic[@"id"]]) {
                    [self.countArray removeObject:tempDic];
                    [self.countArray addObject:newDic];
                    
                    
                    
                    
                }
                
                allMoney += [tempDic[@"price"]floatValue] * [tempDic[@"num"]floatValue];
                
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (self.countArray.count == self.dataArray.count) {
                    self.isAll = YES;
                    
                    [self.AllBT setImage:[UIImage imageNamed:@"icon_4cart_CheckBox_s"] forState:UIControlStateNormal];
                }
                
                
                
                
                self.moneyLabel.text = [NSString stringWithFormat:@"￥ %.2f",allMoney];
                
                [self.tableView reloadData];
                
                
            });
            
            
        });
    }else if ([newDic[@"click"]intValue] == 1){
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [newDic setObject:@"0" forKey:@"click"];
            [self.countArray removeObject:newDic];
            float allMoney = 0.00;
            for (NSMutableDictionary *tempDic in self.countArray) {
                
                allMoney += [tempDic[@"price"]floatValue] * [tempDic[@"num"]floatValue];
                
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                self.isAll = NO;
                [self.AllBT setImage:[UIImage imageNamed:@"icon_4cart_CheckBox_n"] forState:UIControlStateNormal];
                
                self.moneyLabel.text = [NSString stringWithFormat:@"￥ %.2f",allMoney];
                
                [self.tableView reloadData];
                
                
            });
            
            
        });
        
        
        
        
    }
    
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
