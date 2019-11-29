//
//  MessageViewCell.m
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MessageViewCell.h"

@implementation MessageViewCell

-(UIView *)bigView {
    
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(15), 0, kScreenWidth - kWidthChange(30), kWidthChange(60))];
        self.bigView.layer.masksToBounds = YES;
        self.bigView.layer.cornerRadius = 5;
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

-(void)setUpWithNewBigDic:(NSDictionary *)newDic {
    self.tempDic = newDic;
    CGRect bigFrame  = self.bigView.frame;
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UILabel *nameLabel = [Toos setUpWithUserLabel:@"系统通知" CGRect:CGRectMake(kWidthChange(20), kWidthChange(20), kScreenWidth - kWidthChange(60), kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(38, 38, 39, 1) textSize:kWidthChange(20)];
    [self.bigView addSubview:nameLabel];
    
    
 
    
    
    UILabel *messageLabel = [Toos setUpWithUserLabel:newDic[@"content"] CGRect:CGRectMake(kWidthChange(15), CGRectGetMaxY(nameLabel.frame) + kWidthChange(5), kScreenWidth - kWidthChange(60), [Toos getSpaceLabelHeight:newDic[@"content"] withFont:[UIFont systemFontOfSize:kWidthChange(14)] withWidth:kScreenWidth - kWidthChange(60) jianju:2 suojin:2]) color:[UIColor clearColor] textColor:newColor(160, 169, 178, 1) textSize:kWidthChange(14)];
    [self.bigView addSubview:messageLabel];
    messageLabel.numberOfLines = 0;
    bigFrame.size.height = CGRectGetMaxY(messageLabel.frame) + kWidthChange(20);
    self.bigView.frame = bigFrame;
    
    UIButton *newBT = [UIButton buttonWithType:UIButtonTypeCustom];
    newBT.frame = CGRectMake(kScreenWidth - kWidthChange(30) - kWidthChange(35) , kWidthChange(15), kWidthChange(20), kWidthChange(20));
 
        [newBT setImage:[UIImage imageNamed:@"icon_6collection_delete"] forState:UIControlStateNormal];
        
    
    newBT.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [ self.bigView addSubview:newBT];
    
    
    [newBT addTarget:self action:@selector(clickMessage:) forControlEvents:UIControlEventTouchUpInside];
    
}

+(CGFloat)setUpWithBigHeightWithDic:(NSDictionary *)newDic {
    return kWidthChange(20) + kWidthChange(30) + kWidthChange(5) + [Toos getSpaceLabelHeight:newDic[@"content"] withFont:[UIFont systemFontOfSize:kWidthChange(14)] withWidth:kScreenWidth - kWidthChange(60)jianju:2 suojin:2] + kWidthChange(20);
    
    
    
}

-(void)clickMessage:(UIButton *)sender {
    if (self.ClickDelete) {
        self.ClickDelete(self.tempDic);
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
