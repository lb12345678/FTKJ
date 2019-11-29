//
//  PLViewCell.h
//  JZGL
//
//  Created by ios on 2019/8/14.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHStarRateView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JZPLViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView *smallImage;

@property(nonatomic,retain)UILabel *nameLabel;

@property(nonatomic,retain)UILabel *lineLabel;

@property(nonatomic,retain)UITextView *textView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UILabel *StarLabel;

@property(nonatomic,retain)XHStarRateView *StarView;

@property(nonatomic,retain)NSMutableDictionary *myDic;

@property(nonatomic,copy)void(^ClickImage)(int temp);


-(void)setUpWithMessage:(NSMutableDictionary *)newDic indexPath:(NSIndexPath *)indexPath;

+(CGFloat)tableViewSetHeight:(NSMutableDictionary *)newDic;




@end

NS_ASSUME_NONNULL_END
