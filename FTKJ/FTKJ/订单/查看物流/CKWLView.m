//
//  CKWLView.m
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "CKWLView.h"

@implementation CKWLView


-(UIView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(143))];
        self.bigView.backgroundColor = [UIColor whiteColor];
    }
    
    return _bigView;
    
    
}



-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    
    self= [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigView];
    }
    return self;
}


-(void)setUpWithNewBigDic:(NSDictionary *)tempDic {
    
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIImageView *bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(15), kWidthChange(143) / 2 - kWidthChange(48), kWidthChange(96), kWidthChange(96))];
    bigImage.layer.masksToBounds = YES;
    bigImage.layer.cornerRadius = 8;
    [self.bigView addSubview:bigImage];
    
    bigImage.backgroundColor = [UIColor redColor];
    
    UILabel *oneLabel = [Toos setUpWithUserLabel:@"共2件商品" CGRect:CGRectMake(0, kWidthChange(96) - kWidthChange(25), kWidthChange(96), kWidthChange(25)) color:newColor(116, 130, 112, 1) textColor:[UIColor whiteColor] textSize:kWidthChange(14)];
    
    oneLabel.textAlignment = NSTextAlignmentCenter;
    [bigImage addSubview:oneLabel];
    
    
    for (int i = 0; i < 4; i++) {
        UILabel *twoLabel = [Toos setUpWithUserLabel:@"共2件商品" CGRect:CGRectMake(CGRectGetMaxX(bigImage.frame) + kWidthChange(20), kWidthChange(143) / 2 - kWidthChange(48) + i * kWidthChange(24), kScreenWidth - CGRectGetMaxX(bigImage.frame) - kWidthChange(40), kWidthChange(24)) color:newColor(65, 65, 66, 1) textColor:[UIColor whiteColor] textSize:kWidthChange(14)];
        
        twoLabel.textAlignment = NSTextAlignmentCenter;
        [self.bigView addSubview:twoLabel];
    }
    
    
    UIView *WLview=[[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(143), kScreenWidth-kWidthChange(40), kWidthChange(150))];
    WLview.layer.masksToBounds=YES;
    WLview.layer.cornerRadius=10;
    WLview.backgroundColor=[UIColor whiteColor];
    WLview.layer.borderWidth = 1;
    WLview.layer.borderColor = newColor(235, 236, 237, 1).CGColor;
    [self.bigView addSubview:WLview];
//    NSDictionary *oneDic = [dataArray objectAtIndex:0];
//    UIView *smView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-kWidthChange(30), kWidthChange(95))];
//    [bigview addSubview:smView];
//    
//    
//    UILabel *dateLab=[Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@", [[dataArray objectAtIndex:0][@"time"]substringWithRange:NSMakeRange(5, 5)]]
//                                       CGRect:CGRectMake(0, kWidthChange(30), kWidthChange(60), kWidthChange(20)) color:newColor(0, 0, 0, 0) textColor:newColor(88, 184, 120, 1) textSize:kWidthChange(15)];
//    dateLab.textAlignment=NSTextAlignmentRight;
//    [smView addSubview:dateLab];
//    
//    
//    
//    
//    UILabel *timeLab=[Toos setUpWithUserLabel:  [NSString stringWithFormat:@"%@", [[dataArray objectAtIndex:0][@"time"]substringWithRange:NSMakeRange(11, 5)]] CGRect:CGRectMake(0, CGRectGetMaxY(dateLab.frame)+3, kWidthChange(60), kWidthChange(13)) color:newColor(0, 0, 0, 0) textColor:newColor(88, 184, 120, 1) textSize:kWidthChange(13)];
//    timeLab.textAlignment=NSTextAlignmentRight;
//    [smView addSubview:timeLab];
//    
//    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(timeLab.frame)+10, kWidthChange(30), kWidthChange(25), kWidthChange(25))];
//    
//    
//    
//    
//    img.image=[UIImage imageNamed:@"icon_8order_check"];
//    [smView addSubview:img];
//    
//    UILabel *titleLab=[Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",oneDic[@"status"]] CGRect:CGRectMake(CGRectGetMaxX(img.frame)+10, kWidthChange(30), kScreenWidth, kWidthChange(20)) color:newColor(0, 0, 0, 0) textColor:newColor(40, 40, 40, 1) textSize:kWidthChange(15)];
//    [smView addSubview:titleLab];
//    
//    UILabel *contentLab=[Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",oneDic[@"context"]] CGRect:CGRectMake(CGRectGetMaxX(img.frame)+10, CGRectGetMaxY(titleLab.frame)+3, kScreenWidth-kWidthChange(55)-CGRectGetMaxX(img.frame), [Toos textRectWithHeight:[NSString stringWithFormat:@"%@",oneDic[@"context"]] textFont:Font(kWidthChange(14)) weight:kScreenWidth-kWidthChange(55)-CGRectGetMaxX(img.frame)]) color:newColor(0, 0, 0, 0) textColor:newColor(187, 187, 187, 1) textSize:kWidthChange(14)];
//    [smView addSubview:contentLab];
//    
//    float y=CGRectGetMaxY(smView.frame);
//    
//    for (int i=1; i<dataArray.count; i++) {
//        UIView *View=[[UIView alloc]initWithFrame:CGRectMake(0, y, kScreenWidth-kWidthChange(30), kWidthChange(95))];
//        [bigview addSubview:View];
//        
//        NSDictionary *twoDic = [dataArray objectAtIndex:i];
//        
//        
//        UILabel *dateLab=[Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@", [[dataArray objectAtIndex:i][@"time"]substringWithRange:NSMakeRange(5, 5)]] CGRect:CGRectMake(0, kWidthChange(30), kWidthChange(60), kWidthChange(20)) color:newColor(0, 0, 0, 0) textColor:newColor(187, 187, 187, 1) textSize:kWidthChange(15)];
//        dateLab.textAlignment=NSTextAlignmentRight;
//        [View addSubview:dateLab];
//        
//        UILabel *timeLab=[Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@", [[dataArray objectAtIndex:i][@"time"]substringWithRange:NSMakeRange(11, 5)]] CGRect:CGRectMake(0, CGRectGetMaxY(dateLab.frame)+3, kWidthChange(60), kWidthChange(13)) color:newColor(0, 0, 0, 0) textColor:newColor(187, 187, 187, 1) textSize:kWidthChange(13)];
//        timeLab.textAlignment=NSTextAlignmentRight;
//        [View addSubview:timeLab];
//        
//        
//        UILabel *xian=[Toos setUpWithUserLabel:@"" CGRect:CGRectMake(CGRectGetMaxX(timeLab.frame)+10+kWidthChange(11.5), -kWidthChange(40), kWidthChange(2), kWidthChange(70)) color:bkColor textColor:newColor(0, 0, 0, 0) textSize:1];
//        [View addSubview:xian];
//        
//        
//        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(timeLab.frame)+10, kWidthChange(30), kWidthChange(25), kWidthChange(25))];
//        img.image=[UIImage imageNamed:@"icon_8order_uncheck"];
//        [View addSubview:img];
//        
//        UILabel *titleLab=[Toos setUpWithUserLabel:dataArray[i][@"status"] CGRect:CGRectMake(CGRectGetMaxX(img.frame)+10, kWidthChange(30), kScreenWidth, kWidthChange(20)) color:newColor(0, 0, 0, 0) textColor:newColor(187, 187, 187, 1) textSize:kWidthChange(15)];
//        [View addSubview:titleLab];
//        
//        UILabel *contentLab=[Toos setUpWithUserLabel:dataArray[i][@"context"] CGRect:CGRectMake(CGRectGetMaxX(img.frame)+10, CGRectGetMaxY(titleLab.frame)+3, kScreenWidth-kWidthChange(55)-CGRectGetMaxX(img.frame), [Toos textRectWithHeight:dataArray[i][@"context"] textFont:Font(kWidthChange(14)) weight:kScreenWidth-kWidthChange(55)-CGRectGetMaxX(img.frame)]) color:newColor(0, 0, 0, 0) textColor:newColor(187, 187, 187, 1) textSize:kWidthChange(14)];
//        contentLab.numberOfLines=0;
//        [View addSubview:contentLab];
//        
//        
//        
//        
//        if (y==CGRectGetMaxY(smView.frame)) {
//            img.image=[UIImage imageNamed:@"icon_8order_check"];
//            dateLab.textColor=newColor(40, 40, 40, 1);
//            timeLab.textColor=newColor(40, 40, 40, 1);
//            titleLab.textColor=newColor(40, 40, 40, 1);
//            contentLab.textColor=newColor(40, 40, 40, 1);
//            xian.backgroundColor=newColor(88, 184, 120, 1);
//        }
//        
//        y=CGRectGetMaxY(View.frame);
//        
//    }
//    
//    CGRect frm=bigview.frame;
//    frm.size.height=y;
//    bigview.frame=frm;
//    self.scView.contentSize = CGSizeMake(0, CGRectGetMaxY(frm));
    
    
    
    
    
    
}


+(CGFloat)setUpWithHeightWithBigDic:(NSDictionary *)tempDic {
    
    
    
    
    return kWidthChange(293);
}


@end
