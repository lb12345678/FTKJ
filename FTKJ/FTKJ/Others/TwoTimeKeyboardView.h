//
//  TwoTimeKeyboardView.h
//  PGGFrame
//
//  Created by IOS on 2017/12/25.
//  Copyright © 2017年 com.xiewei. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TwoTimeKeyboardViewDegelate <NSObject>

-(void)TwochangetimeValue:(NSString *)strvalue andendvalue:(NSString *)strendvalue;

@end

@interface TwoTimeKeyboardView : UIView

<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
{
    
    NSArray *arrnowtime;
    
    
    NSMutableArray *arryear;
    NSMutableArray *arrmouth;
    NSMutableArray *arrday;
    NSMutableArray *arrhouar;
    NSMutableArray *arrmintes;
    
    NSString *stryear;
    NSString *strmouth;
    NSString *strday;
    NSString *strhouar;
    NSString *strmintes;
    
    NSMutableArray *arralltitlelb;
    
    
    
    ////
    UIView *viewtopbutton;
    UIButton *btnowtop;
    UIButton *btstart;
    UIButton *btend;
    
    ///
    UIView *viewbottombt;
    UIButton *btok;
    UIButton *btcancle;
    ///开始时间
    NSString *strstarttime;
    ///结束时间
    NSString *strendtime;
    
}
@property (nonatomic , retain) UIView *viewselect;

@property (nonatomic , retain) UIView *viewline1;

@property (nonatomic , retain) UIView *viewline2;

@property (nonatomic , retain) UIPickerView *pickview;

@property (nonatomic , retain) UILabel *lbyear;

@property (nonatomic , retain) UILabel *lbmouth;

@property (nonatomic , retain) UILabel *lbday;

@property (nonatomic , retain) UILabel *lbhouar;

@property (nonatomic , retain) UILabel *lbmintes;

@property (nonatomic , retain) id<TwoTimeKeyboardViewDegelate>degelate;

////多少列  最多5列
@property (nonatomic , assign) int iline;
///是否到当前时间 默认是no
@property (nonatomic , assign) BOOL isNotnowtime;

@property(nonatomic,retain)UITextField *startTimeTF;

@property(nonatomic,retain)UITextField *endTimeTF;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,assign)BOOL isEnd;

@end
