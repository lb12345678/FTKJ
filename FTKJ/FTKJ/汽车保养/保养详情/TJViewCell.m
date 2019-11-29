//
//  TJViewCell.m
//  JZGL
//
//  Created by ios on 2019/8/8.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "TJViewCell.h"

@implementation TJViewCell

-(UIView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
        self.bigView.backgroundColor = [UIColor clearColor];
    }
    return _bigView;
}
-(NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self  =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigView];
    }
    return self;
}
-(void)setUpWithBigArray:(NSArray *)bigArray {
    
    [self.dataArray removeAllObjects];
    self.dataArray = [bigArray mutableCopy];
    
    
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGRect bigFrame = self.bigView.frame;
    if ([Toos isBlank:bigArray]) {
        bigFrame.size.height = 0;
    }else {
        
        
        
        
        int lie=0;
        
        lie= 2;
        int Allcount= bigArray.count;
        int line=Allcount/lie;
        if(Allcount%lie>0)
            line++;
        
        
        
        
        bigFrame.size.height = line  * kWidthChange(250) + (line - 1 ) * kWidthChange(15)  ;
        
        
        
        
        
        
        
        
        CGFloat w = kWidthChange(15);//保存前一个button的宽以及前一个button距离屏幕边缘的距离
        CGFloat h = 0;//用来控制button距离父视图的高
        for (int i = 0; i < bigArray.count; i++) {
            
            UIButton *newView = [[UIButton alloc]initWithFrame:CGRectMake(w, h,( kScreenWidth - kWidthChange(45)) / 2, kWidthChange(250))];
            newView.backgroundColor = [UIColor whiteColor];
            
            newView.tag = 200 + i;
//            UITapGestureRecognizer *Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickJingPin:)];
            [newView addTarget:self action:@selector(clickTuiJian:) forControlEvents:UIControlEventTouchUpInside];
            [newView setTitle:[bigArray objectAtIndex:i][@"id"] forState:UIControlStateNormal];
            [newView setTitleColor:[UIColor clearColor]  forState:UIControlStateNormal];
            //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
            if(w + ( kScreenWidth - kWidthChange(45)) / 2 > bigFrame.size.width){
                w = kWidthChange(15); //换行时将w置为0
                h = h + newView.frame.size.height + kWidthChange(15) ;//距离父视图也变化
                newView.frame = CGRectMake( w, h, (bigFrame.size.width - kWidthChange(45)) / 2,kWidthChange(250));//重设button的frame
            }
            w = newView.frame.size.width + newView.frame.origin.x + kWidthChange(15);
            
            NSDictionary *newDic = [bigArray objectAtIndex:i];
            
            UIImageView *bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, newView.frame.size.width  , newView.frame.size.width)];
           [bigImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",newDic[@"img"]]] placeholderImage:[UIImage imageNamed:@""]];
            bigImage.backgroundColor = [UIColor redColor];
            [newView addSubview:bigImage];
            
            
            
            UILabel *nameLabel =  [Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",newDic[@"title"]] CGRect:CGRectMake(5,  CGRectGetMaxY(bigImage.frame) + kWidthChange(10), ( kScreenWidth - kWidthChange(45)) / 2 - 10, kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(52, 64, 79, 1) textSize:kWidthChange(15)];
            nameLabel.userInteractionEnabled = NO;
            nameLabel.numberOfLines = 2;
            [newView addSubview:nameLabel];
            
            
            UILabel *moneyLabel =  [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(5,  CGRectGetMaxY(nameLabel.frame)+ kWidthChange(15), kScreenWidth, kWidthChange(15)) color:[UIColor clearColor] textColor:newColor(43, 53, 125, 1) textSize:kWidthChange(18)];
            moneyLabel.userInteractionEnabled = NO;
            [newView addSubview:moneyLabel];
            
              moneyLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"¥%@",newDic[@"price"]] color:newColor(65, 78, 135, 1) color1:newColor(65, 78, 135, 1) font:kWidthChange(12) font1:kWidthChange(17) length:1 length1:[[NSString stringWithFormat:@"%@",newDic[@"price"]]length]];
            
            
            
            UILabel *XiaoShouLabel =  [Toos setUpWithUserLabel:  [NSString stringWithFormat:@"月售%@",newDic[@"sales_num"]] CGRect:CGRectMake(0,  CGRectGetMaxY(nameLabel.frame)+ kWidthChange(15) , newView.frame.size.width - 5 , kWidthChange(15)) color:[UIColor clearColor] textColor:newColor(163, 173, 181, 1) textSize:kWidthChange(12)];
            XiaoShouLabel.textAlignment = NSTextAlignmentRight;
            [newView addSubview:XiaoShouLabel];
            
            XiaoShouLabel.userInteractionEnabled = NO;
            
            
            [self.bigView addSubview:newView];
        }
       
    }
    
    
    
    
    self.bigView.frame = bigFrame;
}
+(CGFloat)heightWithBIgArray:(NSArray *)array {
    if ([Toos isBlank:array]) {
        return 0;
    }
    
    
    int lie=0;
    
    lie= 2;
    int Allcount= array.count;
    int line=Allcount/lie;
    if(Allcount%lie>0)
        line++;
    
    
    
    
    return  line  * kWidthChange(250) + (line - 1 ) * kWidthChange(15) + kWidthChange(20);
    
}


-(void)clickTuiJian:(UIButton *)sender {
    
    if (self.ClickBlock) {
        self.ClickBlock(sender.titleLabel.text);
    }

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
