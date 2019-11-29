//
//  SearchViewCell.h
//  KuaiPai
//
//  Created by ios on 2018/6/6.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>


//typedef void(^blockCategory)(NSString *newId);

@interface SearchViewCell : UITableViewCell

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)NSString *category;

@property(nonatomic,retain)NSArray *bigArray;
- (void)setUpWithMyBigView:(NSArray *)category interGer:(NSIndexPath *)indexPath;

+ (CGFloat)setUpWithHeightWithArray:(NSArray *)array;

@property(nonatomic,copy)void(^blockCategory)(NSInteger newId);

@property(nonatomic,copy)void(^deleteCategory)(NSInteger newId);

@end
