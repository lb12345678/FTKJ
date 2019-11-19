//
//  ShareKeCheng.m
//  ZJLM
//
//  Created by ios on 2019/5/31.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "ShareKeCheng.h"
#import <Photos/Photos.h>

@interface ShareKeCheng()

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,retain)UIView *bigView;

@property(nonatomic,retain)UIImageView *bigImage;

@property(nonatomic,retain)UIImage *ShareImage;

@property(nonatomic,retain)UILabel *twoLabel;

@end


@implementation ShareKeCheng



-(void)layoutSubviews {
    
    self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.alphaView.backgroundColor = [UIColor lightGrayColor];
    self.alphaView.alpha = .5;
    [self addSubview:self.alphaView];
    [self.alphaView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickdisMiss)]];
    
    
    self.bigView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(10), kScreenHeight - downH - kWidthChange(25) - kWidthChange(270), kScreenWidth - kWidthChange(20), kWidthChange(270))];
    self.bigView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.bigView];
    
  
    
    
    UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0,  kWidthChange(50), kScreenWidth - kWidthChange(20), kWidthChange(220))];
    smallView.backgroundColor = newColor(242, 244, 245, 1);
    smallView.layer.masksToBounds = YES;
    smallView.layer.cornerRadius = 10;
    [self.bigView addSubview:smallView];
    
    int lie=0;
    
    lie= 4;
    int Allcount= 5;
    int line=Allcount/lie;
    if(Allcount%lie>0)
        line++;
    NSArray *oneArray;
    if ([Toos isBlank:self.categoryID]) {
       
        CGRect bigFrame = self.bigView.frame;
        CGRect smallFrame = smallView.frame;
        bigFrame.size.height = kWidthChange(180);
        bigFrame.origin.y = kScreenHeight - downH - kWidthChange(25) - kWidthChange(180);
        
        smallFrame.size.height = kWidthChange(140);
        self.bigView.frame = bigFrame;
        smallView.frame = smallFrame;
        
         oneArray = @[@{@"icon":@"box34",@"title":@"新浪微博"},@{@"icon":@"box35",@"title":@"QQ"},@{@"icon":@"box36",@"title":@"微信好友"},@{@"icon":@"box37",@"title":@"朋友圈"}];
    }else {
    
    
    oneArray = @[@{@"icon":@"box34",@"title":@"新浪微博"},@{@"icon":@"box35",@"title":@"QQ"},@{@"icon":@"box36",@"title":@"微信好友"},@{@"icon":@"box37",@"title":@"朋友圈"},@{@"icon":@"box38",@"title":@"生成海报"}];
    }
    CGFloat w = kWidthChange(15);//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat h = kWidthChange(30);//用来控制button距离父视图的高
    for (int i = 0; i < oneArray.count; i++) {
        
        
        UIButton *newBT = [UIButton buttonWithType:UIButtonTypeCustom];
       
        
       
        [newBT setTitleColor:newColor(56, 56, 56, 1) forState:UIControlStateNormal];
        newBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(12)];
     
        newBT.backgroundColor = [UIColor clearColor];
        //设置button的frame
        newBT.frame = CGRectMake( w, h , kWidthChange(80) , kWidthChange(80));
        
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
        if(w +  kWidthChange(80) > kScreenWidth - kWidthChange(20)){
            w = kWidthChange(15); //换行时将w置为0
            h = h + newBT.frame.size.height + kWidthChange(15) ;//距离父视图也变化
            newBT.frame = CGRectMake( w, h,  kWidthChange(80), kWidthChange(80));//重设button的frame
        }
        w = newBT.frame.size.width + newBT.frame.origin.x + (kScreenWidth - kWidthChange(40) - kWidthChange(320)) / 3;
        
        [newBT setImage:[UIImage imageNamed:[oneArray objectAtIndex:i][@"icon"]] forState:UIControlStateNormal];
        [newBT setTitle:[oneArray objectAtIndex:i][@"title"] forState:UIControlStateNormal];
        
                [newBT layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:20 weight:2];
        
      

        newBT.userInteractionEnabled = YES;
        [smallView addSubview:newBT];
        
        
        [newBT addTarget:self action:@selector(clickTap:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        
        
    }
    
   

    
}





-(void)clickdisMiss {
    
    self.hidden = YES;
}

-(void)clickTap:(UIButton *)sender {
    
    self.hidden = YES;
        NSString *title = [NSString stringWithFormat:@"%@",sender.titleLabel.text];
        
        __weak typeof(self)weakSelf = self;
        if ([title isEqualToString:@"新浪微博"]) {
            

            [self setUpWithNewBigType:self.type shareType:SSDKPlatformTypeSinaWeibo];
    
        }else if ([title isEqualToString:@"微信好友"]){

             [self setUpWithNewBigType:self.type shareType:SSDKPlatformSubTypeWechatSession];
            
        }else if ([title isEqualToString:@"朋友圈"]){

             [self setUpWithNewBigType:self.type shareType:SSDKPlatformSubTypeWechatTimeline];
            
        }else if ([title isEqualToString:@"QQ"]){

            [self setUpWithNewBigType:self.type shareType:SSDKPlatformSubTypeQQFriend];
            
        }
        

    
}

-(void)setUpWithNewBigType:(NSString *)type shareType:(SSDKPlatformType)shareType{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if ([self.type intValue] == 1) {
        [params SSDKSetupShareParamsByText:@"" images:[UIImage imageNamed:@"nav5"] url:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_IMAGEURl,self.bigDic[@"share_url"]]] title:self.bigDic[@"title"] type:SSDKContentTypeWebPage];
        
    }else if ([self.type intValue] == 2){
        
        [params SSDKSetupShareParamsByText:@"" images:self.shareBigImage url:[NSURL URLWithString:@"http://mob.com"] title:@"真酒联盟" type:SSDKContentTypeImage];
        
    }else if ([self.type intValue] == 3){
        
        [params SSDKSetupShareParamsByText:@"" images:[UIImage imageNamed:@"nav5"] url:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_IMAGEURl,self.shareImageUrl]] title:@"真酒联盟" type:SSDKContentTypeWebPage];
        
    }else {
        
        [params SSDKSetupShareParamsByText:@"" images:[NSString stringWithFormat:@"%@",self.bigDic[@"imgurl"]] url:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_IMAGEURl,self.bigDic[@"share_url"]]] title:self.bigDic[@"title"] type:SSDKContentTypeWebPage];
    }
    
    
    
    [self setUpWithShareType:shareType newDic:params];
    
    
}






-(void)setUpWithShareType:(SSDKPlatformType)shareType newDic:(NSMutableDictionary *)newDic {
    
    [ShareSDK share:shareType parameters:newDic onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
        switch (state) {
            case SSDKResponseStateUpload:
                // 分享视频的时候上传回调，进度信息在 userData
                break;
            case SSDKResponseStateSuccess:
                //成功
                break;
            case SSDKResponseStateFail:
            {
                NSLog(@"--%@",error.description);
                //失败
                break;
            }
            case SSDKResponseStateCancel:
                //取消
                break;
                
            default:
                break;
        }
    }];
    
    
    
    
}






@end
