//
//  YYBYTimeView.m
//  FTKJ
//
//  Created by ios on 2019/11/20.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "YYBYTimeView.h"

@interface YYBYTimeView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UIPickerView *datePicker;

@property(nonatomic,retain)NSString *dataStr;

@property(nonatomic,retain)NSString *timeStr;

@property(nonatomic,retain)NSMutableArray *dataArray;


@end




@implementation YYBYTimeView


-(NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    
    return _dataArray;
}


-(void)layoutSubviews {
    
    [self.dataArray addObject:@{@"title":@"2019/11/7",@"message":@"早上08:00～12:00"}];
    
     [self.dataArray addObject:@{@"title":@"2019/11/8",@"message":@"下午14:00～18:00"}];
    
    
     [self.dataArray addObject:@{@"title":@"2019/11/9",@"message":@"晚上19:00～22:00"}];
    
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.alpha = .5;
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.alphaView];
    
    
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - kWidthChange(310), kScreenWidth, kWidthChange(340))];
    self.bigView.layer.masksToBounds = YES;
    self.bigView.layer.cornerRadius = 10;
    self.bigView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bigView];
    
    
    
    
    UILabel *middenLabel = [Toos setUpWithUserLabel:@"预约服务时间" CGRect:CGRectMake(kWidthChange(20),kWidthChange(15) , kScreenWidth - kWidthChange(40), kWidthChange(50)) color:[UIColor whiteColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(14)];
  
    [self.bigView addSubview:middenLabel];
    middenLabel.font = [UIFont systemFontOfSize:kWidthChange(17) weight:UIFontWeightBold];
    
    
    UIButton *canculBT = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    [canculBT setImage:[UIImage imageNamed:@"box22"] forState:UIControlStateNormal];
    canculBT.frame = CGRectMake(kScreenWidth - kWidthChange(50), kWidthChange(35),kWidthChange(30), kWidthChange(30));
    [canculBT addTarget:self action:@selector(clickCanCul:) forControlEvents:UIControlEventTouchUpInside];
    [self.bigView addSubview:canculBT];
    

    UILabel *messageLabel = [Toos setUpWithUserLabel:@"注：单个预约订单每月可修改两次机会" CGRect:CGRectMake(kWidthChange(20),kWidthChange(15) , kScreenWidth - kWidthChange(40), kWidthChange(50)) color:[UIColor whiteColor] textColor:newColor(153, 154, 155, 1) textSize:kWidthChange(14)];
    
   
  
    if ([self.bigType intValue] == 1) {
         [self.bigView addSubview:messageLabel];
    }
    
  
    self.datePicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, kWidthChange(50), kScreenWidth, kWidthChange(180))];
    self.datePicker.backgroundColor = [UIColor whiteColor];
    
    self.datePicker.showsSelectionIndicator = YES;
    
    self.datePicker.delegate = self;
    
    self.datePicker.dataSource = self;
    
    
    [self.bigView addSubview:self.datePicker];
    
    

    [self.datePicker reloadAllComponents];
    
    
    
    UIButton *bayBT = [UIButton buttonWithType:UIButtonTypeCustom];
    bayBT.frame = CGRectMake(kWidthChange(35), CGRectGetMaxY(self.datePicker.frame), kScreenWidth - kWidthChange(70), kWidthChange(50));
    bayBT.backgroundColor = newColor(230, 21, 50, 1);
    bayBT.layer.masksToBounds = YES;
    bayBT.layer.cornerRadius = kWidthChange(25);
    [bayBT setTitle:@"确定" forState:UIControlStateNormal];
    [bayBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
    bayBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    [self.bigView addSubview:bayBT];
    [bayBT addTarget:self action:@selector(clickBayBT:) forControlEvents:UIControlEventTouchUpInside];
    
    self.dataStr = [self.dataArray objectAtIndex:0][@"title"];
     self.timeStr = [self.dataArray objectAtIndex:0][@"message"];
    
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
    
    
    
    
    
    
    
    return self.dataArray.count;
    
    
}
//返回列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    
    return kScreenWidth / 2;
    
}
//返回行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return kWidthChange(60);
}
//为每列中的每行设置标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    
    
    
    if (component == 0) {
        
      
        return [NSString stringWithFormat:@"%@",[self.dataArray objectAtIndex:row][@"title"]];
    }
    
    
    return  [NSString stringWithFormat:@"%@",[self.dataArray objectAtIndex:row][@"message"]];
    
}
//当已经选中列中的行后从新加载下一列的内容和属性
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    
    
   
    
    
}

-(void)clickCanCul:(UIButton *)sender {
    
    self.hidden = YES;
    
}

-(void)clickBayBT:(UIButton *)sender {
    
    
    if ([Toos isBlank:self.dataStr]) {
        return;
        
    }
    if ([Toos isBlank:self.timeStr]) {
        return;
        
    }
   
    
//    if ([Toos timeSwitchTimestamp:self.timeStr andFormatter:@"HH:mm"] > [Toos timeSwitchTimestamp:self.EndTimeStr andFormatter:@"HH:mm"] ) {
//        [Toos setUpWithMBP:@"结束时间不能早于开始时间" UIView:[UIApplication sharedApplication].keyWindow];
//        return;
//    }
//
//    if ([Toos timeSwitchTimestamp:self.timeStr andFormatter:@"HH:mm"] == [Toos timeSwitchTimestamp:self.EndTimeStr andFormatter:@"HH:mm"] ) {
//        [Toos setUpWithMBP:@"结束时间不能等于开始时间" UIView:[UIApplication sharedApplication].keyWindow];
//        return;
//    }
    
    if (self.ClickBlock) {
        self.hidden = YES;
        self.ClickBlock([NSString stringWithFormat:@"%@-%@",self.dataStr,self.timeStr]);
//        self.ClickBlock(<#NSString * _Nonnull timeStr#>)(self.dataStr, self.timeStr,self.EndTimeStr);
        self.timeStr = @"";
        self.dataStr = @"";
    }
    
    
    
}










@end
