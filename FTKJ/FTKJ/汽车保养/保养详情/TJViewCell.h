//
//  TJViewCell.h
//  JZGL
//
//  Created by ios on 2019/8/8.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TJViewCell : UITableViewCell
@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)NSMutableArray *dataArray;

- (void)setUpWithBigArray:(NSArray *)bigArray;

+ (CGFloat)heightWithBIgArray:(NSArray *)array;

@property(nonatomic,copy)void(^ClickBlock)(NSString *str);



@end

NS_ASSUME_NONNULL_END
