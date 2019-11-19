//
//  GeneralView.m
//  TTZS
//
//  Created by ios on 2018/4/13.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "GeneralView.h"
#import "XHDatePickerView.h"

@interface GeneralView()<UITextFieldDelegate>

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UILabel *beginLabel;

@property(nonatomic,retain)UILabel *endLabel;

@property(nonatomic,retain)UITextField *XiangMuTF;


@end



@implementation GeneralView


-(UIView *)setUpWithOneBigView:(NSString *)isFrom {
    
    
    self.bigView = [[UIView alloc]init];
    self.bigView.backgroundColor = [UIColor whiteColor];
    if ([isFrom isEqualToString:@"1"]) {
         self.bigView.frame = CGRectMake(0, 0, kScreenWidth, kHeightChange(30) + kHeightChange(28) * 2);
    }else {
         self.bigView.frame = CGRectMake(0, 0, kScreenWidth, kHeightChange(20) + kHeightChange(28) );
    }
  
//    UILabel *timeLabel = [Toos setUpWithUserLabel:@"查看时间" CGRect:CGRectMake(0, kHeightChange(10), kWidthChange(78), kHeightChange(28)) color:[UIColor clearColor] textColor:newColor(57, 57, 57, 1) textSize:kWidthChange(14)];
//
//    timeLabel.textAlignment = NSTextAlignmentCenter;
//    [self.bigView addSubview:timeLabel];
    
    UIButton *beginTimeBT = [UIButton buttonWithType:UIButtonTypeCustom];
    beginTimeBT.frame = CGRectMake(12, kHeightChange(10), kWidthChange(129), kHeightChange(28));
    
    
    beginTimeBT.layer.cornerRadius = 2;
    beginTimeBT.layer.masksToBounds = YES;
    beginTimeBT.layer.borderWidth = 1;
    beginTimeBT.layer.borderColor = newColor(202, 202, 202, 1).CGColor;
    
    
    [self.bigView addSubview:beginTimeBT];
    
    [beginTimeBT addTarget:self action:@selector(clickBeginTime:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    self.beginLabel = [Toos setUpWithUserLabel:@"开始日期" CGRect:CGRectMake(kWidthChange(10),0 , kWidthChange(96), kHeightChange(28)) color:[UIColor clearColor] textColor:newColor(179, 179, 179, 1) textSize:kWidthChange(13)];
  
    
    [beginTimeBT addSubview:self.beginLabel];
    
    self.beginLabel.userInteractionEnabled = NO;
    
    
    UIImageView *beginImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"日期选择"]];
    beginImage.frame = CGRectMake(kWidthChange(129) - kWidthChange(14) - kHeightChange(5), kHeightChange(28) / 2 - kWidthChange(14) / 2, kWidthChange(14), kWidthChange(14));
    [beginTimeBT addSubview:beginImage];
    
    
    UILabel *hengLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(CGRectGetMaxX(beginTimeBT.frame) + kWidthChange(5), kHeightChange(10) + kHeightChange(28) / 2 - .5, kWidthChange(10), 1) color:[UIColor blackColor] textColor:[UIColor blackColor] textSize:kWidthChange(16)];
    hengLabel.alpha = .2;
    [self.bigView addSubview:hengLabel];
    
    
    
    UIButton *endTimeBT = [UIButton buttonWithType:UIButtonTypeCustom];
    endTimeBT.frame = CGRectMake(CGRectGetMaxX(hengLabel.frame) + kWidthChange(5), kHeightChange(10), kWidthChange(129), kHeightChange(28));
    endTimeBT.layer.cornerRadius = 2;
    endTimeBT.layer.masksToBounds = YES;
    endTimeBT.layer.borderWidth = 1;
    endTimeBT.layer.borderColor = newColor(202, 202, 202, 1).CGColor;
    [self.bigView addSubview:endTimeBT];
    self.endLabel = [Toos setUpWithUserLabel:@"结束日期" CGRect:CGRectMake(kWidthChange(10), 0, kWidthChange(96), kHeightChange(28)) color:[UIColor clearColor] textColor:newColor(179, 179, 179, 1) textSize:kWidthChange(13)];
    self.endLabel.userInteractionEnabled = NO;
  
    
    [endTimeBT addSubview:self.endLabel];
    [endTimeBT addTarget:self action:@selector(clickEndTime:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *endImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"日期选择"]];
    endImage.frame = CGRectMake(kWidthChange(129) - kWidthChange(14) - kHeightChange(5), kHeightChange(28) / 2 - kWidthChange(14) / 2, kWidthChange(14), kWidthChange(14));
    [endTimeBT addSubview:endImage];
    
    
    UIButton *QRTimeBT = [UIButton buttonWithType:UIButtonTypeCustom];
    QRTimeBT.frame = CGRectMake(CGRectGetMaxX(endTimeBT.frame) + kWidthChange(10), kHeightChange(10), kWidthChange(71), kHeightChange(29));
    QRTimeBT.layer.masksToBounds = YES;
    QRTimeBT.layer.cornerRadius = kHeightChange(29) / 2;
    QRTimeBT.backgroundColor = newColor(245, 61, 5, 1);
    [QRTimeBT setTitle:@"查询" forState:UIControlStateNormal];
    [QRTimeBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.bigView addSubview:QRTimeBT];
    QRTimeBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    [QRTimeBT addTarget:self action:@selector(queRenShiJian:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *SouSuoLabel = [Toos setUpWithUserLabel:@"搜索项目" CGRect:CGRectMake(0,  CGRectGetMaxY(QRTimeBT.frame) + 10, kWidthChange(78), kHeightChange(28)) color:[UIColor clearColor] textColor:newColor(57, 57, 57, 1) textSize:kWidthChange(14)];
    
    SouSuoLabel.textAlignment = NSTextAlignmentCenter;
    
    
    
    self.XiangMuTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(SouSuoLabel.frame), CGRectGetMaxY(QRTimeBT.frame) + kHeightChange(10), kWidthChange(96) * 2 + kWidthChange(20), kHeightChange(28))];
    self.XiangMuTF.delegate = self;
    
    self.XiangMuTF.placeholder = @"  请输入搜索的项目";
    
    [self.XiangMuTF setValue:[UIFont systemFontOfSize:kWidthChange(14)] forKeyPath:@"_placeholderLabel.font"];
    self.XiangMuTF.font = [UIFont systemFontOfSize:kWidthChange(14)];
    self.XiangMuTF.textColor = newColor(57, 57, 57, 1);
    self.XiangMuTF.layer.cornerRadius = 2;
    self.XiangMuTF.layer.masksToBounds = YES;
    self.XiangMuTF.layer.borderWidth = 1;
    self.XiangMuTF.layer.borderColor = newColor(202, 202, 202, 1).CGColor;
    
    
    UIButton *QRSearchBT = [UIButton buttonWithType:UIButtonTypeCustom];
    QRSearchBT.frame = CGRectMake(CGRectGetMaxX(endTimeBT.frame) + kWidthChange(10), CGRectGetMaxY(QRTimeBT.frame) + kHeightChange(10), kWidthChange(61), kHeightChange(29));
    QRSearchBT.layer.masksToBounds = YES;
    QRSearchBT.layer.cornerRadius = 2;
    QRSearchBT.backgroundColor = newColor(44, 186, 168, 1);
    [QRSearchBT setTitle:@"确认" forState:UIControlStateNormal];
    [QRSearchBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    QRSearchBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    
    if ([isFrom isEqualToString:@"1"]) {
         [self.bigView addSubview:SouSuoLabel];
          [self.bigView addSubview:self.XiangMuTF];
         [self.bigView addSubview:QRSearchBT];
    }
    
      [QRSearchBT addTarget:self action:@selector(queRenXiangMu:) forControlEvents:UIControlEventTouchUpInside];
   
    return self.bigView;
    
}
- (void)clickBeginTime:(UIButton *)sender {
    [[IQKeyboardManager sharedManager] resignFirstResponder];
    
    __weak typeof(self) weakSelf = self;
    
    XHDatePickerView *pickerView = [[XHDatePickerView alloc] initWithSingleDate:^(NSDate *date) {
        
        weakSelf.beginLabel.text = [date stringWithFormat:@"yyyy-MM-dd"];
       
        
    } dismissBlock:nil];
    
    pickerView.datePickerStyle = DateStyleShowYearMonthDay;
    pickerView.minLimitDate = [NSDate date:@"2001-2-28 12:22" WithFormat:@"yyyy-MM-dd HH:mm"];
    pickerView.maxLimitDate = [NSDate date:@"2050-2-28 12:12" WithFormat:@"yyyy-MM-dd HH:mm"];
    
    [pickerView show];
}

- (void)clickEndTime:(UIButton *)sender {
    [[IQKeyboardManager sharedManager] resignFirstResponder];
    
    __weak typeof(self) weakSelf = self;
    
    XHDatePickerView *pickerView = [[XHDatePickerView alloc] initWithSingleDate:^(NSDate *date) {
        
        weakSelf.endLabel.text = [date stringWithFormat:@"yyyy-MM-dd"];
       
        
    } dismissBlock:nil];
    
    pickerView.datePickerStyle = DateStyleShowYearMonthDay;
    pickerView.minLimitDate = [NSDate date:@"2001-2-28 12:22" WithFormat:@"yyyy-MM-dd HH:mm"];
    pickerView.maxLimitDate = [NSDate date:@"2050-2-28 12:12" WithFormat:@"yyyy-MM-dd HH:mm"];
    
    [pickerView show];
}

#pragma mark---确认项目
- (void)queRenXiangMu:(UIButton *)sender {
    [self.XiangMuTF resignFirstResponder];
    if (self.XiangMuTF.text.length == 0) {
        [Toos setUpWithMBP:@"请输入项目" UIView:self.bigView];
        return;
    }
    self.xaingMu(self.XiangMuTF.text);
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
#pragma mark---确认时间
- (void)queRenShiJian:(UIButton *)sender {
    if (self.beginLabel.text.length == 0) {
        [Toos setUpWithMBP:@"请输入开始时间" UIView:self.bigView];
        return;
    }
    
    if (self.endLabel.text.length == 0) {
        [Toos setUpWithMBP:@"请输入结束时间" UIView:self.bigView];
        return;
    }
    self.time(self.beginLabel.text, self.endLabel.text);
}

- (CGFloat)setUpWithMyImageCount:(NSMutableArray *)imageArray bigView:(UIView *)bigView number:(NSInteger)number weight:(CGFloat)weight height:(CGFloat)height weightJianJu:(CGFloat)weightJianJu heightJianJu:(CGFloat)heightJianJu chaWeight:(CGFloat)chaWight chaHeight:(CGFloat)chaHeight isFrom:(NSString *)isFrom {
    CGFloat Bigh;
    if ([Toos isBlank:imageArray]) {
        Bigh = 0;
    }else {
        
        
        
        int lie=0;
        
        lie= number;
        int Allcount= imageArray.count;
        int line=Allcount/lie;
        if(Allcount%lie>0)
            line++;
        
        
        
        
        Bigh = line  * height + (line - 1 ) * heightJianJu ;
        
        
        
        
        
        
        
        
        CGFloat w = weightJianJu;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
        CGFloat h = 0;//用来控制button距离父视图的高
        for (int i = 0; i < imageArray.count; i++) {
            UIImageView *view = [[UIImageView alloc]init];
            view.tag = i;
            //根据计算文字的大小
            
            //为button赋值
            //label.text = array;
            view.backgroundColor = [UIColor whiteColor];
            //设置button的frame
            view.frame = CGRectMake( w, h , weight ,height);
            
            //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
            if(w + weight > bigView.frame.size.width){
                w = 0; //换行时将w置为0
                h = h + view.frame.size.height + heightJianJu ;//距离父视图也变化
                view.frame = CGRectMake( w, h, weight,height);//重设button的frame
            }
            w = view.frame.size.width + view.frame.origin.x + weightJianJu;
            
            view.image = [UIImage imageNamed:[imageArray objectAtIndex:i]];
            view.userInteractionEnabled = YES;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(weight - chaWight, 0, chaWight, chaHeight);
            
            [button setImage:[UIImage imageNamed:@"×"] forState:UIControlStateNormal];
            
            
            button.tag = i + 100;
             [bigView addSubview:view];
            if ([isFrom isEqualToString:@"1"]) {
                if (i == imageArray.count - 1) {
                    
                    
                    
                    UITapGestureRecognizer *tapHeader = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHeader:)];
                  
                        [view addGestureRecognizer:tapHeader];
                        view.hidden = NO;
                    
                    
                    
                    
                }else {
                    
                    
                   
                        [view addSubview:button];
                        [button addTarget:self action:@selector(clickDelter:) forControlEvents:UIControlEventTouchUpInside];
                    
                }
               
                
                if (i == imageArray.count - 1) {
                    view.image = [UIImage imageNamed:@"添加图片"];
                }else {
                    [view sd_setImageWithURL:[NSURL URLWithString:[imageArray objectAtIndex:i]]];
                }
               
            }else {
                
                [view sd_setImageWithURL:[NSURL URLWithString:[imageArray objectAtIndex:i]]];
                
                
                
                   UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chaKanXiangCe:)];
                
                [view addGestureRecognizer:tap];
            }
            
            
            
            
            }
            
          
        
    }
    
    
    return Bigh;
}
#pragma mark---添加图片
- (void)clickHeader:(UITapGestureRecognizer *)sender {
    
    UIImageView *image = (UIImageView *)sender.view;
    
    
    self.AddTP(image.tag);
}
#pragma mark----删除图片
-(void)clickDelter:(UIButton *)sender {
    self.ShanChu(sender.tag);
}

#pragma mark-----查看大图
-(void)chaKanXiangCe:(UITapGestureRecognizer *)sender {
    UIImageView *bigImage = (UIImageView *)sender.view;
    
    
    [AddXuanImage setupWithBigImage:self.imageArray imageView:bigImage number:bigImage.tag viewController:self.MyView];
}


@end
