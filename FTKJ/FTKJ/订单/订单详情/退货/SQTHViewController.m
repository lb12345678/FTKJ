//
//  SQTHViewController.m
//  JZGL
//
//  Created by ios on 2019/8/14.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "SQTHViewController.h"
#import "THYYView.h"

@interface SQTHViewController ()<UITextFieldDelegate>

@property(nonatomic,retain)UIScrollView *scrollerView;

@property(nonatomic,retain)UITextField *TuiHuoYuanYinTF;

@property(nonatomic,retain)UIView *downView;

@property(nonatomic,retain)UITextView *textView;

@property(nonatomic,retain)UIView *sevenView;

@property(nonatomic,retain)NSMutableArray *imageArray;

@property(nonatomic,retain)NSMutableArray *imageIdArray;

@property(nonatomic,retain)NSDictionary *tempDic;

@property(nonatomic,retain)THYYView *THYY;

@property(nonatomic,retain)UIView *KuaiDiView;

@property(nonatomic,retain)UITextField *KDGSTF;

@property(nonatomic,retain)UITextField *KDDHTF;



@end

@implementation SQTHViewController
-(NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        self.imageArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _imageArray;
}

-(NSMutableArray *)imageIdArray {
    if (_imageIdArray == nil) {
        self.imageIdArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _imageIdArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"退货";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.imageArray addObject:@"icon_8order_upload"];
    self.scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,  kWidthChange(15), kScreenWidth, kScreenHeight - kTopHeight - kWidthChange(30) - kWidthChange(50))];
    self.scrollerView.backgroundColor = newColor(255, 255, 255, 1);
    [self.view addSubview:self.scrollerView];
    
    UIButton *TJBT = [UIButton buttonWithType:UIButtonTypeCustom];
    
   TJBT.frame = CGRectMake(kWidthChange(50), kScreenHeight - kTabBarHeight - kWidthChange(15) - kTopHeight,kScreenWidth - kWidthChange(100), kWidthChange(50));
    TJBT.backgroundColor = newColor(233, 20, 50, 1);
    [TJBT setTitle:@"提交" forState:UIControlStateNormal];
    [TJBT setTitleColor:newColor(255, 255,255, 1) forState:UIControlStateNormal];
    TJBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    TJBT.layer.masksToBounds = YES;
    TJBT.layer.cornerRadius = kWidthChange(25);
    [self.view addSubview:TJBT];
    
    [TJBT addTarget:self action:@selector(clickTiJiaoBT:) forControlEvents:UIControlEventTouchUpInside];
    //[self setUpWithData];
    
    [self setUpWithBigView:@{@"list":@[@{}]}];
    // Do any additional setup after loading the view.
}

-(void)clickTiJiaoBT:(UIButton *)sender {
    
    if (self.TuiHuoYuanYinTF.text.length == 0) {
        [Toos setUpWithMBP:@"请选择申请理由" UIView:self.view];
        return;
    }
    if (self.textView.text.length == 0) {
        [Toos setUpWithMBP:@"请填写退货原因" UIView:self.view];
        return;
    }
    
  
    
    NSMutableArray *Array = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < [self.tempDic[@"list"]count]; i++) {
        
        NSMutableDictionary *oneDic = [NSMutableDictionary dictionaryWithCapacity:1];
        
        
        NSDictionary *tempDic = [self.tempDic[@"list"] objectAtIndex:i];
        UILabel *numberLabel = (UILabel *)[self.view viewWithTag:1000 + i];
        
        if (numberLabel.text.length != 0) {
            [oneDic setObject:tempDic[@"id"] forKey:@"product_id"];
            [oneDic setObject:numberLabel.text forKey:@"num"];
            [oneDic setObject:tempDic[@"s_id"] forKey:@"s_id"];
        }
        
        [Array addObject:oneDic];
       
    }
    if (Array.count == 0) {
        [Toos setUpWithMBP:@"请选择退货商品" UIView:self.view];
        return;
    }
    NSMutableDictionary *bigDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [bigDic setObject:[UserModel shared].uid forKey:@"uid"];
    [bigDic setObject:self.typeID forKey:@"order_id"];
    [bigDic setObject:Array forKey:@"data"];
    [bigDic setObject:self.TuiHuoYuanYinTF.text forKey:@"reason"];
    [bigDic setObject:self.type forKey:@"type"];
    
    if ([Toos isNotBlank:self.textView.text]) {
        [bigDic setObject:self.textView.text forKey:@"description"];
    }
    
    
    if (self.imageArray.count > 1) {
        NSString *imgStr;
        
        for (int i = 0; i < self.imageArray.count - 1; i++) {
            NSDictionary *tempDic = [self.imageArray objectAtIndex:i];
            if ([Toos isBlank:imgStr]) {
                imgStr = [NSString stringWithFormat:@"%@",tempDic[@"id"]];
            }else {
                imgStr = [NSString stringWithFormat:@"%@,%@",imgStr,tempDic[@"id"]];
            }
        }
        
    
        [bigDic setObject:imgStr forKey:@"imgarr"];
    }
    
    
    
    
    
    
    [Toos dataWithSessionurl:@"/app/member/apply_after_sale" body:bigDic view:self.view token:@"" Block:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:[UIApplication sharedApplication].keyWindow];
        if ([tempData[@"code"]intValue] == 200) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    } failBlock:^(id tempData) {
        
    }];
    
}

-(void)setUpWithData {
    
    [Toos dataWithSessionurl:@"/app/member/details_after_sale" body:@{@"uid":[UserModel shared].uid,@"oid":self.typeID} view:self.view token:@"" Block:^(id tempData) {
        if ([tempData[@"code"]intValue] == 200) {
            if ([Toos isNotBlank:tempData[@"data"]]) {
                self.tempDic = tempData[@"data"];
                [self setUpWithBigView:tempData[@"data"]];
            }
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
            
        }
    } failBlock:^(id tempData) {
        
    }];
    
}



-(void)setUpWithBigView:(NSDictionary *)tempDic {
    
  
    
    
    
    
    
    for (int i = 0; i < [tempDic[@"list"]count]; i++) {
        NSDictionary *oneDic = [tempDic[@"list"] objectAtIndex:i];
        UIButton *smallView = [[UIButton alloc]initWithFrame:CGRectMake(kWidthChange(20),  i * kWidthChange(104) + i * kWidthChange(10), kScreenWidth - kWidthChange(40), kWidthChange(104))];
        smallView.backgroundColor = newColor(255, 255, 255, 1);
       
        smallView.layer.cornerRadius = 5;
        [self.scrollerView addSubview:smallView];
        [smallView shadow:newColor(229, 230, 231, 1) opacity:1 radius:5 offset:CGSizeMake(0, 0)];
        
        [smallView setTitle:[NSString stringWithFormat:@"%@", [oneDic objectForKey:@"id"]] forState:UIControlStateNormal];
        [smallView setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        
        
        
        [smallView addTarget:self action:@selector(clickTapSP:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        
        UIImageView *bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(15), kWidthChange(15), kWidthChange(70), kWidthChange(70))];
       
        [smallView addSubview:bigImage];
        [bigImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_URlImage,oneDic[@"img"]]]];
        
        
        
        UILabel *nameLabel  = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",oneDic[@"title"]] CGRect:CGRectMake(CGRectGetMaxX(bigImage.frame) + kWidthChange(15),kWidthChange(15) , kScreenWidth - CGRectGetMaxX(bigImage.frame) - kWidthChange(80), kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(97, 107, 113, 1) textSize:kWidthChange(14)];
        [smallView addSubview:nameLabel];
        nameLabel.numberOfLines = 2;
        nameLabel.userInteractionEnabled = NO;
        
        
        

        UILabel *moneyLabel  = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(CGRectGetMaxX(bigImage.frame) + kWidthChange(15),CGRectGetMaxY(bigImage.frame) - kWidthChange(20) ,  [Toos textRect:[NSString stringWithFormat:@"单价：¥%@",oneDic[@"price"]] textFont:[UIFont systemFontOfSize:kWidthChange(14)]]
                                                                              , kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(51, 59, 76, 1) textSize:kWidthChange(14)];
        [smallView addSubview:moneyLabel];
        
       
        moneyLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"单价：¥%@",oneDic[@"price"]] color:newColor(171, 181, 188, 1) color1:newColor(72, 84, 97, 1) font:kWidthChange(14) font1:kWidthChange(14) length:3 length1: [oneDic[@"price"]length]+1];
        
          moneyLabel.userInteractionEnabled = NO;
        
        UILabel *XiaoLabel  = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(CGRectGetMaxX(moneyLabel.frame) + kWidthChange(30) ,CGRectGetMaxY(bigImage.frame) - kWidthChange(20) , kScreenWidth -  kWidthChange(50), kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(164, 170, 180, 1) textSize:kWidthChange(14)];
      
        [smallView addSubview:XiaoLabel];
         XiaoLabel.attributedText = [Toos setUpWithtext:[NSString stringWithFormat:@"数量：%@",oneDic[@"num"]] color:newColor(171, 181, 188, 1) color1:newColor(72, 84, 97, 1) font:kWidthChange(14) font1:kWidthChange(14) length:3 length1: [oneDic[@"num"]length]];
         XiaoLabel.userInteractionEnabled = NO;
        UILabel *lineLabel  = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake( kWidthChange(15),kWidthChange(100) , kScreenWidth -  kWidthChange(30), kWidthChange(1)) color:lineColor_gary textColor:newColor(164, 170, 180, 1) textSize:kWidthChange(14)];
     
//        [smallView addSubview:lineLabel];
        
        
        
      
        
    }
    
    NSArray *fourArray = @[@"申请原因"];
    
    UIView *numberView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(124), kScreenWidth - kWidthChange(40), kWidthChange(60))];
    numberView.backgroundColor = [UIColor whiteColor];
    //numberView.layer.masksToBounds = YES;
    numberView.layer.cornerRadius = 5;
      [numberView shadow:newColor(229, 230, 231, 1) opacity:1 radius:5 offset:CGSizeMake(0, 0)];
    [self.scrollerView addSubview:numberView];
    UILabel *THLabel  = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake( kWidthChange(15),kWidthChange(0) , kScreenWidth -  kWidthChange(30), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(35, 40, 56, 1) textSize:kWidthChange(16)];
    
    [numberView addSubview:THLabel];
    THLabel.userInteractionEnabled = NO;
    if ([self.type intValue] == 1) {
        THLabel.text = @"退货数量";
    }else {
        THLabel.text = @"换货数量";
        
    }
    UIButton *JianBT  = [UIButton buttonWithType:UIButtonTypeCustom];
    JianBT.frame = CGRectMake(kScreenWidth - kWidthChange(40) - kWidthChange(15) - kWidthChange(30) - kWidthChange(40) - kWidthChange(30),  kWidthChange(15)  , kWidthChange(30), kWidthChange(30));
    [JianBT setImage:[UIImage imageNamed:@"box55"] forState:UIControlStateNormal];
    
    //    [self.JianBT addTarget:self action:@selector(clickJian:) forControlEvents:UIControlEventTouchUpInside];
    [numberView addSubview:JianBT];
    
  
    
    [JianBT addTarget:self action:@selector(clickJianBT:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *numberLabel  = [Toos setUpWithUserLabel:@"1" CGRect:CGRectMake(CGRectGetMaxX(JianBT.frame) ,0  , kWidthChange(40), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(15)];
    numberLabel.textAlignment = NSTextAlignmentCenter;
    [numberView addSubview: numberLabel];
   
    UIButton *addBT  = [UIButton buttonWithType:UIButtonTypeCustom];
    addBT.frame = CGRectMake(CGRectGetMaxX(numberLabel.frame),  kWidthChange(60) / 2 - kWidthChange(30) / 2 , kWidthChange(30), kWidthChange(30));
    [addBT setImage:[UIImage imageNamed:@"box56"] forState:UIControlStateNormal];
    
    [numberView addSubview: addBT];
    [addBT addTarget:self action:@selector(clickAddBT:) forControlEvents:UIControlEventTouchUpInside];
  
   
    
    UIView *threeView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20),  CGRectGetMaxY(numberView.frame) + kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(60))];
    threeView.backgroundColor = [UIColor whiteColor];
  
    threeView.layer.cornerRadius = 5;
    [self.scrollerView addSubview:threeView];
    
      [threeView shadow:newColor(229, 230, 231, 1) opacity:1 radius:5 offset:CGSizeMake(0, 0)];
    
    for (int i = 0; i < 1; i++) {
        
        UIView *FourView = [[UIView alloc]initWithFrame:CGRectMake(0, 0  , kScreenWidth - kWidthChange(40), kWidthChange(60))];
        FourView.backgroundColor = [UIColor whiteColor];
        
        [threeView addSubview:FourView];
        
        
        
        UILabel *fourLabel = [Toos setUpWithUserLabel:[fourArray objectAtIndex:i] CGRect:CGRectMake(kWidthChange(10), 0, [Toos textRect:[fourArray objectAtIndex:i] textFont:[UIFont systemFontOfSize:kWidthChange(16)]], kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(52, 62, 74, 1) textSize:kWidthChange(16)];
        
        
        
        [FourView addSubview:fourLabel];
        
        
        
        
        UITextField *TF = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - kWidthChange(70), kWidthChange(60))];
        TF.delegate = self;
        TF.placeholder = @"请选择申请原因";
        TF.userInteractionEnabled = NO;
        TF.font = [UIFont systemFontOfSize:kWidthChange(15)];
        TF.textAlignment = NSTextAlignmentRight;
    
        [TF setValue:[UIFont systemFontOfSize:kWidthChange(15)] forKeyPath:@"_placeholderLabel.font"];
        [FourView addSubview:TF];
        TF.userInteractionEnabled = NO;
        if (i == 0) {
            TF.textColor = newColor(51, 51, 51, 1);
            self.TuiHuoYuanYinTF = TF;
            
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(kScreenWidth - kWidthChange(40) -  kWidthChange(15) - kWidthChange(10), kWidthChange(60) / 2 - 15 / 2,  10, 15);
        
        button.userInteractionEnabled = NO;
        
        
        [button setImage:[UIImage imageNamed:@"box44"] forState:UIControlStateNormal];
        [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:2 weight:2];
        if (i == 0) {
            [FourView addSubview:button];
            [FourView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTuiKuanYuanYin:)]];
          
            
        }


    }
   self.downView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(threeView.frame) + kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(120))];
     self.downView.backgroundColor = [UIColor whiteColor];
    [self.scrollerView addSubview: self.downView];
   
    self.downView.layer.cornerRadius = 5;
      [self.downView shadow:newColor(229, 230, 231, 1) opacity:1 radius:5 offset:CGSizeMake(0, 0)];
    UILabel *fiveLabel = [Toos setUpWithUserLabel:@"问题描述" CGRect:CGRectMake(kWidthChange(15), 0, kScreenWidth, kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(52, 62, 74, 1) textSize:kWidthChange(15)];
    
    
    
    [self.downView addSubview:fiveLabel];
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(kWidthChange(15), CGRectGetMaxY(fiveLabel.frame) + kWidthChange(5) , kScreenWidth - kWidthChange(60), kWidthChange(100))];
    
    
    self.textView.font = [UIFont systemFontOfSize:kWidthChange(15)];
    UILabel *messageLabel1 = [Toos setUpWithUserLabel:@"请详细描述该商品的问题并上传照片" CGRect:CGRectMake(kWidthChange(0), kWidthChange(0), kScreenWidth - 30, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(199, 199, 200, 1) textSize:kWidthChange(15)];
    [ self.textView addSubview:messageLabel1];
    [self.textView setValue:messageLabel1 forKeyPath:@"_placeholderLabel"];
     [self.downView addSubview:self.textView];
    self.sevenView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textView.frame), kScreenWidth - kWidthChange(40), kWidthChange(65) + 15)];
   
    self.sevenView.backgroundColor = [UIColor clearColor];
    [self.downView addSubview:self.sevenView];
    
    
    
    self.KuaiDiView = [[UIView alloc]initWithFrame:CGRectMake(kWidthChange(20), CGRectGetMaxY(self.downView.frame) + kWidthChange(20), kScreenWidth - kWidthChange(40), kWidthChange(120))];
    
    self.KuaiDiView.backgroundColor = [UIColor whiteColor];
    [self.scrollerView addSubview:self.KuaiDiView];
    
    self.KuaiDiView.layer.cornerRadius = 5;
    [self.KuaiDiView shadow:newColor(229, 230, 231, 1) opacity:1 radius:5 offset:CGSizeMake(0, 0)];
    
    
    NSArray *arr=@[@"快递单号",@"快递公司"];
    for (int i=0; i<arr.count; i++) {
        UIView *smView=[[UIView alloc]initWithFrame:CGRectMake(0, kWidthChange(60)*i, kScreenWidth-kWidthChange(40), kWidthChange(60))];
        [self.KuaiDiView addSubview:smView];
        
        UILabel*lab=[Toos setUpWithUserLabel:arr[i] CGRect:CGRectMake(kWidthChange(15), kWidthChange(20), [Toos textRect:arr[i] textFont:Font(kWidthChange(15))], kWidthChange(15)) color:newColor(0, 0, 0, 0) textColor:newColor(40, 40, 40, 1) textSize:kWidthChange(15)];
        [smView addSubview:lab];
        
        UITextField *text=[[UITextField alloc]initWithFrame:CGRectMake(0,0, kScreenWidth - kWidthChange(40) - kWidthChange(15) - kWidthChange(25), kWidthChange(60))];
        text.font=Font(kWidthChange(13));
        text.textAlignment=NSTextAlignmentRight;
        text.placeholder=[NSString stringWithFormat:@"请填写%@",arr[i]];
        
        
        
        
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(kScreenWidth - kWidthChange(40) -  kWidthChange(15) - kWidthChange(10), kWidthChange(60) / 2 - 15 / 2,  10, 15);
        
        button.userInteractionEnabled = NO;
        
        
        [button setImage:[UIImage imageNamed:@"box44"] forState:UIControlStateNormal];
        [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:2 weight:2];
          [smView addSubview:button];
        if (i!=arr.count-1) {
            UILabel *xian=[Toos setUpWithUserLabel:@"" CGRect:CGRectMake(kWidthChange(15), kWidthChange(54.5), kScreenWidth-kWidthChange(70), 0.5) color:newColor(0, 0, 0, .2) textColor:newColor(0, 0, 0, 0) textSize:1];
            [smView addSubview:xian];
        }
        
        switch (i) {
            case 0:
                self.KDGSTF=text;
                [smView addSubview:self.KDGSTF];
                break;
            case 1:
                self.KDDHTF=text;
                [smView addSubview:self.KDDHTF];
                break;
            case 2:
//                self.bzTF=text;
//                [smView addSubview:self.bzTF];
                break;
                
            default:
                break;
        }
        
        CGRect frm=self.KuaiDiView.frame;
        frm.size.height=kWidthChange(60)*arr.count;
        self.KuaiDiView.frame=frm;
        
        
    }
    
    
    
    
    
    
     [self setUpWithMyNameimageArray:self.imageArray];
    
    
}
-(void)setUpWithMyNameimageArray:(NSArray *)imageArray {
    
    [self.sevenView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    
    
    CGRect bigFrame = self.sevenView.frame;
    
    CGRect threeFrame = self.downView.frame;
    
    
    if ([Toos isBlank:imageArray]) {
        bigFrame.size.height = 0;
    }else {
        
        
        
        int lie=0;
        
        lie= 4;
        int Allcount= imageArray.count;
        int line=Allcount/lie;
        if(Allcount%lie>0)
            line++;
        
        
        
        
        bigFrame.size.height = line  * kWidthChange(65) + (line - 1 ) * 10 + 10 ;
        
        
        
        
        CGFloat w = kWidthChange(15);//保存前一个button的宽以及前一个button距离屏幕边缘的距离
        CGFloat h = 0;//用来控制button距离父视图的高
        for (int i = 0; i < imageArray.count; i++) {
            UIImageView *view = [[UIImageView alloc]init];
            view.tag = i + 200;
            //根据计算文字的大小
            
            //为button赋值
            //label.text = array;
            view.backgroundColor = [UIColor whiteColor];
            //设置button的frame
            view.frame = CGRectMake( w, h , kWidthChange(65) ,kWidthChange(65));
            
            //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
            if(w + kWidthChange(65) > bigFrame.size.width){
                w = kWidthChange(15); //换行时将w置为0
                h = h + view.frame.size.height + kWidthChange(15) ;//距离父视图也变化
                view.frame = CGRectMake( w, h, kWidthChange(65),kWidthChange(65));//重设button的frame
            }
            w = view.frame.size.width + view.frame.origin.x + ( bigFrame.size.width - kWidthChange(30) - kWidthChange(65) * 4) / 3;
            
         
            view.userInteractionEnabled = YES;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(kWidthChange(65) - kWidthChange(20), 0, kWidthChange(20), kWidthChange(20));
            
            [button setImage:[UIImage imageNamed:@"×"] forState:UIControlStateNormal];
            
            
            button.tag = i + 100;
            
            if (i == imageArray.count - 1) {
                view.image = [UIImage imageNamed:@"icon_8order_upload"];
                [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHeader:)]];
            }else {
                [view sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_URlImage,[imageArray objectAtIndex:i][@"pic"]]]];
            }
            [self.sevenView addSubview:view];
        }
        
    }
    self.sevenView.frame = bigFrame;
    
    
    
    
    threeFrame.size.height = CGRectGetMaxY(self.sevenView.frame) + kWidthChange(15);
    
    self.downView.frame = threeFrame;
    
    CGRect kuaiDiView = self.KuaiDiView.frame;
    kuaiDiView.origin.y = CGRectGetMaxY(threeFrame) + kWidthChange(20);
    self.KuaiDiView.frame = kuaiDiView;
    self.scrollerView.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(kuaiDiView));
}

#pragma mark--退款圆心
-(void)clickTuiKuanYuanYin:(UITapGestureRecognizer *)sender {
    
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
      
        NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:1];
        
        
        for (NSDictionary *newDic in self.tempDic[@"reason"]) {
            NSMutableDictionary *bigDic = [[NSMutableDictionary alloc]initWithDictionary:newDic];
            [bigDic setObject:@"0" forKey:@"click"];
            [dataArray addObject:bigDic];
        }
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.THYY == nil) {
                self.THYY = [[THYYView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
                self.THYY.dataArray = dataArray;
                [[UIApplication sharedApplication].keyWindow addSubview:self.THYY];
            }else {
                self.THYY.hidden = NO;
                
                
            }
            __weak typeof(self)weskSelf = self;
            self.THYY.clickBlock = ^(NSString * _Nonnull newId) {
                weskSelf.TuiHuoYuanYinTF.text = [NSString stringWithFormat:@"%@",newId];
            };
        });
        
        
    });
    
    
}

#pragma mark--添加图片
-(void)clickHeader:(UIButton *)sender {
    
    __weak typeof(self)weakSelf = self;
    [self setUpWithMyImage:self isFrom:@""];
    self.myImage = ^(NSDictionary *newDic) {
        
        [weakSelf.imageArray insertObject:newDic atIndex:weakSelf.imageArray.count - 1];
        [weakSelf setUpWithMyNameimageArray:weakSelf.imageArray];
        
        
        
    };
    
}
#pragma mark---建好
-(void)clickJianBT:(UIButton *)sender {
    
 
    UILabel *numberlabel = (UILabel *)[self.view viewWithTag:sender.tag + 900];
    NSDictionary *newDic = [self.tempDic[@"list"] objectAtIndex:sender.tag - 100];
    int number = [numberlabel.text intValue];
    
    
    if (number == 0) {
        
        [Toos setUpWithMBP:@"该商品数量不能减少了" UIView:self.view];
        
        return;
    }
    
    number--;
    
    
     numberlabel.text = [NSString stringWithFormat:@"%d",number];
    
   
}

#pragma mark---加号
-(void)clickAddBT:(UIButton *)sender {
    
    
    UILabel *numberlabel = (UILabel *)[self.view viewWithTag:sender.tag - 9000];
    NSDictionary *newDic = [self.tempDic[@"list"] objectAtIndex:sender.tag - 10000];
    int number = [numberlabel.text intValue];
    
    
   
    if (number == [newDic[@"num"]intValue]) {
        
        [Toos setUpWithMBP:@"该商品数量不能增加了" UIView:self.view];
        
        return;
    }
    number++;
    numberlabel.text = [NSString stringWithFormat:@"%d",number];
}
-(void)clickTapSP:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
//    SPXQController *SPXQ = [[SPXQController alloc]init];
//    SPXQ.typeID = sender.titleLabel.text;
//    [self.navigationController pushViewController:SPXQ animated:YES];
    
    
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
