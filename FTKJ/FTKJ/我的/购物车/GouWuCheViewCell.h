//
//  GouWuCheViewCell.h
//  JZGL
//
//  Created by ios on 2019/8/9.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GouWuCheViewCell : UITableViewCell

@property(nonatomic,retain)UIButton *XuanZeBT;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UIImageView *bigImage;

@property(nonatomic,retain)UILabel *GuiGeLabel;

@property(nonatomic,retain)UILabel *nameLabel;

@property(nonatomic,retain)UILabel *moneyLabel;

@property(nonatomic,retain)UITextField *XiaoLabel;

@property(nonatomic,retain)UIButton *addBT;

@property(nonatomic,retain)UIButton *JianBT;

@property(nonatomic,retain)UIButton *deleteBT;

@property(nonatomic,retain)NSMutableDictionary *tempDic;

-(void)setUpWithBigDic:(NSMutableDictionary *)newDic;




@end

NS_ASSUME_NONNULL_END
