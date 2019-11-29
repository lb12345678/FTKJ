//
//  XZAddressViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/21.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "XZAddressViewController.h"
#import "DingWeiOneViewCell.h"
#import "CityViewCell.h"
#import <PinyinHelper.h>
#import <HanyuPinyinOutputFormat.h>
#import "ChineseToPinyin.h"
@interface XZAddressViewController ()

@property(nonatomic,retain)UITextField *searchField;

@property(nonatomic,retain)UILabel *addressLabel;

@end

@implementation XZAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择地址";
    // Do any additional setup after loading the view.
}

-(void)setUpWithBigView {
    
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(20), kScreenWidth -  kWidthChange(40), kWidthChange(37))];
    searchView.layer.masksToBounds = YES;
    searchView.layer.cornerRadius = kWidthChange(37) / 2;
//    searchView.layer.borderWidth = .5;
    searchView.backgroundColor = newColor(241, 242, 244, 1);
    searchView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self.view addSubview:searchView];
    
    
    self.searchField = [[UITextField alloc]initWithFrame:CGRectMake( kWidthChange(20), 0,kScreenWidth - kWidthChange(100) , kWidthChange(37))];
    self.searchField.delegate = self;
    
    self.searchField.placeholder = @"请输入城市名或者拼音";
    [self.searchField setValue:newColor(196, 197, 199, 1) forKeyPath:@"_placeholderLabel.Color"];
    [self.searchField setValue:[UIFont systemFontOfSize:kWidthChange(12)] forKeyPath:@"_placeholderLabel.font"];
    self.searchField.font = [UIFont systemFontOfSize:kWidthChange(12)];
    self.searchField.textColor = [UIColor whiteColor];
    self.searchField.userInteractionEnabled = NO;
    
    [searchView addSubview:self.searchField];
   
    
    
    UIImageView *searchImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box37"]];
    
    
    searchImage.frame = CGRectMake( kScreenWidth - kWidthChange(40) - kWidthChange(34), kWidthChange(37) / 2 - kWidthChange(14) / 2, kWidthChange(14), kWidthChange(14));
    
    [searchView addSubview:searchImage];
    
    
    
    UIView *AddressView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(0), CGRectGetMaxY(searchView.frame), kScreenWidth -  kWidthChange(0), kWidthChange(80))];
    AddressView.layer.masksToBounds = YES;
    AddressView.layer.cornerRadius = kWidthChange(37) / 2;
    //    searchView.layer.borderWidth = .5;
    AddressView.backgroundColor = [UIColor whiteColor];
  
    
    [self.view addSubview:AddressView];
    
    
    UILabel *oneLabel = [Toos setUpWithUserLabel:@"当前定位" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth, kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(130, 131, 133, 1) textSize:kWidthChange(15)];
    [AddressView addSubview:oneLabel];
    
    UIImageView *HangBanImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(oneLabel.frame) + kWidthChange(12.5)  , kWidthChange(15), kWidthChange(15))];
    HangBanImage.image = [UIImage imageNamed:@"box50"];
    
    
    HangBanImage.contentMode = UIViewContentModeScaleAspectFill;
    
    
     [AddressView addSubview:HangBanImage];
    
    self.addressLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@市",[[[Toos setUpWithObjectForKey:@"city"] componentsSeparatedByString:@" "]objectAtIndex:0]] CGRect:CGRectMake(CGRectGetMaxX(HangBanImage.frame) + kWidthChange(10), CGRectGetMaxY(oneLabel.frame)+ kWidthChange(12.5)  , kScreenWidth, kWidthChange(15)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(18)];
    
      [AddressView addSubview:self.addressLabel];
    
    UIImageView *DingWeiImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - kWidthChange(20) - [Toos textRect:@"重新定位" textFont:[UIFont systemFontOfSize:kWidthChange(18)]] - kWidthChange(15), CGRectGetMaxY(oneLabel.frame) + kWidthChange(12.5)  , kWidthChange(15), kWidthChange(15))];
    DingWeiImage.image = [UIImage imageNamed:@"box51"];
    
    
    DingWeiImage.contentMode = UIViewContentModeScaleAspectFill;
    
      [AddressView addSubview:DingWeiImage];
    
    
    UIButton *DingWeiBT = [UIButton buttonWithType:UIButtonTypeCustom];
    DingWeiBT.frame = CGRectMake(kScreenWidth - kWidthChange(20) - [Toos textRect:@"重新定位" textFont:[UIFont systemFontOfSize:kWidthChange(18)]] , CGRectGetMaxY(oneLabel.frame)+ kWidthChange(12.5), [Toos textRect:@"重新定位" textFont:[UIFont systemFontOfSize:kWidthChange(18)]] , kWidthChange(15));
    [DingWeiBT setTitle:@"重新定位" forState:UIControlStateNormal];
    
    
    [DingWeiBT setTitleColor:newColor(249, 130, 43, 1) forState:UIControlStateNormal];
    DingWeiBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(18)];
    
    
    [DingWeiBT addTarget:self action:@selector(clickChongXinDingWei:) forControlEvents:UIControlEventTouchUpInside];
    
    [AddressView addSubview:DingWeiBT];
    
    
    
}

-(void)clickChongXinDingWei:(UIButton *)sender {
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
