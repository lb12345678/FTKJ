//
//  SXViewCell.m
//  TTZS
//
//  Created by ios on 2018/4/16.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "SXViewCell.h"

@implementation SXViewCell


-(UIButton *)QuanBuBT {
    if (_QuanBuBT == nil) {
        self.QuanBuBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.QuanBuBT.frame = CGRectMake(10, 10, kWidthChange(57), kHeightChange(23));
        [self.QuanBuBT setTitle:@"全部" forState:UIControlStateNormal];
        self.QuanBuBT.backgroundColor = newColor(44, 186, 168, 1);
        self.QuanBuBT.layer.masksToBounds = YES;
        self.QuanBuBT.layer.cornerRadius = 2;
        [self.QuanBuBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.QuanBuBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(13)];
    }
    return _QuanBuBT;
}
-(UIView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(15), 10,kWidthChange(302) - kWidthChange(30), kHeightChange(23))];
        self.bigView.backgroundColor = [UIColor whiteColor];
        
    }
    return _bigView;
}
-(UILabel *)lineLabel {
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(10, 0, kScreenWidth - 20, 1) color:[UIColor whiteColor] textColor:RedColor textSize:12];
        self.lineLabel.alpha = .1;
        
    }
    return _lineLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       // [self.contentView addSubview:self.QuanBuBT];
        [self.contentView addSubview:self.bigView];
        [self.contentView addSubview:self.lineLabel];
    }
    return self;
}

- (void)setUpWithNameLabel:(NSString *)name imageArray:(NSArray *)imageArray nsIndexPath:(NSIndexPath *)indexPath{
   
    
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    CGRect bigFrame = self.bigView.frame;
   
    
    if ([Toos isBlank:imageArray]) {
        bigFrame.size.height = 0;
    }else {
        
        
        
        
        int lie=0;
        
        lie= 3;
        int Allcount= imageArray.count;
        int line=Allcount/lie;
        if(Allcount%lie>0)
            line++;
        
        bigFrame.size.height = line  * kWidthChange(55) + (line - 1 ) * kWidthChange(15);
        
        CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
        CGFloat h = 0;//用来控制button距离父视图的高
        for (int i = 0; i < imageArray.count; i++) {
            
            NSMutableDictionary *newDic = [imageArray objectAtIndex:i];
            
            UILabel *newButton = [[UILabel alloc]init];

            newButton.userInteractionEnabled = YES;
//            UIImageView *view = [[UIImageView alloc]init];
            newButton.tag = (indexPath.section + 1) * 100 + i;
            //根据计算文字的大小
           
            //为button赋值
            //label.text = array;
            newButton.backgroundColor = [UIColor clearColor];
            //设置button的frame
            newButton.frame = CGRectMake( w, h , (bigFrame.size.width - 45) / 3 , kWidthChange(55));
            newButton.layer.masksToBounds = YES;
            
//            if ([self.bigType intValue] == 1) {
//                newButton.layer.cornerRadius = kWidthChange(15);
//            }else {
//
            newButton.layer.cornerRadius = 3;
            
//            }
            newButton.numberOfLines = 0;
            newButton.textAlignment = NSTextAlignmentCenter;
         newButton.font = [UIFont systemFontOfSize:kWidthChange(15)];
          
            //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
            if(w + (bigFrame.size.width - 45) / 3 > bigFrame.size.width){
                w = 0; //换行时将w置为0
                h = h + newButton.frame.size.height + kWidthChange(15) ;//距离父视图也变化
                newButton.frame = CGRectMake( w, h, (bigFrame.size.width - 45) / 3, kWidthChange(55));//重设button的frame
            }
            w = newButton.frame.size.width + newButton.frame.origin.x + kWidthChange(15);
           
            newButton.text = [NSString stringWithFormat:@"%@",[imageArray objectAtIndex:i][@"title"]];
            
           
            [newButton addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickNewBT:)]];
         
            
        
            [self.bigView addSubview:newButton];
          
            
            if ([newDic[@"click"]isEqualToString:@"0"]) {
                newButton.backgroundColor = newColor(241, 241, 241, 1);
                newButton.textColor = newColor(97, 97, 97, 1);
                
              
                newButton.layer.borderWidth = 1;
                newButton.layer.borderColor = lineColor_gary.CGColor;
            }else if([newDic[@"click"]isEqualToString:@"1"]){
                
                newButton.backgroundColor = newColor(38, 179, 178, 1);
                  newButton.textColor = newColor(255, 255, 255, 1);
             
             
                newButton.layer.borderWidth = 0;
                newButton.layer.borderColor = lineColor_gary.CGColor;
               
                
            }
            
            
         
        }
        
       
        
        
    }
    self.bigView.frame = bigFrame;
    
    
    CGRect lineFrame = self.lineLabel.frame;
    
    lineFrame.origin.y = CGRectGetMaxY(self.bigView.frame) + kWidthChange(15);
    self.lineLabel.frame = lineFrame;
}

+ (CGFloat)heightWithMyName:(NSString *)name imageArray:(NSArray *)imageArray{
    CGFloat height;
    if ([Toos isBlank:imageArray]) {
        height = 0;
    }else {
        int lie=0;
        
        lie= 3;
        int Allcount= imageArray.count;
        int line=Allcount/lie;
        if(Allcount%lie>0)
            line++;
        
        height =  line  * kWidthChange(55) + (line - 1) *  kWidthChange(15) ;
    }
    
    return  height + kWidthChange(16) + 10 ;
}

- (void)clickNewBT:(UITapGestureRecognizer *)sender {
    UILabel *nameLabel = (UILabel *)sender.view;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"shaiXuan" object:[NSString stringWithFormat:@"%ld",nameLabel.tag]];
  
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
