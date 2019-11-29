//
//  PLViewCell.m
//  JZGL
//
//  Created by ios on 2019/8/6.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "PLViewCell.h"
#import "XHStarRateView.h"

@implementation PLViewCell


-(UIView *)bigView {
    
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(15), 0, kScreenWidth - kWidthChange(30), kWidthChange(15))];
        self.bigView.backgroundColor = [UIColor whiteColor];
        self.bigView.layer.masksToBounds = YES;
        self.bigView.layer.cornerRadius = 5;
        
    }
    return _bigView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigView];
    }
    return self;
}

-(void)setUpWithNewBigView:(NSMutableArray *)dataArray {
    
    self.dataArray = dataArray;
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    CGRect bigFrame = self.bigView.frame;
    
    CGFloat bigh = 0.0;
    
    
    if ([Toos isBlank:dataArray]) {
        bigh = 0.0;
    }else {
    
    
    
    for (int i = 0; i < dataArray.count; i++) {

        NSDictionary *tempDic = [dataArray objectAtIndex:i];
        
        
        
        UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0, bigh, kScreenWidth - kWidthChange(30), 0)];
        
        smallView.backgroundColor = [UIColor clearColor];
        CGRect smallFrame = smallView.frame;
        
        [self.bigView addSubview:smallView];
        
        UIImageView *headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(15), kWidthChange(15), kWidthChange(40), kWidthChange(40))];
        headerImage.layer.masksToBounds = YES;
        headerImage.layer.cornerRadius = kWidthChange(20);
     
        [headerImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_URlImage,tempDic[@"user"][@"img"]]]];
        [smallView addSubview:headerImage];
        
       
        UILabel *phoneLabel = [Toos setUpWithUserLabel: [NSString stringWithFormat:@"%@",[tempDic[@"user"][@"phone"]stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"]] CGRect:CGRectMake(CGRectGetMaxX(headerImage.frame) + kWidthChange(10), kWidthChange(15), [Toos textRect:@"13461657306" textFont:[UIFont systemFontOfSize:kWidthChange(15)]], kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(112, 118, 127, 1) textSize:kWidthChange(16)];
   [smallView addSubview:phoneLabel];
        
        XHStarRateView *starView = [[XHStarRateView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(phoneLabel.frame) + kWidthChange(10), kWidthChange(15) + kWidthChange(12.5), kWidthChange(80), kWidthChange(15)) numberOfStars:5 rateStyle:1 isAnination:YES finish:^(CGFloat currentScore) {
            
        }];
        starView.currentScore = [tempDic[@"star"]intValue];
        starView.userInteractionEnabled = NO;
        [smallView addSubview:starView];
        
        UILabel *numberLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"数量*%@",tempDic[@"num"]] CGRect:CGRectMake(kWidthChange(15) , kWidthChange(15), kScreenWidth - kWidthChange(70), kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(173, 180, 187, 1) textSize:kWidthChange(14)];
        [smallView addSubview:numberLabel];
        numberLabel.textAlignment = NSTextAlignmentRight;
        
      
        
        
        
        UILabel *messageLabel = [Toos setUpWithUserLabel:  [NSString stringWithFormat:@"%@",tempDic[@"content"]] CGRect:CGRectMake(CGRectGetMaxX(headerImage.frame) + kWidthChange(10) , CGRectGetMaxY(numberLabel.frame) + kWidthChange(10), kScreenWidth - kWidthChange(60) - CGRectGetMaxX(headerImage.frame), [Toos textRectWithHeight: [NSString stringWithFormat:@"%@",tempDic[@"content"]] textFont:[UIFont systemFontOfSize:kWidthChange(15)] weight:kScreenWidth - kWidthChange(60) - CGRectGetMaxX(headerImage.frame)]) color:[UIColor clearColor] textColor:newColor(129, 136, 142, 1) textSize:kWidthChange(15)];
        [smallView addSubview:messageLabel];
       
        
        UIView *bigImage = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(headerImage.frame) + kWidthChange(10), CGRectGetMaxY(messageLabel.frame) , kScreenWidth - kWidthChange(60) - CGRectGetMaxX(headerImage.frame) , 0)];
        CGRect smallImageView = bigImage.frame;
         [smallView addSubview:bigImage];

        if ([Toos isBlank:tempDic[@"imgarr_img"]] || ![tempDic[@"imgarr_img"] isKindOfClass:[NSArray class]]) {
            smallImageView.size.height = 0;
            smallImageView.origin.y = CGRectGetMaxY(messageLabel.frame);
        }else {
            
            smallImageView.origin.y = CGRectGetMaxY(messageLabel.frame) + kWidthChange(10);
            
            int lie=0;
            
            lie= 3;
            int Allcount= [tempDic[@"imgarr_img"] count];
            int line=Allcount/lie;
            if(Allcount%lie>0)
                line++;
            
            
            
            
            smallImageView.size.height = line  * (kScreenWidth - kWidthChange(85) - CGRectGetMaxX(headerImage.frame)) / 3 + (line - 1 ) * kWidthChange(10) ;
            
            
            CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
            CGFloat h = 0;//用来控制button距离父视图的高
            for (int j = 0; j < Allcount; j++) {
                UIImageView *view = [[UIImageView alloc]init];
                view.tag = j + 200 + i * 100;
                //根据计算文字的大小
//                [self.imageArray addObject:[NSString stringWithFormat:@"%@%@",APP_URlImage,  [newDic[@"imgarr"] objectAtIndex:i]]];
                //为button赋值
                //label.text = array;
               
                //设置button的frame
                view.frame = CGRectMake( w, h , (kScreenWidth - kWidthChange(85) - CGRectGetMaxX(headerImage.frame)) / 3 ,(kScreenWidth - kWidthChange(85) - CGRectGetMaxX(headerImage.frame)) / 3);
                
                //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
                if(w + (kScreenWidth - kWidthChange(85) - CGRectGetMaxX(headerImage.frame)) / 3 > smallImageView.size.width){
                    w = 0; //换行时将w置为0
                    h = h + view.frame.size.height + kWidthChange(10) ;//距离父视图也变化
                    view.frame = CGRectMake( w, h, (kScreenWidth - kWidthChange(85) - CGRectGetMaxX(headerImage.frame)) / 3,(kScreenWidth - kWidthChange(85) - CGRectGetMaxX(headerImage.frame)) / 3);//重设button的frame
                }
                w = view.frame.size.width + view.frame.origin.x + kWidthChange(10) ;
                
                [view sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_URlImage,  [tempDic[@"imgarr_img"] objectAtIndex:j]]]];
                
                view.userInteractionEnabled = YES;
                
               [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTapImage:)]];
                [bigImage addSubview:view];
            }
            
        }
       bigImage.frame = smallImageView;
        
        
        
        UILabel *timeLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",tempDic[@"create_time"]] CGRect:CGRectMake(CGRectGetMaxX(headerImage.frame) + kWidthChange(10) , CGRectGetMaxY(smallImageView) + kWidthChange(10), kScreenWidth - kWidthChange(60) - CGRectGetMaxX(headerImage.frame), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(189, 197, 202, 1) textSize:kWidthChange(13)];
        [smallView addSubview:timeLabel];
        smallFrame.size.height = CGRectGetMaxY(timeLabel.frame)  + kWidthChange(10);
        smallView.frame = smallFrame;
        
        
        
        

        bigh = CGRectGetMaxY(smallFrame);
        
        
    }
        UIButton *daohangBT = [UIButton buttonWithType:UIButtonTypeCustom];
        daohangBT.frame = CGRectMake(kScreenWidth / 2 - kWidthChange(60), bigh + kWidthChange(10), kWidthChange(120), kWidthChange(30));
        daohangBT.layer.masksToBounds = YES;
        daohangBT.layer.cornerRadius = kWidthChange(15);
        daohangBT.layer.borderWidth = 1;
        daohangBT.layer.borderColor = newColor(236, 77, 44, 1).CGColor;
       
        
     
            
            
            [daohangBT setTitle:@"查看全部评价" forState:UIControlStateNormal];
            
            
       
        
        [daohangBT setTitleColor:newColor(236, 77, 44, 1) forState:UIControlStateNormal];
        daohangBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
        [self.bigView addSubview:daohangBT];
        
     bigh = CGRectGetMaxY(daohangBT.frame) + kWidthChange(20);
    
    }
    
    
    
    
    
    bigFrame.size.height = bigh;
    self.bigView.frame = bigFrame;
    
    
    
}

+(CGFloat)setUpWithBigHeightWithArray:(NSMutableArray *)dataArray {
    
    CGFloat h = kWidthChange(50);
    
    if ([Toos isBlank:dataArray]) {
        return 0;
    }
    
    for (int i = 0; i < dataArray.count; i++) {
        
        NSDictionary *tempDic = [dataArray objectAtIndex:i];
        
        
        
      
        h += kWidthChange(15) + kWidthChange(40);
        
    
        h += kWidthChange(10) + [Toos textRectWithHeight: [NSString stringWithFormat:@"%@",tempDic[@"content"]] textFont:[UIFont systemFontOfSize:kWidthChange(15)] weight:kScreenWidth - kWidthChange(60) - kWidthChange(50)];
        
        
      
        
        
        if ([Toos isBlank:tempDic[@"imgarr_img"]] || ![tempDic[@"imgarr_img"] isKindOfClass:[NSArray class]]) {
           
            
            h += 0;
        }else {
            
           
            
            int lie=0;
            
            lie= 3;
            int Allcount= [tempDic[@"imgarr_img"] count];
            int line=Allcount/lie;
            if(Allcount%lie>0)
                line++;
            
            
            
            
            h += line  * (kScreenWidth - kWidthChange(85) - kWidthChange(50)) / 3 + (line - 1 ) * kWidthChange(10) ;
            
            
          
            
        }
       
        
        h += kWidthChange(40) + kWidthChange(15);
        
      
        
        
    }
    
    return h;
}
-(void)clickTapImage:(UITapGestureRecognizer *)sender {
    
    UIImageView *smallImage = (UIImageView *)sender.view;
    
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:1];
   
    for (NSString *newStr in  [self.dataArray objectAtIndex:(smallImage.tag - 200) / 100][@"imgarr_img"]) {
        [imageArray addObject:[NSString stringWithFormat:@"%@%@",APP_URlImage,newStr]];
    }
    
    
    
    
    [AddXuanImage setupWithBigImage:imageArray imageView:smallImage number:(smallImage.tag - 100) % 200 viewController:self.viewController];
    
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
