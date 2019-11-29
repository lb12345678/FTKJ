//
//  SXViewCell.h
//  TTZS
//
//  Created by ios on 2018/4/16.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXViewCell : UITableViewCell

@property(nonatomic,retain)NSString *bigType;


@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UILabel *lineLabel;

@property(nonatomic,retain)UIButton *QuanBuBT;

@property(nonatomic,retain)NSMutableDictionary *myDic;

- (void)setUpWithNameLabel:(NSString *)name imageArray:(NSArray *)imageArray nsIndexPath:(NSIndexPath *)indexPath;

+ (CGFloat)heightWithMyName:(NSString *)name imageArray:(NSArray *)imageArray;
@end
