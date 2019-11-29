//
//  RightTableViewCell.h
//  JZGL
//
//  Created by ios on 2019/8/5.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RightTableViewCell : UITableViewCell

@property(nonatomic,retain)UIView *bigView;

-(void)setUpWithOneBigArray:(NSMutableArray *)dataArray;

+(CGFloat)tableViewHeightWithArray:(NSMutableArray *)dataArray;

@property(nonatomic,retain)NSMutableArray *dataArray;

@property(nonatomic,assign)NSInteger numberType;

@property(nonatomic,copy)void(^ClickBlock)(NSString *type);
@end

NS_ASSUME_NONNULL_END
