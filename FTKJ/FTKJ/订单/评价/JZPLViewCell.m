//
//  PLViewCell.m
//  JZGL
//
//  Created by ios on 2019/8/14.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "JZPLViewCell.h"

@implementation JZPLViewCell

-(UIImageView *)smallImage {
    if (_smallImage == nil) {
        self.smallImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(10), kWidthChange(10), kWidthChange(42), kWidthChange(42))];
        self.smallImage.backgroundColor = [UIColor redColor];
    }
    return _smallImage;
}

-(UILabel *)nameLabel {
    
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"123" CGRect:CGRectMake(CGRectGetMaxX(self.smallImage.frame) + kWidthChange(15), kWidthChange(10), kScreenWidth - kWidthChange(10) - CGRectGetMaxX(self.smallImage.frame) - kWidthChange(10), kWidthChange(42)) color:[UIColor clearColor] textColor:newColor(99, 102, 118, 1) textSize:kWidthChange(12)];
    }
    return _nameLabel;
}

-(UILabel *)lineLabel {
    
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake( kWidthChange(10),CGRectGetMaxY(self.nameLabel.frame) + kWidthChange(10), kScreenWidth - kWidthChange(20) , kWidthChange(1)) color:lineColor_gary textColor:newColor(99, 102, 118, 1) textSize:kWidthChange(12)];
    }
    return _lineLabel;
}


-(UITextView *)textView {
    if (_textView == nil) {
        self.textView = [[UITextView alloc]initWithFrame:CGRectMake(kWidthChange(10), CGRectGetMaxY(self.lineLabel.frame) + kWidthChange(10) , kScreenWidth - kWidthChange(20), kWidthChange(110))];
        
       
        self.textView.font = [UIFont systemFontOfSize:kWidthChange(14)];
        UILabel *messageLabel1 = [Toos setUpWithUserLabel:@"写下对该商品的评价吧～" CGRect:CGRectMake(kWidthChange(0), kWidthChange(0), kScreenWidth - 30, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(199, 199, 200, 1) textSize:kWidthChange(14)];
        [ self.textView addSubview:messageLabel1];
        [self.textView setValue:messageLabel1 forKeyPath:@"_placeholderLabel"];
        
    }
    
    return _textView;
    
}

-(UIView *)bigView {
    
    if (_bigView == nil) {
        self.bigView= [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(10), CGRectGetMaxY(self.textView.frame) + kWidthChange(10), kScreenWidth - kWidthChange(20) , kWidthChange(80))];
        self.bigView.backgroundColor = [UIColor clearColor];
        
        
    }
    return _bigView;
    
}

-(UILabel *)StarLabel {
    if (_StarLabel == nil) {
        self.StarLabel = [Toos setUpWithUserLabel:@"请打个分吧：" CGRect:CGRectMake(kWidthChange(10), CGRectGetMaxY(self.bigView.frame), kScreenWidth, kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(78, 86, 100, 1) textSize:kWidthChange(16)];
    }
    return _StarLabel;
}

-(XHStarRateView *)StarView {
    
    if (_StarView == nil) {
        
        self.StarView = [[XHStarRateView alloc]initWithFrame:CGRectMake(kScreenWidth - kWidthChange(10) - kWidthChange(160), CGRectGetMaxY(self.bigView.frame) + kWidthChange(20) + 15 , kWidthChange(160), kWidthChange(20)) numberOfStars:5 rateStyle:0 isAnination:YES delegate:self];
        
        
     
        self.StarView.currentScore = 0;
        
    }
    return _StarView;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.smallImage];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.textView];
        [self.contentView addSubview:self.bigView];
      
        [self.contentView addSubview:self.StarLabel];
          [self.contentView addSubview:self.StarView];
    }
    
    return self;
}


-(void)setUpWithMessage:(NSMutableDictionary *)newDic indexPath:(NSIndexPath *)indexPath{
    self.myDic = newDic;
    [self.smallImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",newDic[@"product"][@"img"]]]];
    self.nameLabel.text = [NSString stringWithFormat:@"%@",newDic[@"product"][@"title"]];
  
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    self.textView.text = [NSString stringWithFormat:@"%@",newDic[@"context"]];
    self.StarView.currentScore = [newDic[@"stars"]intValue];
    CGRect smallImageView = self.bigView.frame;
    
    
    
    
    int lie=0;
    
    lie= 4;
    int Allcount= [newDic[@"imgs"] count] + 1;
    int line=Allcount/lie;
    if(Allcount%lie>0)
        line++;
    
    
    
    
    smallImageView.size.height = line  * kWidthChange(65) + (line - 1 ) * kWidthChange(10) ;
    
    
    CGFloat w = kWidthChange(0);//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat h = 0;//用来控制button距离父视图的高
    for (int i = 0; i < Allcount; i++) {
        UIImageView *view = [[UIImageView alloc]init];
        view.tag = i + 200 + (indexPath.section * 100);
        //根据计算文字的大小
        
        //为button赋值
        //label.text = array;
        view.backgroundColor = [UIColor whiteColor];
        //设置button的frame
        view.frame = CGRectMake( w, h , kWidthChange(65) ,kWidthChange(65));
        
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
        if(w + kWidthChange(80) > smallImageView.size.width){
            w = kWidthChange(0); //换行时将w置为0
            h = h + view.frame.size.height + kWidthChange(10) ;//距离父视图也变化
            view.frame = CGRectMake( w, h, kWidthChange(65),kWidthChange(65));//重设button的frame
        }
        w = view.frame.size.width + view.frame.origin.x + ( smallImageView.size.width - kWidthChange(65) * 4)  / 3;
        
        
        view.userInteractionEnabled = YES;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(kWidthChange(65) - kWidthChange(20), 0, kWidthChange(20), kWidthChange(20));
        
        [button setImage:[UIImage imageNamed:@"×"] forState:UIControlStateNormal];
        
        
        button.tag = i + 100;
        
        if (i == [newDic[@"imgs"] count]) {
            view.image = [UIImage imageNamed:@"icon_8order_upload"];
            UITapGestureRecognizer *tapHeader = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHeader:)];
            [view addGestureRecognizer:tapHeader];
            
            
        }else {
            
            
            [view sd_setImageWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@%@",APP_URlImage,[newDic[@"imgs"] objectAtIndex:i][@"pic"]]]];
        }
        [self.bigView addSubview:view];
    }
    
    self.bigView.frame = smallImageView;
    
    
    CGRect startLabelFrame = self.StarLabel.frame;
    startLabelFrame.origin.y = CGRectGetMaxY(self.bigView.frame);
    self.StarLabel.frame = startLabelFrame;
    
    CGRect startFrame = self.StarView.frame;
    startFrame.origin.y = CGRectGetMaxY(self.bigView.frame) + kWidthChange(20);
    self.StarView.frame = startFrame;
    
    
    
}

+(CGFloat)tableViewSetHeight:(NSMutableDictionary *)newDic {
    
    
    
    int lie=0;
    
    lie= 3;
    int Allcount= [newDic[@"imgs"] count] + 1;
    int line=Allcount/lie;
    if(Allcount%lie>0)
        line++;
    
    return kWidthChange(62) + kWidthChange(20) + kWidthChange(110)+ line  * kWidthChange(65) + (line - 1 ) * kWidthChange(10) + kWidthChange(60);
    
    
}
-(void)clickHeader:(UITapGestureRecognizer *)sender {
    [self.textView resignFirstResponder];
    UIImageView *smallImage = (UIImageView *)sender.view;
    if (self.ClickImage) {
        self.ClickImage(smallImage.tag);
    }
    
    
    
}
-(void)starRateView:(XHStarRateView *)starRateView currentScore:(CGFloat)currentScore {
    
    [self.myDic setObject:[NSNumber numberWithInt:currentScore] forKey:@"stars"];
    
    
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
