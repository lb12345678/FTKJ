//
//  PGGLinScrillButtonView.h
//  PGGFrame
//
//  Created by IOS on 2017/9/20.
//  Copyright © 2017年 com.xiewei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PGGListScrollButtonDegelate <NSObject>
///选中的按钮的tag
-(void)selectTag:(int)tag;

@end

@interface PGGLinScrillButtonView : UIView
{
    UIScrollView *scv;
    NSMutableArray *arrbt;
}
///默认YES
@property (nonatomic , assign) BOOL isscroll;

///是否显示尾部的蒙层
@property (nonatomic , assign) BOOL isshowmeng;
///默认选择
@property (nonatomic , assign) int inomoselect;

@property (nonatomic , retain) NSMutableArray *arrbttitle;

@property (nonatomic , retain) UIButton *btselect;

@property (nonatomic , retain) id<PGGListScrollButtonDegelate>degelate;

@property(nonatomic,retain)NSString *isFrom;


-(void)selectbttag:(int)itag;

@end
