//
//  DownPickerView.h
//  KuaiPai
//
//  Created by ios on 2018/8/1.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownPickerView : UIView

@property(nonatomic,retain)NSMutableArray *dataArray;

- (void)setUpWithAnimation:(NSMutableArray *)newArray;

@property(nonatomic,copy)void(^ClickPeople)(id tempData);


@end
