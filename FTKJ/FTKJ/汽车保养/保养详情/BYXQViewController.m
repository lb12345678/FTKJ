//
//  BYXQViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "BYXQViewController.h"
#import "SPXQOneHeaderView.h"
#import "SPXQOneViewCell.h"
#import "DownView.h"
#import "PLViewCell.h"
#import "TJViewCell.h"

@interface BYXQViewController ()

@property(nonatomic,retain)UIImageView *alphaView;

@property(nonatomic,assign)BOOL isDrag;

@end

@implementation BYXQViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}
-(void)setUpWithBigView {
   
    
  
//    UILabel *lineLabel =  [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0,  kTopHeight - 1, kScreenWidth, 1) color:lineColor_gary textColor:newColor(43, 53, 125, 1) textSize:kWidthChange(18)];
//    lineLabel.userInteractionEnabled = NO;
//    [bigView addSubview:lineLabel];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH - kTabBarHeight  ) style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"oneCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    [self.tableView registerClass:[PLViewCell class] forCellReuseIdentifier:@"plCell"];
    [self.tableView registerClass:[SPXQOneHeaderView class] forHeaderFooterViewReuseIdentifier:@"headerCell"];
    [self.tableView registerClass:[SPXQOneViewCell class] forCellReuseIdentifier:@"twoCell"];
     [self.tableView registerClass:[PLViewCell class] forCellReuseIdentifier:@"PLCell"];
     [self.tableView registerClass:[TJViewCell class] forCellReuseIdentifier:@"TJCell"];
//    [self.tableView registerClass:[TJViewCell class] forCellReuseIdentifier:@"threeCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    
//    MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
//        [self setUpWithData:self.page++];;
//    }];
//    self.tableView.mj_footer = footer;
//    footer.automaticallyRefresh = NO;
//
    
    DownView *dView = [[DownView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), kScreenWidth, kTabBarHeight)];
    dView.FromStr = self.fromStr;
    dView.viewController = self;
    [self.view addSubview:dView];
    
    UIImageView *bigView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kTopHeight )];
    bigView.image = [UIImage imageNamed:@"bg7-1"];
    bigView.alpha = 0;
    
    [self.view addSubview:bigView];
    
    self.alphaView = bigView;
    
    UIButton *leftBT = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBT setImage:[UIImage imageNamed:@"box7"] forState:UIControlStateNormal];
    leftBT.frame = CGRectMake(kWidthChange(15), kStatusBarHeight + kWidthChange(10), kWidthChange(25), kWidthChange(25));
    [leftBT addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBT];
    
    
    UIButton *searchImage = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchImage setImage:[UIImage imageNamed:@"box8"] forState:UIControlStateNormal];
    
    searchImage.frame = CGRectMake(kScreenWidth - kWidthChange(15) - kWidthChange(25),   kStatusBarHeight + kWidthChange(10) , kWidthChange(25), kWidthChange(25));
    [self.view addSubview:searchImage];
    
      [searchImage addTarget:self action:@selector(clickSearch:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        self.isDrag = YES;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.isDrag == YES) {
        
        
        CGFloat yoffset = scrollView.contentOffset.y;
        
        if (yoffset >0) {
            
            CGFloat alpha = MIN(1, yoffset/80);
            
            self.alphaView.alpha = alpha;
            
        }else {
            self.alphaView.alpha = 0;
            
        }
    }
}


-(void)clickReturn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    if ([self.fromStr intValue] == 2) {
        return 4;
    }
    
    
    
    return 2;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([self.fromStr intValue] == 2) {
        
    
    if (section == 1) {
        
//        if ([Toos isBlank:self.tempDic]) {
//            return 0;
//        }
//
//
        
        return 1;
    }
    
    if (section == 2) {
        return 3;
    }
    
        
        
        
        return 1;
    }
    
    
    
    if (section == 1) {
        
     
        
        
        return 4;
    }
    
  
    
    
    return 1;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"oneCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    }
    if ([self.fromStr intValue] == 2) {
        
        if (indexPath.section == 1) {
            PLViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PLCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSeparatorStyleNone;
            cell.backgroundColor = newColor(245, 244, 249, 1);
            //[cell setUpWithNewBigView:self.tempDic[@"comment"]];
            return cell;
        }
        
        if (indexPath.section == 2) {
            SPXQOneViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"twoCell" forIndexPath:indexPath];
            
            //[cell setUpWithImage:[self.dataArray objectAtIndex:indexPath.row] imageArray:self.dataArray indexPath:indexPath heightArray:self.heightArray];
            
            //        [cell.bigImage sd_setImageWithURL:[NSURL URLWithString:[self.dataArray objectAtIndex:indexPath.row]]];
            cell.selectionStyle = UITableViewCellSeparatorStyleNone;
            return cell;
        }
        
        if (indexPath.section == 3) {
            TJViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TJCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSeparatorStyleNone;
            
//            if ([Toos isNotBlank:self.tempDic]) {
//                [cell setUpWithBigArray:self.tempDic[@"tj_product"]];
//            }
            
            cell.backgroundColor = newColor(245, 244, 249, 1);
            __weak typeof(self)weakSelf = self;
            cell.ClickBlock = ^(NSString * _Nonnull str) {
//                [DataBaseManager sharedFMDBManager].SPStr = @"";
//                weakSelf.typeID = str;
//
//                [weakSelf setUpWithData:1];
                tableView.contentOffset = CGPointMake(0, 0);
            };
            return cell;
        }
        
        
    }
    
    
   
        SPXQOneViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"twoCell" forIndexPath:indexPath];
        
        //[cell setUpWithImage:[self.dataArray objectAtIndex:indexPath.row] imageArray:self.dataArray indexPath:indexPath heightArray:self.heightArray];
        
        //        [cell.bigImage sd_setImageWithURL:[NSURL URLWithString:[self.dataArray objectAtIndex:indexPath.row]]];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 0;
    }
    if ([self.fromStr intValue] == 2) {
        if (indexPath.section == 2) {
            
//            return  [[self.heightArray objectAtIndex:indexPath.row]floatValue] + kWidthChange(10);
                       return  kScreenWidth;

        }
        
        if (indexPath.section == 3) {
            return 0;
//            if ([Toos isBlank:self.tempDic]) {
//                return 0;
//            }
//
//
//
//            return [TJViewCell heightWithBIgArray:self.tempDic[@"tj_product"]];
        }
        
        
        
//        if ([Toos isBlank:self.tempDic]) {
            return 0;
//        }
        
        
//        return [PLViewCell setUpWithBigHeightWithArray:self.tempDic[@"comment"]];
    }
    
    return kScreenWidth ;
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [SPXQOneHeaderView setUpWithHeightWithBigArray:@{}];
    }
    return kWidthChange(60);
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        SPXQOneHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerCell"];
        view.backgroundColor = [UIColor whiteColor];
        if ([self.fromStr intValue] == 2) {
             [view setUpWithBigView:@{} bigType:@"1"];
        }else {
             [view setUpWithBigView:@{} bigType:@"0"];
        }
//        if ([Toos isNotBlank:self.tempDic]) {

       
//        }
        view.numberlabel.tag = 3000;
        
        return view;
    }
    if ([self.fromStr intValue] == 2) {
        if (section == 2) {
            UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kWidthChange(60))];
            bigView.backgroundColor = newColor(255, 255, 255, 1);
            
            UILabel *oneLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(45), kWidthChange(30) - .5, kWidthChange(90), 1) color:newColor(213, 214, 215, 1) textColor:newColor(62, 74, 85, 1) textSize:kWidthChange(15)];
            
            [bigView addSubview:oneLabel];
            
            
            UILabel *twoLabel = [Toos setUpWithUserLabel:@"商品详情" CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth - kWidthChange(30), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(64, 73, 85, 1) textSize:kWidthChange(18)];
            [bigView addSubview:twoLabel];
            twoLabel.textAlignment = NSTextAlignmentCenter;
            
            UILabel *threeLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kScreenWidth - kWidthChange(45) - kWidthChange(90), kWidthChange(30) - .5, kWidthChange(90), 1) color:newColor(213, 214, 215, 1) textColor:newColor(62, 74, 85, 1) textSize:kWidthChange(15)];
            
            [bigView addSubview:threeLabel];
            
            
            
            
            
            return bigView;
        }
        
        
        if (section == 3) {
            UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kWidthChange(60))];
            bigView.backgroundColor = newColor(255, 255, 255, 1);
            
            
            
            
            UILabel *twoLabel = [Toos setUpWithUserLabel:@"推荐商品" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(30), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(64, 73, 85, 1) textSize:kWidthChange(18)];
            [bigView addSubview:twoLabel];
            
            
            return bigView;
        }
        
        
        UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kWidthChange(60))];
        bigView.backgroundColor = newColor(255, 255, 255, 1);
        
        UILabel *oneLabel = [Toos setUpWithUserLabel:@"123456" CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth, kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(62, 74, 85, 1) textSize:kWidthChange(20)];
        
        [bigView addSubview:oneLabel];
//        if ([Toos isNotBlank:self.tempDic]) {
//
//            oneLabel.attributedText = [Toos setUpWithtext: [NSString stringWithFormat:@"全部评价(%@)",self.tempDic[@"comment_count"]] color:newColor(62, 74, 85, 1) color1:newColor(62, 74, 85, 1) font:kWidthChange(18) font1:kWidthChange(14) length:4 length1: [[NSString stringWithFormat:@"%@",self.tempDic[@"comment_count"]]length] + 2];
//        }
        
        UILabel *twoLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth - kWidthChange(30), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(62, 74, 85, 1) textSize:kWidthChange(15)];
        
        
        
//        if ([Toos isNotBlank:self.tempDic]) {
//            [[NSString stringWithFormat:@"%@%@ ",self.tempDic[@"product"][@"comment_num"],@"%"]length];
//            twoLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"%d%@ 好评率",[self.tempDic[@"product"][@"comment_num"]intValue],@"%"] color:newColor(62, 74, 85, 1) color1:newColor(62, 74, 85, 1) font:kWidthChange(12) font1:kWidthChange(12) length: [[NSString stringWithFormat:@"%@%@ ",self.tempDic[@"product"][@"comment_num"],@"%"]length] length1:3];
//        }
//
        
        
        [bigView addSubview:twoLabel];
        
        
        
        
        twoLabel.textAlignment = NSTextAlignmentRight;
        return bigView;
        
    }
   
        UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kWidthChange(60))];
        bigView.backgroundColor = newColor(255, 255, 255, 1);
        
    UIImageView *oneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box10"]];
    oneImage.frame = CGRectMake(kScreenWidth / 2 - [Toos textRect:@"商品详" textFont:[UIFont systemFontOfSize:kWidthChange(18)]]  - kWidthChange(5), kWidthChange(25), kWidthChange(10), kWidthChange(10));
    [bigView addSubview:oneImage];
        
        
        UILabel *twoLabel = [Toos setUpWithUserLabel:@"商品详情介绍" CGRect:CGRectMake(kWidthChange(0), 0, kScreenWidth , kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(64, 73, 85, 1) textSize:kWidthChange(18)];
        [bigView addSubview:twoLabel];
        twoLabel.textAlignment = NSTextAlignmentCenter;
        
    UIImageView *twoImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box11"]];
    twoImage.frame = CGRectMake(kScreenWidth / 2 + [Toos textRect:@"情介绍" textFont:[UIFont systemFontOfSize:kWidthChange(18)]]  - kWidthChange(5), kWidthChange(25), kWidthChange(10), kWidthChange(10));
    [bigView addSubview:twoImage];
        
        
        
        
        
        return bigView;
   
    
    
   
    
    
    
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
   
    if ([view isMemberOfClass:[SPXQOneHeaderView class]]) {
        ((SPXQOneHeaderView *)view).backgroundView.backgroundColor = [UIColor clearColor];
    }
}
#pragma mark---fenxaing
-(void)clickSearch:(UIButton *)sender {
    
    
    
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
