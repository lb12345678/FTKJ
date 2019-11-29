//
//  DDXQViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/25.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "DDXQViewController.h"

#import "TuiHuoView.h"

@interface DDXQViewController ()<UIScrollViewDelegate>

@property(nonatomic,retain)UIScrollView *bigScroller;

@property(nonatomic,retain)UIImageView *alphaView;

@property(nonatomic,assign)BOOL isDrag;

@property(nonatomic,retain)TuiHuoView *THView;

@end

@implementation DDXQViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    [self setUpWithBigScrollerView];
    [self setUpWithBigDic:@{}];
    
    // Do any additional setup after loading the view.
}

-(void)setUpWithBigScrollerView {
    
    self.bigScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -kStatusBarHeight, kScreenWidth, kScreenHeight - downH + kStatusBarHeight )];
    self.bigScroller.backgroundColor = newColor(241, 242, 244, 1);
    [self.view addSubview:self.bigScroller];
    self.bigScroller.delegate = self;
    UIImageView *bigView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kTopHeight )];
    bigView.image = [UIImage imageNamed:@"bg7-1"];
    bigView.alpha = 0;
    
    [self.view addSubview:bigView];
    
    self.alphaView = bigView;
    
    UIButton *leftBT = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBT setImage:[UIImage imageNamed:@"box14-1"] forState:UIControlStateNormal];
    leftBT.frame = CGRectMake(kWidthChange(15), kStatusBarHeight + kWidthChange(10), kWidthChange(25), kWidthChange(25));
    [leftBT addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBT];
    
    UILabel *nameLabel = [Toos setUpWithUserLabel:@"订单详情" CGRect:CGRectMake(kScreenWidth / 2 - kWidthChange(80), 0, kWidthChange(160), kTopHeight) color:[UIColor clearColor] textColor:[UIColor whiteColor] textSize:kWidthChange(17)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameLabel];
    
    
    
    
 
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == self.bigScroller) {
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




-(void)setUpWithBigDic:(NSDictionary *)bigDic
{
    UIImageView *oneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg5"]];
    oneImage.frame = CGRectMake(0, 0, kScreenWidth, kWidthChange(226));
    [self.bigScroller addSubview:oneImage];
    
    
    
    
    
    
    UIImageView *oneSmallImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"5订单详情待收货_02"]];
    oneSmallImage.frame = CGRectMake(kWidthChange(20), kTopHeight, kScreenWidth - kWidthChange(40), kWidthChange(142));
    [self.bigScroller addSubview:oneSmallImage];
    
    
    
    UIImageView *cateImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box32-1"]];
    cateImage.frame = CGRectMake(kWidthChange(50), kWidthChange(55), kWidthChange(15), kWidthChange(15));
    [oneSmallImage addSubview:cateImage];
    
    cateImage.contentMode = UIViewContentModeScaleAspectFill;
    
    
    
    UILabel *cateLabel = [Toos setUpWithUserLabel:@"已完成" CGRect:CGRectMake(CGRectGetMaxX(cateImage.frame) + kWidthChange(10), kWidthChange(55), kScreenWidth, kWidthChange(15)) color:[UIColor clearColor] textColor:newColor(63, 64, 65, 1) textSize:kWidthChange(15)];
    [oneSmallImage addSubview:cateLabel];
    
    
    UILabel *timeLabel = [Toos setUpWithUserLabel:@"已完成" CGRect:CGRectMake(0, kWidthChange(55), kScreenWidth  - kWidthChange(90), kWidthChange(15)) color:[UIColor clearColor] textColor:newColor(156, 157, 158, 1) textSize:kWidthChange(13)];
    [oneSmallImage addSubview:timeLabel];
    timeLabel.textAlignment = NSTextAlignmentRight;
    
    
    
    for (int i =0; i < 1; i++) {
        
        UIButton *QuXiaoBT  = [UIButton buttonWithType:UIButtonTypeCustom];
        QuXiaoBT.frame = CGRectMake(kScreenWidth - kWidthChange(180) - i * kWidthChange(90), kWidthChange(80)  , kWidthChange(90), kWidthChange(32));
        [QuXiaoBT setTitle:@"取消订单" forState:UIControlStateNormal];
        [QuXiaoBT setTitleColor:newColor(230, 22, 51, 1) forState:UIControlStateNormal];
        QuXiaoBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
        QuXiaoBT.layer.masksToBounds = YES;
        QuXiaoBT.layer.cornerRadius = kWidthChange(16);
        QuXiaoBT.layer.borderWidth = 1;
        QuXiaoBT.layer.borderColor = newColor(230, 22, 51, 1).CGColor;
        QuXiaoBT.tag = 200 + i;
        [oneSmallImage addSubview:QuXiaoBT];
        
        [QuXiaoBT addTarget:self action:@selector(clickCanCulDD:) forControlEvents:UIControlEventTouchUpInside];
        
        
     
        
        
    }
    
    
    
    
    NSArray *oneArray = @[@{@"icon":@"box29-1",@"title":@"123456",@"message":@"2019-12-16"},@{@"icon":@"box30-1",@"title":@"123456",@"message":@"2019-12-16"}];
    for (int i = 0; i < 2; i++) {
        UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, i * kWidthChange(70) + CGRectGetMaxY(oneImage.frame), kScreenWidth, kWidthChange(60))];
        oneView.backgroundColor = [UIColor whiteColor];
        [self.bigScroller addSubview:oneView];
        
        UIImageView *twoImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[oneArray objectAtIndex:i][@"icon"]]];
        twoImage.frame = CGRectMake(kWidthChange(20), kWidthChange(30) - kWidthChange(15), kWidthChange(30), kWidthChange(30));
        [oneView addSubview:twoImage];
        
        UILabel *nameLabel = [Toos setUpWithUserLabel:[oneArray objectAtIndex:i][@"title"] CGRect:CGRectMake(CGRectGetMaxX(twoImage.frame) + kWidthChange(15), kWidthChange(10), kScreenWidth - CGRectGetMaxX(twoImage.frame) - kWidthChange(30), kWidthChange(15)) color:[UIColor clearColor] textColor:newColor(92, 93, 94, 1) textSize:kWidthChange(16)];
        [oneView addSubview:nameLabel];
           UILabel *messageLabel = [Toos setUpWithUserLabel:[oneArray objectAtIndex:i][@"message"] CGRect:CGRectMake(CGRectGetMaxX(twoImage.frame) + kWidthChange(15), kWidthChange(10) + CGRectGetMaxY(nameLabel.frame), kScreenWidth - CGRectGetMaxX(twoImage.frame) - kWidthChange(30), kWidthChange(15)) color:[UIColor clearColor] textColor:newColor(172, 173, 174, 1) textSize:kWidthChange(13)];
        [oneView addSubview:messageLabel];
        
    }
    
    
    UIView *twoView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(oneImage.frame) + oneArray.count * kWidthChange(60) + (oneArray.count - 1) * kWidthChange(10) + kWidthChange(10), kScreenWidth, kWidthChange(220))];
    twoView.backgroundColor = [UIColor whiteColor];
    [self.bigScroller addSubview:twoView];
    
//    [bigDic[@"product"]count]
    
    
    
    for (int i = 0; i < oneArray.count; i++) {
        NSDictionary *newDic = [oneArray objectAtIndex:i];
        UIButton *smallView = [[UIButton alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(20) + i * kWidthChange(80) + i * kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(80))];
        smallView.backgroundColor = newColor(255, 255, 255, 1);
        smallView.layer.masksToBounds = YES;
        smallView.layer.cornerRadius = 5;
        [twoView addSubview:smallView];
        [smallView setTitle:[NSString stringWithFormat:@"%@", [newDic objectForKey:@"id"]] forState:UIControlStateNormal];
        [smallView setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        
        
        
        [smallView addTarget:self action:@selector(clickTapSP:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(0), kWidthChange(0), kWidthChange(80), kWidthChange(80))];
        bigImage.backgroundColor = [UIColor redColor];
        [smallView addSubview:bigImage];
        bigImage.layer.masksToBounds = YES;
        bigImage.layer.cornerRadius = 5;
        [bigImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",newDic[@"img"]]]];
        UILabel *nameLabel  = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",newDic[@"title"]] CGRect:CGRectMake(CGRectGetMaxX(bigImage.frame) + kWidthChange(15),0 , kScreenWidth - CGRectGetMaxX(bigImage.frame) - kWidthChange(40), kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(117, 117, 118, 1) textSize:kWidthChange(16)];
        [smallView addSubview:nameLabel];
        nameLabel.userInteractionEnabled = NO;
        
        
        UILabel *guiGeLabel  = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",newDic[@"title"]] CGRect:CGRectMake(CGRectGetMaxX(bigImage.frame) + kWidthChange(15),CGRectGetMaxY(nameLabel.frame) , kScreenWidth - CGRectGetMaxX(bigImage.frame) - kWidthChange(40), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(163, 164, 165, 1) textSize:kWidthChange(14)];
        [smallView addSubview:guiGeLabel];
        guiGeLabel.userInteractionEnabled = NO;
        
        
        
        
        
        UILabel *moneyLabel  = [Toos setUpWithUserLabel:@"¥ 129" CGRect:CGRectMake(CGRectGetMaxX(bigImage.frame) + kWidthChange(15),kWidthChange(60) , kScreenWidth - CGRectGetMaxX(bigImage.frame) - kWidthChange(25), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(57, 58, 59, 1) textSize:kWidthChange(14)];
        [smallView addSubview:moneyLabel];
        moneyLabel.userInteractionEnabled = NO;
      
        
        UILabel *XiaoLabel  = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"X %@",newDic[@"num"]] CGRect:CGRectMake( kScreenWidth - kWidthChange(40) - kWidthChange(90),kWidthChange(45) , kWidthChange(90), kWidthChange(35)) color:[UIColor clearColor] textColor:newColor(143, 144, 145, 1) textSize:kWidthChange(15)];
        XiaoLabel.textAlignment = NSTextAlignmentCenter;
        [smallView addSubview:XiaoLabel];
        [XiaoLabel rounded:kWidthChange(17.5) width:1 color:newColor(143, 144, 145, 1)];
        [XiaoLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickSQSH:)]];
        
    }
    
    
    UIView *threeView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(twoView.frame) +  kWidthChange(10), kScreenWidth, kWidthChange(200))];
    threeView.backgroundColor = [UIColor whiteColor];
    [self.bigScroller addSubview:threeView];
    
    
    for (int i = 0; i < 4; i++) {
        
        
        UILabel *oneLabel = [Toos setUpWithUserLabel:@"总金额" CGRect:CGRectMake(kWidthChange(20), i * kWidthChange(50), kScreenWidth - kWidthChange(40), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(160, 162, 163, 1) textSize:kWidthChange(14)];
        [threeView addSubview:oneLabel];
           UILabel *twoLabel = [Toos setUpWithUserLabel:@"免邮" CGRect:CGRectMake(kWidthChange(20), i * kWidthChange(50), kScreenWidth - kWidthChange(40), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(36, 37, 38, 1) textSize:kWidthChange(16)];
        twoLabel.textAlignment = NSTextAlignmentRight;
           [threeView addSubview:twoLabel];
        
    }
    
    UIView *fourView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(threeView.frame) +  kWidthChange(10), kScreenWidth, kWidthChange(300))];
    fourView.backgroundColor = [UIColor whiteColor];
    [self.bigScroller addSubview:fourView];
    
    self.bigScroller.contentSize = CGSizeMake(0, CGRectGetMaxY(fourView.frame));
    for (int i = 0; i < 6; i++) {
        
        
        UILabel *oneLabel = [Toos setUpWithUserLabel:@"总金额" CGRect:CGRectMake(kWidthChange(20), i * kWidthChange(50), kScreenWidth - kWidthChange(40), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(160, 162, 163, 1) textSize:kWidthChange(14)];
        [fourView addSubview:oneLabel];
        UILabel *twoLabel = [Toos setUpWithUserLabel:@"免邮" CGRect:CGRectMake(kWidthChange(20), i * kWidthChange(50), kScreenWidth - kWidthChange(40), kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(36, 37, 38, 1) textSize:kWidthChange(16)];
        twoLabel.textAlignment = NSTextAlignmentRight;
        [fourView addSubview:twoLabel];
        
    }
    
    
}
#pragma mark--点击商品
-(void)clickTapSP:(UIButton *)sender {
    
    
}

#pragma mark--取消订单等
-(void)clickCanCulDD:(UIButton *)sender {
    
    
}

#pragma mark---申请售后
-(void)clickSQSH:(UITapGestureRecognizer *)sender {
    if (self.THView) {
        self.THView.hidden = NO;
    }else {
        self.THView = [[TuiHuoView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.THView.viewController = self;
        [[UIApplication sharedApplication].keyWindow addSubview:self.THView];
        
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
