//
//  HomeThreeViewCell.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "HomeThreeViewCell.h"

@implementation HomeThreeViewCell


-(UIView *)bigView {
    
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(270))];
        self.bigView.backgroundColor = [UIColor whiteColor];
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

-(void)setUpWithNewBigDic:(NSDictionary *)tempDic {
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGRect bigFrame = self.bigView.frame;
        
        int lie=0;
        
        lie= 2;
        int Allcount= 5;
        int line=Allcount/lie;
        if(Allcount%lie>0)
            line++;
        
        
        
        
        bigFrame.size.height = line  * kWidthChange(267) + (line - 1 ) * kWidthChange(20) ;
        
        
        CGFloat w = kWidthChange(20);//保存前一个button的宽以及前一个button距离屏幕边缘的距离
        CGFloat h = 0;//用来控制button距离父视图的高
        for (int i = 0; i < Allcount; i++) {
            UIButton *view = [[UIButton alloc]init];
            view.tag = i + 200;
            //根据计算文字的大小
//            view.layer.masksToBounds = YES;
            view.layer.cornerRadius = 5;
//            view.layer.borderWidth = 1;
//            view.layer.borderColor = newColor(241, 242, 244, 1).CGColor;
            //为button赋值
            //label.text = array;
            view.backgroundColor = [UIColor whiteColor];
            //设置button的frame
     [view shadow:newColor(230, 231, 233, 1) opacity:1 radius:3 offset:CGSizeMake(0, 0)];
            view.frame = CGRectMake( w, h , (kScreenWidth - kWidthChange(60)) / 2 ,kWidthChange(267));
            
            //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
            if(w + (kScreenWidth - kWidthChange(60)) / 2 > kScreenWidth){
                w = kWidthChange(20); //换行时将w置为0
                h = h + view.frame.size.height + kWidthChange(20) ;//距离父视图也变化
                view.frame = CGRectMake( w, h,(kScreenWidth - kWidthChange(60)) / 2,kWidthChange(267));//重设button的frame
            }
            w = view.frame.size.width + view.frame.origin.x + kWidthChange(20);
            
          
            
            UIImageView *oneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
            oneImage.backgroundColor = [UIColor redColor];
            oneImage.frame = CGRectMake(0, 0, (kScreenWidth - kWidthChange(60)) / 2, kWidthChange(145));
            
            [view addSubview:oneImage];
            
            
            UILabel *nameLabel = [Toos setUpWithUserLabel:@"123456" CGRect:CGRectMake(kWidthChange(10), CGRectGetMaxY(oneImage.frame) + kWidthChange(15), (kScreenWidth - kWidthChange(60)) / 2 - kWidthChange(20), [Toos textRectWithHeight:@"123456" textFont:[UIFont systemFontOfSize:kWidthChange(16)] weight:(kScreenWidth - kWidthChange(60)) / 2 - kWidthChange(20)]) color:[UIColor clearColor] textColor:newColor(84, 85, 86, 1) textSize:kWidthChange(16)];
            [view addSubview:nameLabel];
            
            
            UILabel *moneyLabel = [Toos setUpWithUserLabel:@"¥58.88" CGRect:CGRectMake(kWidthChange(10), CGRectGetMaxY(nameLabel.frame) + kWidthChange(10), (kScreenWidth - kWidthChange(60)) / 2 - kWidthChange(20), kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(250, 127, 37, 1) textSize:kWidthChange(20)];
            [view addSubview:moneyLabel];
            
            UILabel *numberLabel = [Toos setUpWithUserLabel:@"销量" CGRect:CGRectMake(kWidthChange(10), CGRectGetMaxY(moneyLabel.frame) + kWidthChange(10), (kScreenWidth - kWidthChange(60)) / 2 - kWidthChange(20), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(132, 133, 134, 1) textSize:kWidthChange(14)];
            [view addSubview:numberLabel];
            
            
         UIButton *GouWuCheBT = [UIButton buttonWithType:UIButtonTypeCustom];
                GouWuCheBT.frame = CGRectMake((kScreenWidth - kWidthChange(60)) / 2 - kWidthChange(10) - kWidthChange(30) , CGRectGetMaxY(numberLabel.frame) - kWidthChange(30), kWidthChange(30), kWidthChange(30));
                [GouWuCheBT setImage:[UIImage imageNamed:@"box6"] forState:UIControlStateNormal];
                
            //GouWuCheBT.backgroundColor = [UIColor redColor];
            
            [view addSubview:GouWuCheBT];
            
            [self.bigView addSubview:view];
        }
        
    
    self.bigView.frame = bigFrame;
        
        
        
        
        
        

    
    
    
}
+(CGFloat)setUpWithHeightWithNewDic:(NSDictionary *)newDic {
    
    int lie=0;
    
    lie= 2;
    int Allcount= 5;
    int line=Allcount/lie;
    if(Allcount%lie>0)
        line++;
    
    return line  * kWidthChange(267) + (line - 1 ) * kWidthChange(20) ;
    
    
  
    
    
    
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
