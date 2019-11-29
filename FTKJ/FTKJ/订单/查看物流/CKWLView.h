//
//  CKWLView.h
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CKWLView : UITableViewHeaderFooterView

@property(nonatomic,retain)UIView *bigView;

-(void)setUpWithNewBigDic:(NSDictionary *)tempDic;

+(CGFloat)setUpWithHeightWithBigDic:(NSDictionary *)tempDic;



@end

NS_ASSUME_NONNULL_END
