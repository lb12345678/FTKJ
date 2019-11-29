//
//  SPXQOneViewCell.m
//  JZGL
//
//  Created by ios on 2019/8/6.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "SPXQOneViewCell.h"

@implementation SPXQOneViewCell
-(UIImageView *)bigImage {
    if (_bigImage == nil) {
        self.bigImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        self.bigImage.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth);
        self.bigImage.userInteractionEnabled = YES;
        self.bigImage.backgroundColor = newColor(235, 235, 235, 1);
    }
    return _bigImage;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigImage];
        

    }
    return self;
}

-(void)setUpWithImage:(NSString *)imageUrl imageArray:(NSMutableArray *)imageArray  indexPath:(NSIndexPath *)indexPath  heightArray:(NSMutableArray *)heightArray{
    self.imageArray = imageArray;
    self.bigImage.tag = indexPath.row + 100;

    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:imageUrl]];

    CGRect imageFrame = self.bigImage.frame;
    imageFrame.size.height = [[heightArray objectAtIndex:indexPath.row]floatValue];
    self.bigImage.frame = imageFrame;
    [self.bigImage addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTap:)]];

}

-(void)clickTap:(UITapGestureRecognizer *)sender {
    UIImageView *imageView = (UIImageView *)sender.view;

    [AddXuanImage setupWithBigImage:self.imageArray imageView:imageView number:imageView.tag - 100 viewController:self.viewController];
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
