//
//  DingWeiOneViewCell.m
//  YXKJ
//
//  Created by ios on 2018/10/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "DingWeiOneViewCell.h"

@implementation DingWeiOneViewCell

-(UIView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(50))];
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

-(void)setUpWithNewArray:(NSArray *)newArray {
    
    
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.dataArray = newArray;
    CGRect twoFrame = self.bigView.frame;
    
    int lie=0;
    
    lie= 3;
    int Allcount= [newArray count];
    int line=Allcount/lie;
    if(Allcount%lie>0)
        line++;
    
    
    
    
    twoFrame.size.height = line  * kWidthChange(36) + (line - 1 ) * kWidthChange(20) + kWidthChange(15);
    
    
    CGFloat w = kWidthChange(20);//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat h = 0;//用来控制button距离父视图的高
    for (int i = 0; i < Allcount; i++) {
        UILabel *view = [[UILabel alloc]init];
        view.tag = i + 200;
        //根据计算文字的大小
        
        //为button赋值
        //label.text = array;
        view.backgroundColor = [UIColor whiteColor];
        //设置button的frame
        view.frame = CGRectMake( w, h , (kScreenWidth - kWidthChange(100)) / 3 ,kWidthChange(36));
        
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
        if(w + (kScreenWidth - kWidthChange(100)) / 3 / 3 > twoFrame.size.width ){
            w = kWidthChange(20); //换行时将w置为0
            h = h + view.frame.size.height + kWidthChange(20) ;//距离父视图也变化
            view.frame = CGRectMake( w, h, (kScreenWidth - kWidthChange(100)) / 3,kWidthChange(36));//重设button的frame
        }
        w = view.frame.size.width + view.frame.origin.x + kWidthChange(20);
        
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 5;
//        view.layer.borderWidth = .6;
//        view.layer.borderColor = newColor(211, 211, 211, 1).CGColor;
        view.textAlignment = NSTextAlignmentCenter;
        view.font = [UIFont systemFontOfSize:kWidthChange(15)];
        view.textColor = newColor(46, 47, 48, 1);
        view.text = [NSString stringWithFormat:@"%@",[newArray objectAtIndex:i ][@"city"]];
        view.userInteractionEnabled = YES;
        view.backgroundColor = newColor(241, 242, 244, 1);
        view.tag = 100 + i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTap:)];
        [view addGestureRecognizer:tap];
        
        [self.bigView addSubview:view];
    }
    self.bigView.frame = twoFrame;
}

+(CGFloat)setUpWitiHeightWithArray:(NSArray *)nameArray {
    
    int lie=0;
    
    lie= 3;
    int Allcount= [nameArray count];
    int line=Allcount/lie;
    if(Allcount%lie>0)
        line++;
    
    
    
    
   return  line  * kWidthChange(36) + (line - 1 ) * kWidthChange(20) + kWidthChange(15);
    
    
    
    
}

-(void)clickTap:(UITapGestureRecognizer *)sender {
    
    if (self.ClickBlock) {
        self.ClickBlock([self.dataArray objectAtIndex:sender.view.tag - 100]);
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
