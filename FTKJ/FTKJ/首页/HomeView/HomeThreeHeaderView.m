//
//  HomeThreeHeaderView.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "HomeThreeHeaderView.h"

@implementation HomeThreeHeaderView

-(UIImageView *)lineImage {
    
    if (_lineImage == nil) {
        self.lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(15), kWidthChange(2), kWidthChange(20))];
        self.lineImage.backgroundColor = newColor(195, 49, 50, 1);
    }
    return _lineImage;
    
}


-(UILabel *)nameLabel {
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"热门推荐" CGRect:CGRectMake(CGRectGetMaxX(self.lineImage.frame) + kWidthChange(15), 0, [Toos textRect:@"热门推荐" textFont:[UIFont systemFontOfSize:kWidthChange(18) weight:UIFontWeightBold]], kWidthChange(50)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(18)];
        self.nameLabel.font = [UIFont systemFontOfSize:kWidthChange(18) weight:UIFontWeightBold];
    }
    
    return _nameLabel;
    
}

-(UIScrollView *)bigScrollerView {
    
    if (_bigScrollerView == nil) {
        self.bigScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidthChange(20) + CGRectGetMaxX(self.nameLabel.frame), 0, kScreenWidth- kWidthChange(40) - CGRectGetMaxX(self.nameLabel.frame), kWidthChange(50))];
        self.bigScrollerView.backgroundColor = [UIColor whiteColor];
        self.bigScrollerView.showsVerticalScrollIndicator = NO;
        self.bigScrollerView.showsHorizontalScrollIndicator = NO;
    }
    
    return _bigScrollerView;
    
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.lineImage];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.bigScrollerView];
    }
    return self;
    
    
}

-(void)setUpWithNewBigDic:(NSDictionary *)newDic {
    [self.bigScrollerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat padding = kWidthChange(15);
    
    CGFloat titBtnX =  kWidthChange(0);
    CGFloat titBtnY = kHeightChange(0);
    CGFloat titBtnH = kWidthChange(50);
    CGFloat h = 0;
    for (int i = 0; i < 5; i++) {
        UILabel *smallLabel = [Toos setUpWithUserLabel:@"汽车配件" CGRect:CGRectMake(10, titBtnY ,kScreenWidth -  20 ,kWidthChange(50)) color:newColor(242, 248, 249, 0) textColor:newColor(153, 154, 155, 1) textSize:kWidthChange(14)];
        
        
        smallLabel.textAlignment = NSTextAlignmentCenter;
        //计算文字大小
        CGSize titleSize = [@"汽车配件" boundingRectWithSize:CGSizeMake(MAXFLOAT, titBtnH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:smallLabel.font} context:nil].size;
        CGFloat titBtnW = titleSize.width;
//        if ((titBtnX + titBtnW) > kScreenWidth) {
//            titBtnX = kWidthChange(25);
//            titBtnY += titBtnH + kWidthChange(15);
//
//        }
//        smallLabel.layer.masksToBounds = YES;
//        smallLabel.layer.cornerRadius = kWidthChange(17);
        
        //设置按钮的位置
        smallLabel.frame = CGRectMake(titBtnX, titBtnY, titBtnW, titBtnH);
        
        titBtnX += titBtnW + padding ;
        [self.bigScrollerView addSubview:smallLabel];
        
        h = titBtnX ;
       
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLeiBie:)];
        smallLabel.userInteractionEnabled = YES;
        [smallLabel addGestureRecognizer:tap];
        
      
        
    
  
    
    
   
}

    self.bigScrollerView.contentSize = CGSizeMake(h , 0);
    
    
}

-(void)clickLeiBie:(UITapGestureRecognizer *)sender {
    
    
    
}
@end
