//
//  SPXQOneHeaderView.m
//  JZGL
//
//  Created by ios on 2019/8/6.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "SPXQOneHeaderView.h"
#import "MDLBViewController.h"
#import "LYHView.h"
#import "GuiGeView.h"
@interface SPXQOneHeaderView()<SDCycleScrollViewDelegate,UITextFieldDelegate>

@property(nonatomic,retain)LYHView *YHView;

@property(nonatomic,retain)GuiGeView *GGView;

@end






@implementation SPXQOneHeaderView

-(SDCycleScrollView *)oneScrollerView {
    if (_oneScrollerView == nil) {
        self.oneScrollerView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth)];
        self.oneScrollerView.backgroundColor = [UIColor whiteColor];
        self.oneScrollerView.delegate = self;
    }
    
    return _oneScrollerView;
}



-(UILabel *)pageLabel {
    if (_pageLabel == nil) {
        self.pageLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kScreenWidth - kWidthChange(15) - kWidthChange(50), kScreenWidth - kWidthChange(15) - kWidthChange(25), kWidthChange(50), kWidthChange(25)) color:newColor(134, 135, 136, 1) textColor:[UIColor whiteColor] textSize:kWidthChange(12)];
        self.pageLabel.layer.masksToBounds = YES;
        self.pageLabel.layer.cornerRadius = kWidthChange(12.5);
        self.pageLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _pageLabel;
}

-(UIView *)oneView {
    if (_oneView == nil) {
        self.oneView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(15), CGRectGetMaxY(self.oneScrollerView.frame) + kWidthChange(15), kScreenWidth - kWidthChange(30), kWidthChange(162))];
        self.oneView.backgroundColor =[UIColor whiteColor];
//        self.oneView.layer.masksToBounds = YES;
        self.oneView.layer.cornerRadius = kWidthChange(10);
         [self.oneView shadow:newColor(230, 231, 232, 1) opacity:1 radius:5 offset:CGSizeMake(0, 0)];
    }
    return _oneView;
}
-(UIView *)TwoView {
    if (_TwoView == nil) {
        self.TwoView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(15), CGRectGetMaxY(self.oneView.frame) + kWidthChange(15), kScreenWidth - kWidthChange(30), kWidthChange(60))];
        self.TwoView.backgroundColor =newColor(255, 255, 255, 1);
//        self.TwoView.layer.masksToBounds = YES;
        self.TwoView.layer.cornerRadius = kWidthChange(10);
        
        
         [self.TwoView shadow:newColor(230, 231, 232, 1) opacity:1 radius:5 offset:CGSizeMake(0, 0)];
    }
    return _TwoView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.oneScrollerView];
        [self.contentView addSubview:self.oneView];
        [self.contentView addSubview:self.pageLabel];
        [self.contentView addSubview:self.TwoView];
    }
    return self;
}

-(void)setUpWithBigView:(NSDictionary *)tempDic  bigType:(NSString *)bigType{
    self.bigDic = tempDic;
    [self.oneView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.TwoView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if ([tempDic[@"is_collect"]intValue] == 1) {
        self.isLove = YES;
    }
    
    
    
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:1];
    
    if ([Toos isNotBlank:tempDic[@"icon_img"]]) {
        for (NSString *newStr in tempDic[@"icon_img"]) {
            [imageArray addObject:[NSString stringWithFormat:@"%@",newStr]];
        }
    }
    
    self.oneScrollerView.imageURLStringsGroup = imageArray;
   
     self.pageLabel.text = [NSString stringWithFormat:@"1/%ld",[self.bigDic[@"icon_img"]count]];
    
    UILabel *oneLabel = [Toos setUpWithUserLabel:@"¥400.00" CGRect:CGRectMake(kWidthChange(8), kWidthChange(12), [Toos textRect:[NSString stringWithFormat:@"¥%@",tempDic[@"price"]] textFont:[UIFont systemFontOfSize:kWidthChange(18)]], kWidthChange(25)) color:[UIColor clearColor] textColor:newColor(65, 78, 135, 1) textSize:kWidthChange(18)];
    oneLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"¥%@",tempDic[@"price"]] color:newColor(65, 78, 135, 1) color1:newColor(65, 78, 135, 1) font:kWidthChange(12) font1:kWidthChange(17) length:1 length1:[[NSString stringWithFormat:@"%@",tempDic[@"price"]]length]];
      [self.oneView addSubview:oneLabel];
   
    
    UILabel *twoLabel = [Toos setUpWithUserLabel:@"¥400.00" CGRect:CGRectMake(CGRectGetMaxX(oneLabel.frame) + kWidthChange(12), kWidthChange(12), [Toos textRect:@"¥400.00" textFont:[UIFont systemFontOfSize:kWidthChange(12)]], kWidthChange(25)) color:[UIColor clearColor] textColor:newColor(176, 185, 194, 1) textSize:kWidthChange(12)];
    
    
    [self.oneView addSubview:twoLabel];
    NSMutableAttributedString *attritu = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",tempDic[@"orig_price"]]];
    [attritu addAttributes:@{
                             NSStrikethroughStyleAttributeName:@(NSUnderlineStyleThick),
                             NSForegroundColorAttributeName:
                                 [UIColor lightGrayColor],
                             NSBaselineOffsetAttributeName:
                                 @(0),
                             NSFontAttributeName: [UIFont systemFontOfSize:kWidthChange(12)]
                             } range:[[NSString stringWithFormat:@"¥%@",tempDic[@"orig_price"]] rangeOfString:[NSString stringWithFormat:@"¥%@",tempDic[@"orig_price"]]]];
    twoLabel.attributedText = attritu;
    
    
    UIButton *LQBT  = [UIButton buttonWithType:UIButtonTypeCustom];
            [LQBT setTitle:@"领券 " forState:UIControlStateNormal];
            [LQBT setTitleColor:newColor(130, 131, 133, 1) forState:UIControlStateNormal];
            LQBT.frame = CGRectMake(kScreenWidth - kWidthChange(38) - [Toos textRect:@"领券 " textFont:[UIFont systemFontOfSize:kWidthChange(13)]] - kWidthChange(12), 0,  [Toos textRect:@"领券 " textFont:[UIFont systemFontOfSize:kWidthChange(13)]] + kWidthChange(12), kWidthChange(45));
            LQBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
            [LQBT setImage:[UIImage imageNamed:@"box21"] forState:UIControlStateNormal];
            [LQBT layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:2 weight:2];
            
    
    [self.oneView addSubview:LQBT];
    [LQBT addTarget:self action:@selector(clickLQYHQ:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UILabel *threeLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",tempDic[@"title"]] CGRect:CGRectMake(kWidthChange(8), CGRectGetMaxY(twoLabel.frame) + kWidthChange(8), kScreenWidth - kWidthChange(16) - kWidthChange(35), [Toos textRectWithHeight:[NSString stringWithFormat:@"%@",tempDic[@"title"]] textFont:[UIFont systemFontOfSize:kWidthChange(15)] weight:kScreenWidth - kWidthChange(16) - kWidthChange(35)]) color:[UIColor clearColor] textColor:newColor(120, 126, 133, 1) textSize:kWidthChange(15)];
    
    threeLabel.numberOfLines = 0;
    [self.oneView addSubview:threeLabel];
    
   
    
    
    
    
    
    
    UILabel *fourLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",tempDic[@"descript"]] CGRect:CGRectMake(kWidthChange(8), CGRectGetMaxY(threeLabel.frame) + kWidthChange(10), kScreenWidth - kWidthChange(30) - kWidthChange(16) ,  [Toos textRectWithHeight:[NSString stringWithFormat:@"%@",tempDic[@"descript"]] textFont:[UIFont systemFontOfSize:kWidthChange(12)] weight:kScreenWidth - kWidthChange(16) - kWidthChange(35)]) color:[UIColor clearColor] textColor:newColor(195, 201, 207, 1) textSize:kWidthChange(12)];
    
    fourLabel.numberOfLines = 0;
    [self.oneView addSubview:fourLabel];
    
    if ([bigType intValue] == 1) {
        
        UILabel *fiveLabel = [Toos setUpWithUserLabel:@"免运费" CGRect:CGRectMake(kWidthChange(8), CGRectGetMaxY(fourLabel.frame) , kScreenWidth - kWidthChange(30) - kWidthChange(16) ,  kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(195, 201, 207, 1) textSize:kWidthChange(14)];
        
        fiveLabel.numberOfLines = 0;
        [self.oneView addSubview:fiveLabel];
        
        
        UILabel *sixLabel = [Toos setUpWithUserLabel:@"95%好评率" CGRect:CGRectMake(kWidthChange(8), CGRectGetMaxY(fourLabel.frame) , kScreenWidth - kWidthChange(30) - kWidthChange(16) ,  kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(195, 201, 207, 1) textSize:kWidthChange(13)];
        
        sixLabel.textAlignment = NSTextAlignmentRight;
        [self.oneView addSubview:sixLabel];
    }else {
    
    CGFloat padding = kWidthChange(20);
    
    CGFloat titBtnX =  kWidthChange(8);
    CGFloat titBtnY = CGRectGetMaxY(fourLabel.frame);
    CGFloat titBtnH = kWidthChange(30);
    CGFloat h = 0;
    for (int i = 0; i < 3; i++) {
        
        
        UIButton *newBT = [UIButton buttonWithType:UIButtonTypeCustom];
        newBT.frame = CGRectMake(0, titBtnY, 100, titBtnH);
        
        [newBT setTitle:@" 汽车配件" forState:UIControlStateNormal];
        [newBT setTitleColor:newColor(151, 153, 154, 1) forState:UIControlStateNormal];
        newBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
        
        
        [newBT setImage:[UIImage imageNamed:@"box9"] forState:UIControlStateNormal];
        
        
      
        //计算文字大小
        CGSize titleSize = [@" 汽车配件" boundingRectWithSize:CGSizeMake(MAXFLOAT, titBtnH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kWidthChange(13)]} context:nil].size;
        CGFloat titBtnW = titleSize.width + kWidthChange(15);
        //        if ((titBtnX + titBtnW) > kScreenWidth) {
        //            titBtnX = kWidthChange(25);
        //            titBtnY += titBtnH + kWidthChange(15);
        //
        //        }
        //        smallLabel.layer.masksToBounds = YES;
        //        smallLabel.layer.cornerRadius = kWidthChange(17);
        
        //设置按钮的位置
        newBT.frame = CGRectMake(titBtnX, titBtnY, titBtnW, titBtnH);
        
        titBtnX += titBtnW + padding ;
        [self.oneView addSubview:newBT];
        
        h = titBtnX + titBtnW;
        
     
        
        
        
        
        
        
        
    }

    }
    
    CGRect oneFrame  = self.oneView.frame;
    oneFrame.size.height = CGRectGetMaxY(fourLabel.frame) + kWidthChange(40);
    self.oneView.frame = oneFrame;
    
    
    CGRect twoFrame = self.TwoView.frame;
    twoFrame.origin.y = CGRectGetMaxY(self.oneView.frame) + kWidthChange(15);;
    self.TwoView.frame = twoFrame;
    
    
    
    
    
   
   
        UILabel *twoNewLabel = [Toos setUpWithUserLabel:@"当前城市可用门店" CGRect:CGRectMake(kWidthChange(8), 0, kScreenWidth - kWidthChange(30) - kWidthChange(16) , kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(34, 35, 37, 1) textSize:kWidthChange(15)];
        
        twoNewLabel.numberOfLines = 0;
        [self.TwoView addSubview:twoNewLabel];
        twoNewLabel.userInteractionEnabled = NO;
    
    
    if ([bigType intValue] == 1) {
        twoNewLabel.text = @"请选择商品规格";
        
        UIButton *JianBT  = [UIButton buttonWithType:UIButtonTypeCustom];
                JianBT.frame = CGRectMake(kScreenWidth - kWidthChange(30) - kWidthChange(15) - kWidthChange(50) - kWidthChange(45),   kWidthChange(17.5), kWidthChange(25), kWidthChange(25));
                [JianBT setImage:[UIImage imageNamed:@"box45"] forState:UIControlStateNormal];
                
                //    [self.JianBT addTarget:self action:@selector(clickJian:) forControlEvents:UIControlEventTouchUpInside];
                
        [self.TwoView addSubview:JianBT];
           [JianBT addTarget:self action:@selector(clickJian:) forControlEvents:UIControlEventTouchUpInside];
        
        self.XiaoLabel = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(JianBT.frame),    kWidthChange(17.5), kWidthChange(45), kWidthChange(25))];
                self.XiaoLabel.textColor = newColor(0, 0, 0, 1);
                self.XiaoLabel.textAlignment = NSTextAlignmentCenter;
                self.XiaoLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
        self.XiaoLabel.text = @"3";
                self.XiaoLabel.delegate = self;
                
                self.XiaoLabel.keyboardType = UIKeyboardTypePhonePad;
                 [self.TwoView addSubview:self.XiaoLabel];
        
        
        
        UIButton *addBT  = [UIButton buttonWithType:UIButtonTypeCustom];
                addBT.frame = CGRectMake(CGRectGetMaxX(self.XiaoLabel.frame),    kWidthChange(17.5), kWidthChange(25), kWidthChange(25));
                [addBT setImage:[UIImage imageNamed:@"box46"] forState:UIControlStateNormal];
                
        
           [self.TwoView addSubview:addBT];
        
        [addBT addTarget:self action:@selector(clickAdd:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        
    }else {
    
    
    UILabel *threeNewLabel = [Toos setUpWithUserLabel:@"当前城市可用门店" CGRect:CGRectMake(kWidthChange(8), 0, kScreenWidth - kWidthChange(30) - kWidthChange(28)  , kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(177, 186, 191, 1) textSize:kWidthChange(15)];
    threeNewLabel.textAlignment = NSTextAlignmentRight;
    threeNewLabel.numberOfLines = 0;
    [self.TwoView addSubview:threeNewLabel];
    threeNewLabel.userInteractionEnabled = NO;
    
    
    
    
        UIImageView *twoNewImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box21"]];
        twoNewImage.frame = CGRectMake(kScreenWidth - kWidthChange(30) - kWidthChange(18) , kWidthChange(30) - kWidthChange(7.5), kWidthChange(10), kWidthChange(15));
        
        [self.TwoView addSubview:twoNewImage];
    }
    
    [self.TwoView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickMenDian:)]];
    
    
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    
    self.pageLabel.text = [NSString stringWithFormat:@"%ld/%ld",index + 1,[self.bigDic[@"icon_img"]count]];
    
    
}

-(void)clickJian:(UIButton *)sender {
    
    int number = [self.XiaoLabel.text intValue];;
    
    if (number > 1) {
        number --;
    }else {
        
        [Toos setUpWithMBP:@"该商品数量不可减少" UIView:[UIApplication sharedApplication].keyWindow];
        return;
    }
    
    self.XiaoLabel.text = [NSString stringWithFormat:@"%d",number];
    
}
-(void)clickAdd:(UIButton *)sender {
   
    int number = [self.XiaoLabel.text intValue];
    number ++ ;
    self.XiaoLabel.text = [NSString stringWithFormat:@"%d",number];
    
    
 
    
    
}

+(CGFloat)setUpWithHeightWithBigArray:(NSDictionary *)tempDic {
    
    
    
    return kScreenWidth + kWidthChange(15) +   kWidthChange(37) + kWidthChange(8) +[Toos textRectWithHeight:[NSString stringWithFormat:@"%@",tempDic[@"title"]] textFont:[UIFont systemFontOfSize:kWidthChange(15)] weight:kScreenWidth - kWidthChange(16) - kWidthChange(35)] + kWidthChange(10)  + kWidthChange(10) + kWidthChange(25) + kWidthChange(10)  +  kWidthChange(85);
    
    
}

-(void)clickMenDian:(UITapGestureRecognizer *)sender {
    self.viewController.hidesBottomBarWhenPushed = YES;
    MDLBViewController *MDLB = [[MDLBViewController alloc]init];
    [self.viewController.navigationController pushViewController:MDLB animated:YES];
    
    
}

#pragma mark---领取优惠券
-(void)clickLQYHQ:(UIButton *)sender{
    
    if (self.YHView) {
        self.YHView.hidden = NO;
    }
    else {
        self.YHView = [[LYHView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [[UIApplication sharedApplication].keyWindow addSubview:self.YHView];
        
        
        
    }
    
    
}
@end
