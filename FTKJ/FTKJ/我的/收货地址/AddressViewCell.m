//
//  AddressViewCell.m
//  KuaiPai
//
//  Created by libo on 2018/6/17.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "AddressViewCell.h"

@implementation AddressViewCell

-(UIView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(15), 0, kScreenWidth - kWidthChange(30), kWidthChange(143))];
        self.bigView.backgroundColor = [UIColor whiteColor];
        self.bigView.layer.masksToBounds = YES;
        self.bigView.layer.cornerRadius = 5;
    }
    return _bigView;
    
}


-(UIImageView *)lineImage {
    
    if (_lineImage == nil) {
        self.lineImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"upLine"]];
        self.lineImage.frame = CGRectMake(0, 0, kScreenWidth - kWidthChange(30), kWidthChange(3));
        
    }
    return _lineImage;
    
}


-(UILabel *)nameLabel {
    if (_nameLabel == nil) {
        self.nameLabel = [Toos setUpWithUserLabel:@"张老师" CGRect:CGRectMake(15, kWidthChange(15), kScreenWidth - 30, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(56, 65, 81, 1) textSize:kWidthChange(18)];
    }
    return _nameLabel;
}

-(UILabel *)phoneLabel {
    if (_phoneLabel == nil) {
        self.phoneLabel = [Toos setUpWithUserLabel:@"默认" CGRect:CGRectMake(15, CGRectGetMaxY(self.nameLabel.frame) + kWidthChange(15), kWidthChange(40), kWidthChange(20)) color:newColor(250, 185, 63, .6) textColor:newColor(195, 96, 35, 1) textSize:kWidthChange(14)];
        self.phoneLabel.layer.masksToBounds = YES;
        self.phoneLabel.layer.cornerRadius = kWidthChange(10);
        self.phoneLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _phoneLabel;
}

-(UILabel *)addressLabel {
    if (_addressLabel == nil) {
        self.addressLabel = [Toos setUpWithUserLabel:@"重庆市南岸区" CGRect:CGRectMake(CGRectGetMaxX(self.phoneLabel.frame) + kWidthChange(15), CGRectGetMaxY(self.nameLabel.frame) + kWidthChange(15), kScreenWidth - 60, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(170, 180, 188, 1) textSize:kWidthChange(14)];
    }
    return _addressLabel;
    
}


-(UILabel *)lineLabel {
    if (_lineLabel == nil) {
        self.lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(15, CGRectGetMaxY(self.addressLabel.frame) + kWidthChange(15), kScreenWidth - 30, 1) color:[UIColor lightGrayColor] textColor:RedColor textSize:13];
        self.lineLabel.alpha = .3;
    }
    return _lineLabel;
}



-(UIButton *)deleteBT {
    if (_deleteBT == nil) {
        self.deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.deleteBT setImage:[UIImage imageNamed:@"box38"] forState:UIControlStateNormal];
        self.deleteBT.frame = CGRectMake(kScreenWidth - kWidthChange(30) - [Toos textRect:@" 默认" textFont:[UIFont systemFontOfSize:kWidthChange(14)]] - kWidthChange(20) - 15, CGRectGetMaxY(_lineLabel.frame) ,  [Toos textRect:@"  默认" textFont:[UIFont systemFontOfSize:kWidthChange(14)]] + kWidthChange(20), kWidthChange(143) - CGRectGetMaxY(self.lineLabel.frame));
        [self.deleteBT setTitle:@"  删除" forState:UIControlStateNormal];
        [self.deleteBT setTitleColor:newColor(58, 58, 58, 1) forState:UIControlStateNormal];
        self.deleteBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    }
    return _deleteBT;
}


-(UIButton *)editBT {
    if (_editBT == nil) {
        self.editBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.editBT setImage:[UIImage imageNamed:@"box38-1"] forState:UIControlStateNormal];
        self.editBT.frame = CGRectMake(kScreenWidth - kWidthChange(30) - 20 - 2 *( [Toos textRect:@"  默认" textFont:[UIFont systemFontOfSize:kWidthChange(14)]] + kWidthChange(20)), CGRectGetMaxY(_lineLabel.frame), [Toos textRect:@"  默认" textFont:[UIFont systemFontOfSize:kWidthChange(14)]] + kWidthChange(20), kWidthChange(143) - CGRectGetMaxY(self.lineLabel.frame));
        [self.editBT setTitle:@"  编辑" forState:UIControlStateNormal];
        [self.editBT setTitleColor:newColor(58, 58, 58, 1) forState:UIControlStateNormal];
        self.editBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    }
    return _editBT;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.bigView];
        
         [self.bigView addSubview:self.lineImage];
        
        [self.bigView addSubview:self.nameLabel];
        [self.bigView addSubview:self.phoneLabel];
        [self.bigView addSubview:self.addressLabel];
        [self.bigView addSubview:self.lineLabel];
        
        [self.bigView addSubview:self.deleteBT];
        [self.bigView addSubview:self.editBT];
    }
    return self;
}

-(void)setUpWithNewName:(NSDictionary *)name {
   
    self.nameLabel.text = [NSString stringWithFormat:@"%@   %@",name[@"name"],name[@"mobile"]];
    CGRect phoneFrame = self.phoneLabel.frame;
    
    if ([name[@"default"]intValue] == 0) {
          phoneFrame.origin.x = 0;
        phoneFrame.size.width = 0;
    }else {
        phoneFrame.origin.x = 15;
        phoneFrame.size.width = kWidthChange(40);
        
        
    }
    
    
    
  
    self.phoneLabel.frame = phoneFrame;
    
    CGRect addressFrame = self.addressLabel.frame;
    addressFrame.origin.x = CGRectGetMaxX(phoneFrame) + 15;
    addressFrame.size.width = kScreenWidth - kWidthChange(30) - CGRectGetMaxX(phoneFrame) - 30;
    self.addressLabel.frame = addressFrame;
    self.addressLabel.text = [NSString stringWithFormat:@"%@%@",name[@"region"],name[@"address"]];
    
    
    
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
