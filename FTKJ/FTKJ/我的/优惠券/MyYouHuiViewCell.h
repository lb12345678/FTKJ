//
//  MyYouHuiViewCell.h
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyYouHuiViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView *BigView;



@property(nonatomic,retain)UILabel *moneyLabel;

@property(nonatomic,retain)UILabel *YongLabel;

@property(nonatomic,retain)UILabel *messageLabel;

@property(nonatomic,retain)UILabel *timeLabel;

//@property(nonatomic,retain)UILabel *numberLabel;
//
//@property(nonatomic,retain)UILabel *jiFenLabel;

@property(nonatomic,retain)UILabel *DuiHuanLabel;


@property(nonatomic,retain)UIImageView *stateImage;

@property(nonatomic,retain)NSString *isFrom;


@property(nonatomic,retain)NSDictionary *myDic;

@property(nonatomic,copy)void(^ClickYouHuiQuan)(NSDictionary *tempDic);



@property(nonatomic,copy)void (^ClickDuiHuan)(NSString *type);

- (void)setUpWithType:(NSDictionary *)newType isFrom:(NSString *)isType;
@end

NS_ASSUME_NONNULL_END
