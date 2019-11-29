//
//  GuiGeView.m
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "GuiGeView.h"
#import "DDJSViewController.h"
@interface GuiGeView()

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UILabel *numberLabel;

@property(nonatomic,retain)UIImageView *SpImage;

@property(nonatomic,retain)UILabel *oneLabel;

@property(nonatomic,retain)NSDictionary *SpDic;




@end
@implementation GuiGeView

-(void)layoutSubviews {
    [super layoutSubviews];
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.alphaView];
    self.alphaView.alpha = .5;
    
    
    self.bigView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kScreenHeight / 2 - kWidthChange(80), kScreenWidth, kScreenHeight / 2 + kWidthChange(80))];
    self.bigView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bigView];
    [self setUpWithNewBigView:self.tempDic bigType:self.bigType sptype:self.SpType];
    
}

-(void)setUpWithNewBigView:(NSMutableDictionary *)tempDic  bigType:(NSString *)bigType  sptype:(NSString *)spType{
    self.tempDic = tempDic;
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.SpType = spType;
    self.bigType = bigType;
    UIView *SpView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(120))];
    SpView.backgroundColor = [UIColor whiteColor];
    
    [self.bigView addSubview:SpView];
    
    
    
    UIImageView *SpImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(15), kWidthChange(25), kWidthChange(70), kWidthChange(70))];
    SpImage.layer.masksToBounds = YES;
    SpImage.layer.cornerRadius = 5;
    [SpView addSubview:SpImage];
    
    self.SpImage = SpImage;
    
    
    UILabel *TitleLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"库存%@件",tempDic[@"stock"]] CGRect:CGRectMake(kWidthChange(20) + CGRectGetMaxX(SpImage.frame),kWidthChange(25),kScreenWidth - CGRectGetMaxX(SpImage.frame) - kWidthChange(60), kWidthChange(15)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(16)];
    
    [SpView addSubview:TitleLabel];
    
    
    
    UILabel *JGLabel = [Toos setUpWithUserLabel:@"价格:" CGRect:CGRectMake(kWidthChange(20) + CGRectGetMaxX(SpImage.frame),CGRectGetMaxY(SpImage.frame) - kWidthChange(20),[Toos textRect:@"价格:" textFont:[UIFont systemFontOfSize:kWidthChange(16)]], kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(133, 134, 135, 1) textSize:kWidthChange(16)];
    
    [SpView addSubview:JGLabel];
    
    
    
    
    
    
    UILabel *oneLabel = [Toos setUpWithUserLabel:@"¥400.00" CGRect:CGRectMake(kWidthChange(10) + CGRectGetMaxX(JGLabel.frame), CGRectGetMaxY(SpImage.frame) - kWidthChange(20), kScreenWidth, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(233, 0, 20, 1) textSize:kWidthChange(18)];
    
    [SpView addSubview:oneLabel];
    
    
 
    
    
    UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(0) ,CGRectGetMaxY(SpView.frame) ,kScreenWidth , kWidthChange(10)) color:newColor(229, 230, 231, 1) textColor:newColor(176, 185, 194, 1) textSize:kWidthChange(12)];
    
    [self.bigView addSubview:lineLabel];
    
    
    UIScrollView *ScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lineLabel.frame), kScreenWidth, (kScreenHeight / 2 + kWidthChange(80)) - kWidthChange(118) - kWidthChange(60))];
    ScrollerView.backgroundColor = [UIColor whiteColor];
    
    [self.bigView addSubview:ScrollerView];
    
    
    
    
    UILabel *nameLabel = [Toos setUpWithUserLabel:@"规则" CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth, kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(18)];
    
    [ScrollerView addSubview:nameLabel];
    
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:1];
    
   
    
    
    [newArray addObject:@{@"title":@"杜兰特"}];
    
    
    
    
    
    
    UIButton *deleBT = [UIButton buttonWithType:UIButtonTypeCustom];
    deleBT.frame = CGRectMake(kScreenWidth - kWidthChange(10) - kWidthChange(25),kWidthChange(25), kWidthChange(25), kWidthChange(25));
    [deleBT setImage:[UIImage imageNamed:@"box22"] forState:UIControlStateNormal];
    
    [SpView addSubview:deleBT];
    
    [deleBT addTarget:self action:@selector(clickDelete:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat padding = kWidthChange(20);
    
    CGFloat titBtnX =  kWidthChange(15);
    CGFloat titBtnY = CGRectGetMaxY(nameLabel.frame);
    CGFloat titBtnH = kWidthChange(30);
    CGFloat h = 0;
    
    for (int i = 0; i < newArray.count; i++) {
        
        UIButton *oneView = [[UIButton alloc]initWithFrame:CGRectMake(kWidthChange(15), CGRectGetMaxY(nameLabel.frame) + i * kWidthChange(45), kScreenWidth - kWidthChange(30), kWidthChange(35))];
        
        
        
        CGSize titleSize = [newArray[i][@"title"] boundingRectWithSize:CGSizeMake(MAXFLOAT, titBtnH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kWidthChange(15)]} context:nil].size;
        CGFloat titBtnW = titleSize.width + 2 * padding;
        if ((titBtnX + titBtnW) > kScreenWidth - kWidthChange(30)) {
            titBtnX = kWidthChange(20);
            titBtnY += titBtnH + padding  ;
            
        }
       
        //            smallLabel.layer.borderWidth = 1;
        //            smallLabel.layer.borderColor = newColor(172, 172, 172, 1).CGColor;
        //设置按钮的位置
        
        //设置按钮的位置
        oneView.frame = CGRectMake(titBtnX, titBtnY, titBtnW, titBtnH);
        
        titBtnX += titBtnW + padding ;
        
        
        
        h = titBtnY + titBtnH;
        
        
        [oneView setTitle:[NSString stringWithFormat:@"%@",newArray[i][@"title"]] forState:UIControlStateNormal];
        oneView.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
        oneView.backgroundColor = newColor(252, 254, 254, 1);
        oneView.layer.masksToBounds = YES;
        oneView.layer.cornerRadius = kWidthChange(17.5);
        oneView.layer.borderWidth = 1;
        oneView.layer.borderColor = newColor(183, 184, 186, 1).CGColor;
        [ScrollerView addSubview:oneView];
        [oneView setTitleColor:newColor(183, 184, 186, 1) forState:UIControlStateNormal];
        [oneView addTarget:self action:@selector(clickSp:) forControlEvents:UIControlEventTouchUpInside];
        oneView.tag = 600 + i;
       
    
        
    }
    
    
    UILabel *twoLineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(5), h + kWidthChange(20), kScreenWidth - kWidthChange(10) ,    kWidthChange(1)) color:lineColor_gary textColor:newColor(118, 120, 120, 1) textSize:kWidthChange(12)];
    
    [ScrollerView addSubview:twoLineLabel];
    
    
    UILabel *fiveLabel = [Toos setUpWithUserLabel:@"数量" CGRect:CGRectMake(kWidthChange(15), CGRectGetMaxY(twoLineLabel.frame) + kWidthChange(20), kScreenWidth - kWidthChange(30) , kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(18)];
    
    
    [ScrollerView addSubview:fiveLabel];
    
    
    
    
    
    
    UIButton *deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBT.frame = CGRectMake( kWidthChange(15), CGRectGetMaxY(fiveLabel.frame) + kWidthChange(20), kWidthChange(30), kWidthChange(30));
    [deleteBT setImage:[UIImage imageNamed:@"box45"] forState:UIControlStateNormal];
    
    [deleteBT addTarget:self action:@selector(clickJian:) forControlEvents:UIControlEventTouchUpInside];
    [ScrollerView addSubview:deleteBT];
    
    
    self.numberLabel  = [Toos setUpWithUserLabel:@"1" CGRect:CGRectMake( CGRectGetMaxX(deleteBT.frame),  CGRectGetMaxY(fiveLabel.frame) + kWidthChange(20), kWidthChange(35), kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(15)];
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    
    [ScrollerView addSubview: self.numberLabel];
    
    
    
    
    UIButton *addBT  = [UIButton buttonWithType:UIButtonTypeCustom];
    addBT.frame = CGRectMake(CGRectGetMaxX(self.numberLabel.frame), CGRectGetMaxY(fiveLabel.frame) + kWidthChange(20), kWidthChange(30), kWidthChange(30));
    [addBT setImage:[UIImage imageNamed:@"box46"] forState:UIControlStateNormal];
    
    [addBT addTarget:self action:@selector(clickAdd:) forControlEvents:UIControlEventTouchUpInside];
    [ScrollerView addSubview:addBT];
    
    
    UILabel *threeLineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(5), CGRectGetMaxY(addBT.frame) + kWidthChange(20), kScreenWidth - kWidthChange(10) ,    kWidthChange(1)) color:lineColor_gary textColor:newColor(118, 120, 120, 1) textSize:kWidthChange(12)];
    
    [ScrollerView addSubview:threeLineLabel];
    
    
    
    ScrollerView.contentSize = CGSizeMake(0, CGRectGetMaxY(threeLineLabel.frame) + kWidthChange(10));
    
    
    
    
    
    
    
    if ([bigType intValue] == 1 ) {
        
        for (int i = 0; i < 2; i++) {
            
            UIButton *daohangBT = [UIButton buttonWithType:UIButtonTypeCustom];
            daohangBT.frame = CGRectMake(( kScreenWidth - kWidthChange(45) ) / 2 * i + i * kWidthChange(15) + kWidthChange(15) , kScreenHeight / 2 + kWidthChange(80) - kWidthChange(10) - (kTabBarHeight - kWidthChange(10)), ( kScreenWidth - kWidthChange(45)) / 2, kTabBarHeight - kWidthChange(10));
            
            if (i == 0) {
                [daohangBT setImage:[UIImage imageNamed:@"图层1"] forState:UIControlStateNormal];
                //
                
                
            }else {
                [daohangBT setImage:[UIImage imageNamed:@"图层2"] forState:UIControlStateNormal];
                
                
                
                
            }
            
            
            daohangBT.tag = 300 + i;
            
            
            [self.bigView addSubview:daohangBT];
            [daohangBT addTarget:self action:@selector(clickAddGouWuChe:) forControlEvents:UIControlEventTouchUpInside];
            
            
        }
        
        
        
    }else {
        
        UIButton *daohangBT = [UIButton buttonWithType:UIButtonTypeCustom];
        daohangBT.frame = CGRectMake( kWidthChange(15) , kScreenHeight / 2 + kWidthChange(80) - kWidthChange(25) - (kTabBarHeight - kWidthChange(10)), ( kScreenWidth - kWidthChange(30)), kTabBarHeight - kWidthChange(10));
        daohangBT.backgroundColor = newColor(233, 20, 50, 1);
        daohangBT.layer.masksToBounds = YES;
        daohangBT.layer.cornerRadius = (kTabBarHeight - kWidthChange(10)) / 2;
        [daohangBT setTitle:@"确定" forState:UIControlStateNormal];
        [daohangBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
        daohangBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
        [self.bigView addSubview:daohangBT];
        [daohangBT addTarget:self action:@selector(clickBayBT:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
}

#pragma mark--选择商品规格
-(void)clickSp:(UIButton *)sender {
    
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:1];
    
    if ([Toos isNotBlank:self.tempDic[@"spec"]]) {
        newArray = [NSMutableArray arrayWithArray:self.tempDic[@"spec"]];
    }
    
    for (int i = 600; i < 600 + newArray.count; i++) {
        
        UIButton *newBT = [self.bigView viewWithTag:i];
        
        UILabel *bigLabel = (UILabel *)[newBT.subviews objectAtIndex:1];
        
        
        if (newBT == sender) {
            sender.layer.borderWidth = 1;
            //            bigLabel.textColor = [UIColor whiteColor];
        }else {
            newBT.layer.borderWidth = 0;
            
            //             bigLabel.textColor = newColor(118, 120, 120, 1);
        }
        
        
    }
    NSDictionary *bigDic = [self.tempDic[@"spec"]objectAtIndex:sender.tag - 600];
    self.SpDic = bigDic;
    [self.SpImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",bigDic[@"icon"]]]];
    self.oneLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"¥ %@",bigDic[@"price"]] color:newColor(65, 78, 135, 1) color1:newColor(65, 78, 135, 1) font:kWidthChange(12) font1:kWidthChange(17) length:2 length1:[[NSString stringWithFormat:@"%@",bigDic[@"price"]]length]];
    
}


-(void)clickAddGouWuChe:(UIButton *)sender {
    
    if ([Toos isBlank:self.SpDic]) {
        [Toos setUpWithMBP:@"请选择商品规格" UIView:[UIApplication sharedApplication].keyWindow];
        return;
    }
    
    self.hidden = YES;
    if (sender.tag == 300) {
        [Toos dataWithSessionurl:@"/app/mall/add_cart" body:@{@"uid":[UserModel shared].uid,@"id":self.tempDic[@"id"],@"num":self.numberLabel.text,@"s_id":self.SpDic[@"id"]} view:[UIApplication sharedApplication].keyWindow token:@"" Block:^(id tempData) {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:[UIApplication sharedApplication].keyWindow];
        } failBlock:^(id tempData) {
            
        }];
    }else {
        
        self.bigControllerView.hidesBottomBarWhenPushed = YES;
//        DDZFViewController *DDZF = [[DDZFViewController alloc]init];
//        DDZF.numStr = self.numberLabel.text;
//        DDZF.product_id = [NSString stringWithFormat:@"%@",self.tempDic[@"id"]];
//        DDZF.GuiGeDic = self.SpDic;
//        [self.bigControllerView.navigationController pushViewController:DDZF animated:YES];
        
    }
    
}
-(void)clickBayBT:(UIButton *)sender {
    
//    if ([Toos isBlank:self.SpDic]) {
//        [Toos setUpWithMBP:@"请选择商品规格" UIView:[UIApplication sharedApplication].keyWindow];
//        return;
//    }
    self.hidden = YES;
    if ([self.SpType intValue] == 1) {
        [Toos dataWithSessionurl:@"/app/mall/add_cart" body:@{@"uid":[UserModel shared].uid,@"id":self.tempDic[@"id"],@"num":self.numberLabel.text,@"s_id":self.SpDic[@"id"]} view:[UIApplication sharedApplication].keyWindow token:@"" Block:^(id tempData) {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:[UIApplication sharedApplication].keyWindow];
        } failBlock:^(id tempData) {
            
        }];
    }else {
        self.bigControllerView.hidesBottomBarWhenPushed = YES;
        DDJSViewController *DDZF = [[DDJSViewController alloc]init];
        DDZF.numStr = self.numberLabel.text;
        DDZF.product_id = [NSString stringWithFormat:@"%@",self.tempDic[@"id"]];
        DDZF.GuiGeDic = self.SpDic;
        [self.bigControllerView.navigationController pushViewController:DDZF animated:YES];
        
        
    }
    
}

-(void)clickDelete:(UIButton *)sender {
    
    
    self.hidden = YES;
}

-(void)clickAdd:(UIButton *)sender {
    int number = [self.numberLabel.text intValue];
    number ++ ;
    self.numberLabel.text = [NSString stringWithFormat:@"%d",number];
    
}
-(void)clickJian:(UIButton *)sender {
    int number = [self.numberLabel.text intValue];;
    
    if (number > 1) {
        number --;
    }else {
        
        [Toos setUpWithMBP:@"该商品数量不可减少" UIView:[UIApplication sharedApplication].keyWindow];
        return;
    }
    self.numberLabel.text = [NSString stringWithFormat:@"%d",number];
}






@end
