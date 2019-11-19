//
//  AllSearchView.h
//  TTZS
//
//  Created by ios on 2018/4/12.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllSearchView : UIView

@property(nonatomic,retain)NSString *isFrom;

@property(nonatomic,retain)NSArray *dataArray;

@property(nonatomic,copy)void(^ClickBlock)(NSInteger tag);

@end
