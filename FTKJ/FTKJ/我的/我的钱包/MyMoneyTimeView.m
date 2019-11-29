//
//  MyMoneyTimeView.m
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyMoneyTimeView.h"

/// 弹出日期类型
typedef NS_ENUM(NSInteger, MLDatePickerMode) {
    // 年月
    MLDatePickerModeYM = 0,         // yyyy-MM
    // 年月日
    MLDatePickerModeYMD = 1,        // yyyy-MM-dd
};


@interface MyMoneyTimeView()<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>{
    // 记录 年、月、日当前选择的位置
    NSInteger _yearIndex;
    NSInteger _monthIndex;
    NSInteger _dayIndex;
}

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UIPickerView *datePicker;

@property(nonatomic,retain)UITextField *startTimeTF;

@property(nonatomic,retain)UITextField *endTimeTF;


@property(nonatomic,retain)NSMutableArray *yearArray;

@property(nonatomic,retain)NSMutableArray *moneyArray;

@property(nonatomic,retain)NSMutableArray *dayArray;


@end

@implementation MyMoneyTimeView
-(NSMutableArray *)yearArray {
    
    if (_yearArray == nil) {
        self.yearArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _yearArray;
}

-(NSMutableArray *)moneyArray {
    
    if (_moneyArray == nil) {
        self.moneyArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _moneyArray;
}

-(NSMutableArray *)dayArray {
    
    if (_dayArray == nil) {
        self.dayArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dayArray;
    
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
   
    for (int i = 0; i <  [[Toos setUpWithTime:[Toos getCurrentTimestamp] foementData:@"YYYY"]intValue] - 2019; i++) {
        
        
        
        
    }
    
    
    
    
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .4;
    [self addSubview:self.alphaView];
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - downH - kWidthChange(340), kScreenWidth, kWidthChange(340))];
    self.bigView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bigView];
    
    
    UIButton *canculBT = [UIButton buttonWithType:UIButtonTypeCustom];
    canculBT.frame = CGRectMake(kWidthChange(20), 0, [Toos textRect:@"取消" textFont:[UIFont systemFontOfSize:kWidthChange(18)]], kWidthChange(50));
    [canculBT setTitle:@"取消" forState:UIControlStateNormal];
       [canculBT setTitleColor:newColor(133, 134, 135, 1) forState:UIControlStateNormal];
    canculBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(18)];
    [self.bigView addSubview:canculBT];
    
    UIButton *sureBT = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBT.frame = CGRectMake(kScreenWidth -kWidthChange(20) -[Toos textRect:@"取消" textFont:[UIFont systemFontOfSize:kWidthChange(18)]], 0, [Toos textRect:@"取消" textFont:[UIFont systemFontOfSize:kWidthChange(18)]], kWidthChange(50));
    [sureBT setTitle:@"完成" forState:UIControlStateNormal];
    [sureBT setTitleColor:newColor(241, 90, 0, 1) forState:UIControlStateNormal];
    sureBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(18)];
    [self.bigView addSubview:sureBT];
    
    
    UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0, CGRectGetMaxY(sureBT.frame), kScreenWidth, 1) color:lineColor_gary textColor:RedColor textSize:14];
    [self.bigView addSubview:lineLabel];
    
    for (int i = 0; i < 2; i++) {
        
        UITextField *timeTF = [[UITextField alloc]initWithFrame:CGRectMake(kWidthChange(20) + i * (kScreenWidth - kWidthChange(40)) / 2, CGRectGetMaxY(lineLabel.frame) + kWidthChange(25), (kScreenWidth - kWidthChange(40)) / 2 - kWidthChange(50), kWidthChange(40))];
        timeTF.textColor = newColor(250, 83, 0, 1);
        
        if (i == 0) {
             timeTF.placeholder = @"开始日期";
        }else {
            
            
             timeTF.placeholder = @"结束日期";
        }
        
       
        timeTF.font = [UIFont systemFontOfSize:kWidthChange(16)];
        timeTF.textAlignment = NSTextAlignmentCenter;
        if ( i == 0) {
            self.startTimeTF = timeTF;
        }else {
            
             self.endTimeTF = timeTF;
            
        }
        [self.bigView addSubview:timeTF];
        
        UILabel *timeLineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(20) + i * (kScreenWidth - kWidthChange(40)) / 2, CGRectGetMaxY(timeTF.frame), (kScreenWidth - kWidthChange(40)) / 2 - kWidthChange(50), kWidthChange(1)) color:lineColor_gary textColor:RedColor textSize:14];
        [self.bigView addSubview:timeLineLabel];
        
    }
    
    self.datePicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, kWidthChange(50), kScreenWidth, kWidthChange(200))];
    self.datePicker.backgroundColor = [UIColor whiteColor];
    
    self.datePicker.showsSelectionIndicator = YES;
    
    self.datePicker.delegate = self;
    
    self.datePicker.dataSource = self;
    
    
    [self.bigView addSubview:self.datePicker];
    
    
    
    [self.datePicker reloadAllComponents];
    
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.textColor = [UIColor colorWithRed:51.0/255
                                                green:51.0/255
                                                 blue:51.0/255
                                                alpha:1.0];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:kWidthChange(14)]];
    }
    
    pickerLabel.text = [self pickerView:pickerView
                            titleForRow:row
                           forComponent:component];
    
    
    return pickerLabel;
    
}



//返回列的数量
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    
    
    return 3;
    
    
    
    
    
}
//返回每列中行的数量
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        return self.yearArray.count;
    }
    
    if (component == 1) {
        return self.moneyArray.count;
    }
    
    
    
    
    
    return self.dayArray.count;
    
    
}
//返回列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    
    return kScreenWidth / 3;
    
}
//返回行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return kWidthChange(60);
}
//为每列中的每行设置标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    
    
    
    if (component == 0) {
        
        
        return [NSString stringWithFormat:@"%@",[self.yearArray objectAtIndex:row]];
    }
    if (component == 0) {
        
        
        return [NSString stringWithFormat:@"%@",[self.moneyArray objectAtIndex:row]];
    }
    
    return  [NSString stringWithFormat:@"%@",[self.dayArray objectAtIndex:row]];
    
}
//当已经选中列中的行后从新加载下一列的内容和属性
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    
    
    
    
    
}

-(void)clickCanCul:(UIButton *)sender {
    
    self.hidden = YES;
    
}

-(void)clickBayBT:(UIButton *)sender {
    
    
//    if ([Toos isBlank:self.dataStr]) {
//        return;
//
//    }
//    if ([Toos isBlank:self.timeStr]) {
//        return;
//
//    }
//
//
//    //    if ([Toos timeSwitchTimestamp:self.timeStr andFormatter:@"HH:mm"] > [Toos timeSwitchTimestamp:self.EndTimeStr andFormatter:@"HH:mm"] ) {
//    //        [Toos setUpWithMBP:@"结束时间不能早于开始时间" UIView:[UIApplication sharedApplication].keyWindow];
//    //        return;
//    //    }
//    //
//    //    if ([Toos timeSwitchTimestamp:self.timeStr andFormatter:@"HH:mm"] == [Toos timeSwitchTimestamp:self.EndTimeStr andFormatter:@"HH:mm"] ) {
//    //        [Toos setUpWithMBP:@"结束时间不能等于开始时间" UIView:[UIApplication sharedApplication].keyWindow];
//    //        return;
//    //    }
//
//    if (self.ClickBlock) {
//        self.hidden = YES;
//        self.ClickBlock([NSString stringWithFormat:@"%@-%@",self.dataStr,self.timeStr]);
//        //        self.ClickBlock(<#NSString * _Nonnull timeStr#>)(self.dataStr, self.timeStr,self.EndTimeStr);
//        self.timeStr = @"";
//        self.dataStr = @"";
//    }
//
    
    
}






@end
