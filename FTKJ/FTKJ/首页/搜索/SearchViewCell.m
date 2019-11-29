//
//  SearchViewCell.m
//  KuaiPai
//
//  Created by ios on 2018/6/6.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "SearchViewCell.h"
//#import "SearchJieGuoViewController.h"

//#import "SPLBViewController.h"

@implementation SearchViewCell

-(UIView *)bigView {
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
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
-(void)setUpWithMyBigView:(NSArray *)category interGer:(NSIndexPath *)indexPath{
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if ([Toos isBlank:category]) {
        
    }else {
        
        self.bigArray = category;
        
        CGFloat padding = kWidthChange(20);
        
        CGFloat titBtnX =  kWidthChange(20);
        CGFloat titBtnY = kHeightChange(0);
        CGFloat titBtnH = kWidthChange(30);
        CGFloat h = 0;
        for (int i = 0; i < category.count; i++) {
            UILabel *smallLabel = [Toos setUpWithUserLabel:[category objectAtIndex:i][@"keywords"] CGRect:CGRectMake(10, titBtnY ,kScreenWidth -  20 ,40) color:newColor(241, 242, 244, 1) textColor:newColor(110, 111, 112, 1) textSize:kWidthChange(14)];
            
            
            smallLabel.textAlignment = NSTextAlignmentCenter;
            //计算文字大小
            CGSize titleSize = [category[i][@"keywords"] boundingRectWithSize:CGSizeMake(MAXFLOAT, titBtnH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:smallLabel.font} context:nil].size;
            CGFloat titBtnW = titleSize.width + 2 * padding;
            if ((titBtnX + titBtnW) > kScreenWidth - kWidthChange(40)) {
                titBtnX = kWidthChange(20);
                titBtnY += titBtnH + padding  ;
               
            }
            smallLabel.layer.masksToBounds = YES;
            smallLabel.layer.cornerRadius = kWidthChange(15);
//            smallLabel.layer.borderWidth = 1;
//            smallLabel.layer.borderColor = newColor(172, 172, 172, 1).CGColor;
            //设置按钮的位置
            
            //设置按钮的位置
            smallLabel.frame = CGRectMake(titBtnX, titBtnY, titBtnW, titBtnH);
            
            titBtnX += titBtnW + padding ;
            [self.bigView addSubview:smallLabel];
            
            smallLabel.tag = 100 + i + indexPath.section * 100;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLeiBie:)];
            smallLabel.userInteractionEnabled = YES;
            [smallLabel addGestureRecognizer:tap];
            
            
            UIButton *delete = [UIButton buttonWithType:UIButtonTypeCustom];
            delete.frame = CGRectMake(smallLabel.frame.size.width - kWidthChange(15), kWidthChange(30) / 2 - kWidthChange(15) / 2, kWidthChange(15), kWidthChange(15));
            [delete setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
            [delete addTarget:self action:@selector(clickDelte:) forControlEvents:UIControlEventTouchUpInside];
            
            
            if (indexPath.section == 1) {
                
            
            if ([DataBaseManager sharedFMDBManager].isDelete == YES) {
                [smallLabel addSubview:delete];
            }
            }
            
        }
        h = titBtnH + titBtnY;
        
        
        CGRect bigFrame = self.bigView.frame;
        bigFrame.size.height = h;
        self.bigView.frame = bigFrame;
    }
    
}

+(CGFloat)setUpWithHeightWithArray:(NSArray *)array {
    
    if ([Toos isBlank:array]) {
        return 0;
    }
    
    CGFloat padding = kWidthChange(20);
    
    CGFloat titBtnX =  kWidthChange(20);
    CGFloat titBtnY = kHeightChange(0);
    CGFloat titBtnH = kWidthChange(30);
    CGFloat h = 0;
    for (int i = 0; i < array.count; i++) {
      
        //计算文字大小
        CGSize titleSize = [array[i][@"keywords"] boundingRectWithSize:CGSizeMake(MAXFLOAT, titBtnH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kWidthChange(15)]} context:nil].size;
        CGFloat titBtnW = titleSize.width + 2 * padding;
        if ((titBtnX + titBtnW) > kScreenWidth - kWidthChange(40)) {
            titBtnX = kWidthChange(20);
            titBtnY += titBtnH + padding  ;
            
            
            
            
            
        }else {
            
           
        
        }
      
        
       titBtnX += titBtnW + padding + 5;
        
        
    }
    
     h = titBtnY + titBtnH;
    return h + 15;
    
    

}

- (void)clickLeiBie:(UITapGestureRecognizer *)sender {

    UILabel *nameLabel = (UILabel *)sender.view;

    self.blockCategory(nameLabel.tag);
    
    
    
//    self.viewController.hidesBottomBarWhenPushed = YES;
//    SearchJieGuoViewController *cateGory = [[SearchJieGuoViewController alloc]init];
//    cateGory.searchText = [self.bigArray objectAtIndex:(nameLabel.tag - 100) % 100][@"keywords"];
//    cateGory.isCategory = [self.bigArray objectAtIndex:(nameLabel.tag - 100) % 100][@"title"];;
//    [self.viewController.navigationController pushViewController:cateGory animated:YES];


//    self.blockCategory(@"1");
}

- (void)clickDelte:(UIButton *)sender {
    self.deleteCategory(sender.superview.tag);
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
