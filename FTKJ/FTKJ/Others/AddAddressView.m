//
//  AddAddressView.m
//  GZSC
//
//  Created by ios on 2018/9/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "AddAddressView.h"

@interface AddAddressView()<UIPickerViewDelegate,UIPickerViewDataSource>


@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UIPickerView *picKerView;


@property(nonatomic,retain)UIView *AddressView;


@property(nonatomic,retain)NSMutableArray *jieDaoArray;


@property(nonatomic,retain)NSString *jieDaoString;

@property(nonatomic,retain)NSMutableArray *shengArray;

@property(nonatomic,retain)NSMutableArray *shiArray;

@property(nonatomic,retain)NSMutableArray *quArray;

@property(nonatomic,retain)NSDictionary *shengDic;

@property(nonatomic,retain)NSDictionary *shiDic;

@property(nonatomic,retain)NSDictionary *QuDic;

@property(nonatomic,retain)NSDictionary *JieDaoDic;

@property(nonatomic,retain)UIButton *successButton;

@property(nonatomic,retain)NSURLSessionDataTask *shengTask;

@property(nonatomic,retain)NSURLSessionDataTask *shiTask;

@property(nonatomic,retain)NSURLSessionDataTask *quTask;



@end



@implementation AddAddressView

-(NSMutableArray *)shengArray {
    if (_shengArray == nil) {
        self.shengArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _shengArray;
}

-(NSMutableArray *)shiArray {
    if (_shiArray == nil) {
        self.shiArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _shiArray;
}

-(NSMutableArray *)quArray {
    if (_quArray == nil) {
        self.quArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _quArray;
}


-(NSMutableArray *)jieDaoArray {
    if (_jieDaoArray == nil) {
        self.jieDaoArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _jieDaoArray;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    
    self.alphaView.alpha = .3;
    [self addSubview:self.alphaView];
    
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.bigView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bigView];
    
  
    self.AddressView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kWidthChange(260))];
    self.AddressView.backgroundColor = [UIColor whiteColor];
    
    [self.bigView addSubview:self.AddressView];
    
    self.picKerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, kWidthChange(50), kScreenWidth, kWidthChange(200))];
    self.picKerView.backgroundColor = [UIColor whiteColor];
    
      self.picKerView.showsSelectionIndicator = NO;
    
    self.picKerView.delegate = self;
    
    self.picKerView.dataSource = self;
    
    
    [self.AddressView addSubview:self.picKerView];
    UIButton *canculButton = [UIButton buttonWithType:UIButtonTypeCustom];
    canculButton.frame = CGRectMake(12, kWidthChange(15), [Toos textRect:@"取消" textFont:[UIFont systemFontOfSize:kWidthChange(14)]], kWidthChange(20));
    [canculButton setTitle:@"取消" forState:UIControlStateNormal];
    canculButton.backgroundColor = [UIColor whiteColor];
    [canculButton setTitleColor:newColor(245, 61, 5, 1) forState:UIControlStateNormal];
    canculButton.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    [canculButton addTarget:self action:@selector(handleClickCanculWithJieDao:) forControlEvents:UIControlEventTouchUpInside];
    [self.AddressView addSubview:canculButton];
    
    self.successButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.successButton.frame = CGRectMake(kScreenWidth - 12 - [Toos textRect:@"取消" textFont:[UIFont systemFontOfSize:kWidthChange(14)]], kWidthChange(15), [Toos textRect:@"取消" textFont:[UIFont systemFontOfSize:kWidthChange(14)]], kWidthChange(20));
    [self.successButton setTitle:@"完成" forState:UIControlStateNormal];
    self.successButton.backgroundColor = [UIColor whiteColor];
  
    [self.successButton setTitleColor:newColor(245, 61, 5, 1) forState:UIControlStateNormal];
    self.successButton.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    [self.successButton addTarget:self action:@selector(handleClickSuccessWithJieDao:) forControlEvents:UIControlEventTouchUpInside];
    [self.AddressView addSubview:self.successButton];
    
    

    [self setUpWithAnimaTion:self.isFrom];
    
   
    
    
  
}

-(void)setUpWithAnimaTion:(NSString *)isFrom {
    self.isFrom = isFrom;
    self.type = isFrom;
    [self.picKerView reloadAllComponents];
    self.hidden = NO;
    [UIView animateWithDuration:0.25 animations:^{
       
        CGRect addressFrame = self.AddressView.frame;
        addressFrame.origin.y = kScreenHeight - kWidthChange(260);
        self.AddressView.frame = addressFrame;
        
        
    }];
//    if ([self.isFrom isEqualToString:@"1"]) {
//        [self setUpWithSheng:@""];
//    }else {
//
//
//        [self setUpWithJiaDao];
//    }
    [self setUpWithgzxx];
    
}





#pragma mark----取消选择街
- (void)handleClickCanculWithJieDao:(UIButton *)sender {
    
    
    [UIView animateWithDuration:.5 animations:^{
        self.AddressView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kWidthChange(260));
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
    
    
    
    
}
#pragma mark----成功选择街道
- (void)handleClickSuccessWithJieDao:(UIButton *)sender {
    
//    if ([self.isFrom isEqualToString:@"1"]) {
//
//        if (self.ClickSheng) {
//            self.ClickSheng(self.shengDic, self.shiDic, self.QuDic);
//        }
//
//
//    }else if ([self.isFrom isEqualToString:@"2"]){
//        if (self.ClickAddress) {
//            self.ClickAddress(self.JieDaoDic);
//        }
//
//
//    }
    
    if (self.ClickAddress) {
        self.ClickAddress(self.JieDaoDic);
    }
    
    
    [UIView animateWithDuration:.5 animations:^{
        self.AddressView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kWidthChange(260));
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
    

    
    
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
    
//    if ([self.isFrom isEqualToString:@"2"]) {
//        return 1;
//    }else {
//
//        return 3;
//    }
    

    return 1;
    
    
}
//返回每列中行的数量
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
//    if ([self.isFrom isEqualToString:@"2"]) {
//        return self.jieDaoArray.count;
//    }
//    else {
//
//
//        if (component == 0) {
//            return self.shengArray.count;
//        }else if (component == 1){
//            return self.shiArray.count;
//
//        }else {
//            return self.quArray.count;
//        }
//
//    }
    return self.jieDaoArray.count;

}
//返回列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
//    if ([self.isFrom isEqualToString:@"2"]) {
//        return kScreenWidth;
//    }else {
//
//
//
//        return kScreenWidth / 3;
//    }
    return kScreenWidth;

}
//返回行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return kWidthChange(40);
}
//为每列中的每行设置标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
//    if ([self.isFrom isEqualToString:@"2"]) {
//        return [self.jieDaoArray objectAtIndex:row][@"name"];
//    }
//    else {
//
//
//        if (component == 0) {
//
//
//            return [self.shengArray objectAtIndex:row][@"name"];
//        }else if (component == 1) {
//
//
//
//            return  [self.shiArray objectAtIndex:row][@"name"];
//        }else {
//
//
//            return [self.quArray objectAtIndex:row][@"name"];
//        }
//    }

    if ([Toos isBlank:self.jieDaoArray]) {
        return @"";
    }
    return [self.jieDaoArray objectAtIndex:row][@"title"];

}
//当已经选中列中的行后从新加载下一列的内容和属性
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    NSString *shengId;
//    NSString *shiId;
//
//    if ([self.isFrom isEqualToString:@"2"]) {
//
//        self.JieDaoDic = [self.jieDaoArray objectAtIndex:row];
//    }
//    else {
//        if (component == 0) {
//
//            shengId = [self.shengArray objectAtIndex:row][@"id"];
//            self.shengDic = [self.shengArray objectAtIndex:row];
//
//            [self setUpWithShi:shengId];
//
////            [DataBaseManager sharedFMDBManager].shengDic = [self.sheng objectAtIndex:row];
//
//
//
//        }else if (component == 1){
//
//             self.shiDic = [self.shiArray objectAtIndex:row];
//            shiId = [self.shiArray objectAtIndex:row][@"id"];
//
//
//            [self setUpWithQu:shiId];
//
//
//
//
//        }else {
//
//             self.QuDic = [self.quArray objectAtIndex:row];
//
//        }
//    }
    self.JieDaoDic = [self.jieDaoArray objectAtIndex:row];

}

#pragma mark---获取地址
#pragma mark---获取省
- (void)setUpWithSheng:(NSString *)shangji {
  
    NSDictionary *newDic = @{@"token":[UserModel shared].token,@"uid":[UserModel shared].uid};
    
    [self.shiTask cancel];
    self.shiTask = nil;
    
    [self.quTask cancel];
    self.quTask = nil;
    
 
    [self.shengTask cancel];
    self.shengTask = nil;
    
    
    
 self.shengTask =   [Toos dataWithSessionurl:@"address/province" body:newDic view:self.bigView token:[Toos setUpWithObjectForKey:@"token"] Block:^(id tempData) {
        
        
        if ([Toos isNotNull:tempData[@"data"]] && [tempData[@"data"]isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dic1 in tempData[@"data"]) {
                [self.shengArray addObject:dic1];
                
                
            }
        }
        
        if ([Toos isNotBlank:self.shengArray]) {
            
            self.shengDic = self.shengArray[0];
            
         
            
          
            
            
              [ self setUpWithShi:self.shengArray[0][@"id"]];
        }
        
        
      
      
       
    
//        [self.picKerView reloadAllComponents];
        
    } failBlock:^(id tempData) {
        
    }];
}
#pragma mark---获取市
- (void)setUpWithShi:(NSString *)shangji {
    
    [self.shiTask cancel];
    self.shiTask = nil;
    
    [self.quTask cancel];
    self.quTask = nil;
    
  
    
    [self.shengTask cancel];
    self.shengTask = nil;
    
    
    
    NSDictionary *dic = @{@"id":shangji,@"type":@"province",@"token":[UserModel shared].token,@"uid":[UserModel shared].uid};
    
    
    [self.shiArray removeAllObjects];
    [self.quArray removeAllObjects];
  
 self.shiTask =   [Toos dataWithSessionurl:@"address/province" body:dic view:self.bigView token:[Toos setUpWithObjectForKey:@"token"] Block:^(id tempData) {
        
        
        if ([Toos isNotBlank:tempData[@"data"]] && [tempData[@"data"]isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dic1 in tempData[@"data"]) {
                [self.shiArray addObject:dic1];
                
                
                
            }
            
            if (self.shiArray.count > 0) {
                  self.shiDic = self.shiArray[0];
             
                 [ self setUpWithQu:self.shiArray[0][@"id"]];
        
                
            }
            
        }else {
            
            
          
            
        }
        [self.picKerView reloadAllComponents];
        [self.picKerView selectRow:0 inComponent:1 animated:YES];
        [self.picKerView selectRow:0 inComponent:2 animated:YES];
        
    } failBlock:^(id tempData) {
        
    }];
}
#pragma mark---获取县
- (void)setUpWithQu:(NSString *)shangji {
    
    [self.shiTask cancel];
    self.shiTask = nil;
    
    [self.quTask cancel];
    self.quTask = nil;
    
 
    
    [self.shengTask cancel];
    self.shengTask = nil;
    
    NSDictionary *dic = @{@"id":shangji,@"type":@"city",@"token":[UserModel shared].token,@"uid":[UserModel shared].uid};
    
    [self.quArray removeAllObjects];
    
  self.quTask =  [Toos dataWithSessionurl:@"address/province" body:dic view:self.bigView token:[Toos setUpWithObjectForKey:@"token"] Block:^(id tempData) {
        
        
        if ([Toos isNotNull:tempData[@"data"]] && [tempData[@"data"]isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dic1 in tempData[@"data"]) {
                [self.quArray addObject:dic1];
                
                
            }
            
            if (self.quArray.count > 0) {
                
              
             
                     self.QuDic = self.quArray[0];
                    
                

            }
        }else {
            
            
        }
        [self.picKerView reloadAllComponents];
    } failBlock:^(id tempData) {
        
    }];
}
#pragma mark----获取街道

- (void)setUpWithJiaDao{
    
//    NSDictionary *dic = @{@"id": [DataBaseManager sharedFMDBManager].QuDic[@"id"],@"type":@"area",@"token":[UserModel shared].token,@"uid":[UserModel shared].uid};
//    [self.jieDaoArray removeAllObjects];

//    [Toos dataWithSessionurl:@"address/province" body:dic view:self.bigView token:[Toos setUpWithObjectForKey:@"token"] Block:^(id tempData) {
//
//
//        if ([Toos isNotNull:tempData[@"data"]] && [tempData[@"data"]isKindOfClass:[NSArray class]]) {
//            for (NSDictionary *dic1 in tempData[@"data"]) {
//                [self.jieDaoArray addObject:dic1];
//
//
//            }
//
//            if (self.jieDaoArray.count > 0) {
//                self.JieDaoDic = self.jieDaoArray[0];
//
//            }
//        }else {
//
//
//        }
//
//
//         [self.picKerView selectRow:0 inComponent:0 animated:YES];
//
//        [self.picKerView reloadAllComponents];
//
//    } failBlock:^(id tempData) {
//
//    }];
    
}


- (void)setUpWithgzxx{
    
    NSString *url;
    if ([self.type isEqualToString:@"1"]) {
        url=@"/app/city/city_list";
    }else if ([self.type isEqualToString:@"2"]) {
        url=@"/app/category/gznx";
    }else if ([self.type isEqualToString:@"3"]) {
        url=@"/app/category/sjsfg";
    }else if ([self.type isEqualToString:@"4"]) {
        url=@"/app/category/alkj";
    }
    
    
    
//    NSDictionary *dic = @{@"id": [DataBaseManager sharedFMDBManager].QuDic[@"id"],@"type":@"area",@"token":[UserModel shared].token,@"uid":[UserModel shared].uid};
    [self.jieDaoArray removeAllObjects];
    
    [Toos dataWithSessionurl:url body:@{} view:self.bigView token:[Toos setUpWithObjectForKey:@"token"] Block:^(id tempData) {
        
        
        if ([Toos isNotNull:tempData[@"data"]] && [tempData[@"data"]isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dic1 in tempData[@"data"]) {
                [self.jieDaoArray addObject:dic1];
                
                
            }
            
            if (self.jieDaoArray.count > 0) {
                self.JieDaoDic = self.jieDaoArray[0];
                
            }
        }else {
            
            
        }
        
        
        [self.picKerView selectRow:0 inComponent:0 animated:YES];
        
        [self.picKerView reloadAllComponents];
        
    } failBlock:^(id tempData) {
        
    }];
    
}


@end
