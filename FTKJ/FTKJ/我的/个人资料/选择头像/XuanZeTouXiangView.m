//
//  XuanZeTouXiangView.m
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "XuanZeTouXiangView.h"
@interface XuanZeTouXiangView()<UIImagePickerControllerDelegate,TZImagePickerControllerDelegate>
@property(nonatomic,retain)UIView *bigView;
@property(nonatomic,retain)UIView *alphaView;

@end

@implementation XuanZeTouXiangView
-(void)layoutSubviews{
    self.alphaView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.backgroundColor=newColor(44, 44, 44, 0.2);
    [self addSubview:self.alphaView];
    [self.alphaView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapdissmiss)]];
    
    
    
    
    
    
    self.bigView=[[UIView alloc]initWithFrame:CGRectMake(kWidthChange(25), kScreenHeight / 2 - kWidthChange(95), kScreenWidth-kWidthChange(50), kWidthChange(190))];
    self.bigView.backgroundColor=[UIColor whiteColor];
    self.bigView.layer.masksToBounds=YES;
    self.bigView.layer.cornerRadius=10;
    [self addSubview:self.bigView];
    
    
    UILabel *nameLab=[Toos setUpWithUserLabel:self.isfrom CGRect:CGRectMake(0, kWidthChange(35), kScreenWidth-kWidthChange(50),kWidthChange(20) ) color:newColor(0, 00, 0, 0) textColor:newColor(23, 23, 23, 1) textSize:kWidthChange(24)];
    nameLab.textAlignment=NSTextAlignmentCenter;
    [self.bigView addSubview:nameLab];
    
    
    //循环创建视图
    float w=kWidthChange(0);
    float y=CGRectGetMaxY(nameLab.frame)+20;
    NSArray *imgarr=@[@"box155",@"box156"];
    if ([self.isfrom isEqualToString:@"选择头像"]) {
        imgarr=@[@"box23-1",@"box24-1"];
    }
    for (int i=0; i<self.arr.count; i++) {
        
        //        if ([Toos textRect:btnArray[i] textFont:Font(kWidthChange(13))]+kWidthChange(40)+w> kWidthChange(270)) {
        //            y+=kWidthChange(45);
        //            w=0;
        //        }
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(w, y,(kScreenWidth- kWidthChange(50))/2, kWidthChange(100))];
        
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(((kScreenWidth-kWidthChange(50))/2-kWidthChange(50))/2, 10, kWidthChange(50), kWidthChange(50))];
        img.layer.masksToBounds=YES;
        img.image=[UIImage imageNamed:imgarr[i]];
        img.layer.cornerRadius=kWidthChange(25);
        img.userInteractionEnabled=NO;
        img.backgroundColor=newColor(135, 227, 238, 1);
        [btn addSubview:img];
        
        
        UILabel *lab=[Toos setUpWithUserLabel:self.arr[i] CGRect:CGRectMake(0, CGRectGetMaxY(img.frame)+10, (kScreenWidth- kWidthChange(50))/2, kWidthChange(20)) color:newColor(0, 00, 0, 0) textColor:newColor(23, 23, 23, 1) textSize:kWidthChange(18)];
        lab.textAlignment=NSTextAlignmentCenter;
        [btn addSubview:lab];
        lab.userInteractionEnabled=NO;
        
        
        
        [btn addTarget:self action:@selector(cilke:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i+1;
        [self.bigView addSubview:btn];
        w=CGRectGetMaxX(btn.frame);
        
    }
    //
    
    
}


-(void)cilke:(UIButton *)sender{
    NSInteger btnTag=sender.tag-1;
    if ([self.isfrom isEqualToString:@"选择头像"]) {
        if (btnTag == 0) {
            
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"xztx" object:@"0"];
            [self tapdissmiss];
            
            
        }else{
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"xztx" object:@"1"];
            [self tapdissmiss];
            
            
            
        }
    }else{
        if (btnTag) {
            
            
            
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"xzxb" object:@"2"];
            [self tapdissmiss];
        }else{
            
            
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"xzxb" object:@"1"];
            [self tapdissmiss];
            
        }
    }
}


-(void)clickBtn:(UIButton *)sender{
    [self tapdissmiss];
}

-(void)tapdissmiss{
    self.hidden = YES;
    
}
-(void)xiugai{
    //    if (self.text.text.length==0) {
    //        [Toos setUpWithMBP:@"请输入姓名" UIView:self];
    //        return;
    //
    //    }
    NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [newDic setObject:[UserModel shared].token forKey:@"token"];
    //    [newDic setObject:self.text.text forKey:@"name"];
    
    
    [Toos dataWithSessionurl:@"/app/member/change_info" body:newDic view:[UIApplication sharedApplication].keyWindow token:@"" Block:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:[UIApplication sharedApplication].keyWindow];
        if ([tempData[@"code"]intValue] == 200) {
            
            [self tapdissmiss];
            
        }
        //        if ([Toos isNotBlank:tempData[@"data"][@"verify"]]) {
        //            self.yanZhengTF.text=[NSString stringWithFormat:@"%@",tempData[@"data"][@"verify"]];
        //        }
        
        
        
    } failBlock:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:self];
        
    }];
}

@end
