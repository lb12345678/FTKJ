//
//  MyViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyViewController.h"
#import "MyViewCell.h"
#import "IXAttributeTapLabel.h"
#import "GRZLViewController.h"
#import "ZHSZViewController.h"
#import "MyMoneyViewController.h"
#import "MyYouHuiViewController.h"
#import "SHDZViewController.h"
#import "MyLoveViewController.h"
#import "MyPLViewController.h"
#import "LXKFViewController.h"
#import "BigMessageViewController.h"
#import "MyTeamViewController.h"
#import "MyOrderViewController.h"
#import "GWCViewController.h"
#import "FXEWMViewController.h"
#import "DDXQViewController.h"
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)NSMutableArray *dataArray;

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,assign)BOOL isDrag;

@end

@implementation MyViewController

-(NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    
    return _dataArray;
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
    
    self.navigationItem.title = @"个人中心";
    
    [self setUpWithDataArray];
    [self setUpWithBigView];
    [self setUpWithHeaderView:@{}];
    // Do any additional setup after loading the view.
}

-(void)setUpWithDataArray {
    NSDictionary *newDic = @{@"title":@"预约管理 (汽修店可见)",@"icon":@"box11-1",@"viewControll":[[MyOrderViewController alloc]init],@"FromStr":@"1"};
    
    NSDictionary *newDic1 = @{@"title":@"购物车",@"icon":@"box12-1",@"viewControll":[[GWCViewController alloc]init]};
    NSDictionary *newDic2 = @{@"title":@"保养订单",@"icon":@"box13-1"};
    
    NSDictionary *newDic3 = @{@"title":@"我的团队",@"icon":@"box14",@"viewControll":[[MyTeamViewController alloc]init]};
    NSDictionary *newDic4 = @{@"title":@"地址管理",@"icon":@"box15-1",@"viewControll":[[SHDZViewController alloc]init]};
    NSDictionary *newDic5 = @{@"title":@"我的收藏",@"icon":@"box16-1",@"viewControll":[[MyLoveViewController alloc]init]};
    NSDictionary *newDic6 = @{@"title":@"我的评价",@"icon":@"box17-1",@"viewControll":[[MyPLViewController alloc]init]};
    
    NSDictionary *newDic7 = @{@"title":@"联系客服",@"icon":@"box18-1",@"viewControll":[[LXKFViewController alloc]init]};
    
    self.dataArray = [@[newDic,newDic1,newDic2,newDic3,newDic4,newDic5,newDic6,newDic7]mutableCopy];
    
    
}




-(void)setUpWithBigView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -kStatusBarHeight, kScreenWidth, kScreenHeight - kTabBarHeight + kStatusBarHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(480))];
    self.bigView.backgroundColor = [UIColor whiteColor];
    
    self.tableView.tableHeaderView = self.bigView;
    
    
    UIImageView *bigView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kTopHeight )];
    bigView.image = [UIImage imageNamed:@"bg7-1"];
    bigView.alpha = 0;
    
    [self.view addSubview:bigView];
    
    self.alphaView = bigView;
    
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
-(void)setUpWithHeaderView:(NSDictionary *)newDic {
    
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    UIImageView *bigImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg3"]];
    bigImage.frame = CGRectMake(0, 0, kScreenWidth, kWidthChange(270));
    [self.bigView addSubview:bigImage];
    
    
    
    UIButton *leftBT = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBT.frame = CGRectMake(kWidthChange(20), kStatusBarHeight + kWidthChange(20), kWidthChange(25), kWidthChange(20));
    [leftBT setImage:[UIImage imageNamed:@"box1-1"] forState:UIControlStateNormal];
    
    [self.bigView addSubview:leftBT];
    
    [leftBT addTarget:self action:@selector(clickLeftBT:) forControlEvents:UIControlEventTouchUpInside];
    
 
    UIImageView *headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(leftBT.frame) + kWidthChange(35), kWidthChange(58), kWidthChange(58))];
    [headerImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_URlImage,newDic[@"headimg"]]] placeholderImage:[UIImage imageNamed:@"icon"]];
    
    
//    if ([Toos isNotBlank:newDic[@"email"]]) {
//        [UserModel shared].email = [NSString stringWithFormat:@"%@",newDic[@"email"]];
//    }else {
//        [UserModel shared].email = @"";
//    }
//
    
    headerImage.userInteractionEnabled = YES;
    [headerImage addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHeader:)]];
    
    
    [self.bigView addSubview:headerImage];
    headerImage.layer.masksToBounds = YES;
    headerImage.layer.cornerRadius = kWidthChange(58) / 2;
    
    headerImage.layer.borderWidth = 2;
    headerImage.layer.borderColor = [UIColor whiteColor].CGColor;
    NSString *name;
    if ([Toos isBlank:newDic[@"username"]]) {
        name = @"暂无昵称";
        [UserModel shared].nickname = @"";
    }else {
        name = [NSString stringWithFormat:@"%@",newDic[@"username"]];
        [UserModel shared].nickname = name;
    }
    
    
    [UserModel shared].icon = [NSString stringWithFormat:@"%@%@",APP_URlImage,newDic[@"headimg"]];
    [UserModel shared].litpic = [NSString stringWithFormat:@"%@",newDic[@"icon"]];
    
    
    if ([Toos isBlank:newDic[@"no_pass"]]) {
        [UserModel shared].passWord = @"";
    }else {
        [UserModel shared].passWord = [NSString stringWithFormat:@"%@",newDic[@"no_pass"]];
        
    }
    
    
    if ([Toos isNotBlank:newDic[@"pay_pass"]]) {
        [UserModel shared].ZFPassWord = [NSString stringWithFormat:@"%@",newDic[@"pay_pass"]];
        
    }
    
    
    [[UserModel shared] saveUser];
    
    UILabel *nameLabel = [Toos setUpWithUserLabel:name CGRect:CGRectMake(CGRectGetMaxX(headerImage.frame) + kWidthChange(20), CGRectGetMaxY(leftBT.frame) + kWidthChange(35), [Toos textRect:name textFont:[UIFont systemFontOfSize:kWidthChange(17)]], kWidthChange(58)) color:[UIColor clearColor] textColor:[UIColor whiteColor] textSize:kWidthChange(17)];
    [self.bigView addSubview:nameLabel];
    
    
    UILabel *YQLabel = [Toos setUpWithUserLabel:@"邀请赚现金" CGRect:CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(100), CGRectGetMaxY(leftBT.frame) + kWidthChange(35) + kWidthChange(12), kWidthChange(100), kWidthChange(34)) color:newColor(252, 144, 20, 1) textColor:[UIColor whiteColor] textSize:kWidthChange(15)];
    [self.bigView addSubview:YQLabel];
    YQLabel.layer.masksToBounds = YES;
    YQLabel.layer.cornerRadius = kWidthChange(17);
    YQLabel.textAlignment = NSTextAlignmentCenter;
    [YQLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickYaoQing:)]];
    
    UIButton *messageBT = [UIButton buttonWithType:UIButtonTypeCustom];
    messageBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(25), kStatusBarHeight + kWidthChange(20) , kWidthChange(25), kWidthChange(25));
    [messageBT setImage:[UIImage imageNamed:@"box2-1"] forState:UIControlStateNormal];
    [self.bigView addSubview:messageBT];
    [messageBT addTarget:self action:@selector(clickMessage:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *messageLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kScreenWidth - kWidthChange(20) - kWidthChange(5),  kStatusBarHeight + kWidthChange(15)  , kWidthChange(10), kWidthChange(10)) color:RedColor textColor:RedColor textSize:14];
    messageLabel.layer.masksToBounds = YES;
    messageLabel.layer.cornerRadius = kWidthChange(5);
    [self.bigView addSubview:messageLabel];
    messageLabel.hidden = YES;
    if ([newDic[@"no_read"]intValue] == 0) {
        messageLabel.hidden = YES;
    }else {
        messageLabel.hidden = NO;
    }
    
    
    
    UIView *twoView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(headerImage.frame) + kWidthChange(30), kScreenWidth - kWidthChange(40), kWidthChange(138))];
    twoView.backgroundColor = [UIColor whiteColor];
//    twoView.layer.masksToBounds = YES;
    twoView.layer.cornerRadius = kWidthChange(10);
    [self.bigView addSubview:twoView];
    [twoView shadow:newColor(230, 231, 233, 1) opacity:2 radius:5 offset:CGSizeMake(0, 0)];
//    twoView.layer.borderColor = newColor(232, 234, 235, 1).CGColor;
//    twoView.layer.borderWidth = 2;
    
    
    NSArray *imageArray = @[@"box4-1",@"box5-1",@"box6-1",@"box7-1",@"box8-1"];
    NSArray *titleArray = @[@"待支付",@"待发货",@"待收货",@"待评价",@"已完成"];
    
    
    
    UILabel *DDLabel = [Toos setUpWithUserLabel:@"我的订单" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth, kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(42, 43, 44, 1) textSize:kWidthChange(16)];
    
    DDLabel.font = [UIFont systemFontOfSize:kWidthChange(16) weight:UIFontWeightBold];
    [twoView addSubview:DDLabel];
    
    
    UIButton *allDDBT  = [UIButton buttonWithType:UIButtonTypeCustom];
            [allDDBT setTitle:@"全部订单 " forState:UIControlStateNormal];
            [allDDBT setTitleColor:newColor(130, 131, 133, 1) forState:UIControlStateNormal];
            allDDBT.frame = CGRectMake(kScreenWidth - kWidthChange(60) - [Toos textRect:@"全部订单 " textFont:[UIFont systemFontOfSize:kWidthChange(13)]] - kWidthChange(12), 0,  [Toos textRect:@"全部订单 " textFont:[UIFont systemFontOfSize:kWidthChange(13)]] + kWidthChange(12), kWidthChange(50));
            allDDBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
            [allDDBT setImage:[UIImage imageNamed:@"box21"] forState:UIControlStateNormal];
            [allDDBT layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:2 weight:2];
          [twoView addSubview:allDDBT];
    
    
    
    
    for (int i = 0; i < imageArray.count; i++) {
        
        UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake((kScreenWidth - kWidthChange(40)) / 5 * i, CGRectGetMaxY(allDDBT.frame) + kWidthChange(15) , (kScreenWidth - kWidthChange(40)) / 5, kWidthChange(73))];
        smallView.backgroundColor = [UIColor clearColor];
        UIImageView *SmallImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[imageArray objectAtIndex:i]]];
        SmallImage.frame = CGRectMake((kScreenWidth - kWidthChange(40)) / 5 / 2 - kWidthChange(11), kWidthChange(10), kWidthChange(22), kWidthChange(24));
        [smallView addSubview:SmallImage];
        SmallImage.contentMode = UIViewContentModeScaleAspectFill;
        smallView.tag = 100 + i;
        UILabel *smallLabel = [Toos setUpWithUserLabel:[titleArray objectAtIndex:i] CGRect:CGRectMake(0,CGRectGetMaxY(SmallImage.frame), (kScreenWidth - kWidthChange(40)) / 5, kWidthChange(25)) color:[UIColor clearColor] textColor:newColor(57, 58, 59, 1) textSize:kWidthChange(14)];
        smallLabel.textAlignment = NSTextAlignmentCenter;
        [smallView addSubview:smallLabel];
        smallLabel.userInteractionEnabled = NO;
        [twoView addSubview:smallView];
        
        
      
    
        UILabel *countLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake((kScreenWidth - kWidthChange(40)) / 5 / 2 - kWidthChange(11) + kWidthChange(15), kWidthChange(5) , kWidthChange(15), kWidthChange(15)) color:newColor(250, 163, 0, 1) textColor:[UIColor whiteColor] textSize:kWidthChange(12)];
        countLabel.hidden = YES;
        countLabel.layer.masksToBounds = YES;
        countLabel.layer.cornerRadius = kWidthChange(7.5);
        countLabel.textAlignment = NSTextAlignmentCenter;
        if ( i == 3) {
            countLabel.hidden = YES;
        }
        
        
        
        if (i == 0 && [Toos isNotBlank:newDic[@"nopay_num"]] &&  [newDic[@"nopay_num"]intValue] != 0
            ) {
            countLabel.hidden = NO;
            countLabel.text = [NSString stringWithFormat:@"%@",newDic[@"nopay_num"]];
        }
        if (i == 1 && [Toos isNotBlank:newDic[@"nosend_num"]] &&  [newDic[@"nosend_num"]intValue] != 0
            ) {
            countLabel.hidden = NO;
            countLabel.text = [NSString stringWithFormat:@"%@",newDic[@"nosend_num"]];
        }
        
        if (i == 2 && [Toos isNotBlank:newDic[@"nopl_num"]] &&  [newDic[@"nopl_num"]intValue] != 0
            ) {
            countLabel.hidden = NO;
            countLabel.text = [NSString stringWithFormat:@"%@",newDic[@"nopl_num"]];
        }
        [smallView addSubview:countLabel];
        
    }
    
   
    
    UIView *threeView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(twoView.frame) + kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(108))];
    threeView.backgroundColor = [UIColor whiteColor];
   
    threeView.layer.cornerRadius = kWidthChange(10);
    [self.bigView addSubview:threeView];
    
  
     [threeView shadow:newColor(230, 231, 233, 1) opacity:1 radius:5 offset:CGSizeMake(0, 0)];
    
    
    
    UILabel *MoneyLabel = [Toos setUpWithUserLabel:@"我的钱包" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth, kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(42, 43, 44, 1) textSize:kWidthChange(16)];
    
    MoneyLabel.font = [UIFont systemFontOfSize:kWidthChange(16) weight:UIFontWeightBold];
    [threeView addSubview:MoneyLabel];
    
    
    UIButton *MoneyBT  = [UIButton buttonWithType:UIButtonTypeCustom];
    [MoneyBT setTitle:@"查看钱包 " forState:UIControlStateNormal];
    [MoneyBT setTitleColor:newColor(130, 131, 133, 1) forState:UIControlStateNormal];
    MoneyBT.frame = CGRectMake(kScreenWidth - kWidthChange(60) - [Toos textRect:@"全部订单 " textFont:[UIFont systemFontOfSize:kWidthChange(13)]] - kWidthChange(12), 0,  [Toos textRect:@"全部订单 " textFont:[UIFont systemFontOfSize:kWidthChange(13)]] + kWidthChange(12), kWidthChange(60));
    MoneyBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
    [MoneyBT setImage:[UIImage imageNamed:@"box21"] forState:UIControlStateNormal];
    [MoneyBT layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:2 weight:2];
    [threeView addSubview:MoneyBT];
    
    [MoneyBT addTarget:self action:@selector(clickMoneyBT:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *bigmessageStr = @"¥ 18325.52 余额";
    
   

    IXAttributeTapLabel * MyMoneyLabel = [[IXAttributeTapLabel alloc] initWithFrame:CGRectMake(kWidthChange(20) ,CGRectGetMaxY(MoneyBT.frame) - kWidthChange(10), kScreenWidth - kWidthChange(100) , kWidthChange(48))];
    MyMoneyLabel.font = [UIFont systemFontOfSize:kWidthChange(17)];
    MyMoneyLabel.backgroundColor = [UIColor clearColor];
   
    //文本点击回调
    MyMoneyLabel.tapBlock = ^(NSString *string) {
        
        self.hidesBottomBarWhenPushed = YES;
        MyMoneyViewController *YouHui = [[MyMoneyViewController alloc]init];
        [self.navigationController pushViewController:YouHui animated:YES];
        self.hidesBottomBarWhenPushed = NO;
        
        NSLog(@" -- %@ --",string);
    };
    
    //设置需要点击的字符串，并配置此字符串的样式及位置
    IXAttributeModel    * model = [IXAttributeModel new];
    model.range = [bigmessageStr rangeOfString:@"18325.52"];
    model.string = @"18325.52";
    //            model.alertImg = [UIImage imageNamed:@"alert"];
    
    
   
//    newColor(251, 161, 79, 1)
    model.attributeDic = @{NSForegroundColorAttributeName :  newColor(250, 130, 45, 1), NSFontAttributeName: [UIFont systemFontOfSize:kWidthChange(20) weight:UIFontWeightBold]};
    
    IXAttributeModel    * model1 = [IXAttributeModel new];
    model1.range = [bigmessageStr rangeOfString:@"余额"];
    model1.string = @"余额";
    model1.attributeDic = @{NSForegroundColorAttributeName : newColor(131, 132, 133, 1), NSFontAttributeName: [UIFont systemFontOfSize:kWidthChange(13)]};
    
    //label内容赋值
    [MyMoneyLabel setText:bigmessageStr attributes:@{NSForegroundColorAttributeName:newColor(251, 161, 79, 1),NSFontAttributeName:[UIFont systemFontOfSize:kWidthChange(13)]}
           tapStringArray:@[model,model1]];
    
    
    [threeView addSubview:MyMoneyLabel];

    
    
    IXAttributeTapLabel * YHLabel = [[IXAttributeTapLabel alloc] initWithFrame:CGRectMake(kScreenWidth - kWidthChange(60) - [Toos textRect:@"3 优惠券" textFont:[UIFont systemFontOfSize:kWidthChange(20) weight:UIFontWeightLight]] ,CGRectGetMaxY(MoneyBT.frame) - kWidthChange(10),[Toos textRect:@"3 优惠券" textFont:[UIFont systemFontOfSize:kWidthChange(20) weight:UIFontWeightLight]], kWidthChange(48))];
    YHLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
    YHLabel.backgroundColor = [UIColor clearColor];
    YHLabel.textAlignment = NSTextAlignmentRight;
    //文本点击回调
    YHLabel.tapBlock = ^(NSString *string) {
        self.hidesBottomBarWhenPushed = YES;
        MyYouHuiViewController *YouHui = [[MyYouHuiViewController alloc]init];
        [self.navigationController pushViewController:YouHui animated:YES];
        self.hidesBottomBarWhenPushed = NO;
        
        
        NSLog(@" -- %@ --",string);
    };
    
    //设置需要点击的字符串，并配置此字符串的样式及位置
    IXAttributeModel    * YHModel = [IXAttributeModel new];
    YHModel.range = [@"3 优惠券" rangeOfString:@" 优惠券"];
    YHModel.string = @" 优惠券";
    //            model.alertImg = [UIImage imageNamed:@"alert"];
    YHModel.attributeDic = @{NSForegroundColorAttributeName : newColor(128, 129, 130, 1), NSFontAttributeName: [UIFont systemFontOfSize:kWidthChange(13)]};
    
  
    
    //label内容赋值
    [YHLabel setText:@"3 优惠券" attributes:@{NSForegroundColorAttributeName:newColor(250, 130, 45, 1),NSFontAttributeName:[UIFont systemFontOfSize:kWidthChange(20) weight:UIFontWeightLight]}
           tapStringArray:@[YHModel]];
    
    
    [threeView addSubview:YHLabel];

    
    
    UIButton *YHImageBT = [UIButton buttonWithType:UIButtonTypeCustom];
    YHImageBT.frame = CGRectMake(kScreenWidth - kWidthChange(60) - [Toos textRect:@"3 优惠券" textFont:[UIFont systemFontOfSize:kWidthChange(20) weight:UIFontWeightLight]] , CGRectGetMaxY(MoneyBT.frame) - kWidthChange(10) + kWidthChange(48) / 2 - kWidthChange(6), kWidthChange(15), kWidthChange(12));
    [YHImageBT setImage:[UIImage imageNamed:@"box9-1"] forState:UIControlStateNormal];
    [threeView addSubview:YHImageBT];
 
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   
        return self.dataArray.count;
  
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kWidthChange(60);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
  
    
    
   
    
    [cell setUpWithNewDic:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kWidthChange(50);
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(50))];
    bigView.backgroundColor = newColor(255, 255, 255, 1);
    
    
    UILabel *nameLabel =[Toos setUpWithUserLabel:@"我的服务" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(18)];
    nameLabel.font = [UIFont systemFontOfSize:kWidthChange(17) weight:UIFontWeightBold];
    [bigView addSubview:nameLabel];
    
    
    
    
    
    return bigView;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.hidesBottomBarWhenPushed = YES;
    
    if (![Toos isLogin:self.view]) {
        
      
        
        
        return;
    }
    
    [DataBaseManager sharedFMDBManager].order_str = @"1";
    
    
      [self.navigationController pushViewController:[self.dataArray objectAtIndex:indexPath.row][@"viewControll"] animated:YES];
   
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark---查看消息
-(void)clickMessage:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    BigMessageViewController *bigMessage = [[BigMessageViewController alloc]init];
    [self.navigationController pushViewController:bigMessage animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
    
}

#pragma mark---点击头像
-(void)clickHeader:(UITapGestureRecognizer *)sender {
//    self.hidesBottomBarWhenPushed = YES;
//    DDXQViewController *GRZLView = [[DDXQViewController alloc]init];
//    [self.navigationController pushViewController:GRZLView animated:YES];
//    self.hidesBottomBarWhenPushed = NO;
    
    self.hidesBottomBarWhenPushed = YES;
    GRZLViewController *GRZLView = [[GRZLViewController alloc]init];
    [self.navigationController pushViewController:GRZLView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark---设置
-(void)clickLeftBT:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    ZHSZViewController *GRZLView = [[ZHSZViewController alloc]init];
    [self.navigationController pushViewController:GRZLView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
    
}
#pragma mark---查看钱包
-(void)clickMoneyBT:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    MyMoneyViewController *MyMoney = [[MyMoneyViewController alloc]init];
    [self.navigationController pushViewController:MyMoney animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
    
}
#pragma mark---邀请
-(void)clickYaoQing:(UITapGestureRecognizer *)sender {
    self.hidesBottomBarWhenPushed = YES;
    FXEWMViewController *FXEW = [[FXEWMViewController alloc]init];
    [self.navigationController pushViewController:FXEW animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
}
@end
