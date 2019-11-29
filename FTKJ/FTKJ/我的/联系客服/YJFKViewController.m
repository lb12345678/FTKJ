//
//  YJFKViewController.m
//  GZSC
//
//  Created by ios on 2018/9/11.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "YJFKViewController.h"

@interface YJFKViewController ()<UITextViewDelegate,UITextFieldDelegate>

@property(nonatomic,retain)UITextView *textView;

@property(nonatomic,retain)UILabel *messageLabel;

@property(nonatomic,retain)UITextField *phoneTF;

@property(nonatomic,retain)UILabel *numberLabel;

@property(nonatomic,retain)NSArray *titleArray;

@property(nonatomic,retain)NSString *titleID;

@property(nonatomic,retain)NSString *phoneStr;


@end

@implementation YJFKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"意见反馈";
   
    [self setUpWithData];
    self.phoneStr = [UserModel shared].mobile;
    // Do any additional setup after loading the view.
}
- (void)setUpWithData {
    
    NSDictionary *dic = @{@"token":[Toos setUpWithObjectForKey:@"token"],@"uid":[UserModel shared].uid};
    [Toos dataWithSessionurl:@"app/user/opinion_type" body:dic view:self.view token:@"" Block:^(id tempData) {
        if ([tempData[@"status"]intValue] == 1) {
            
            [self setUpWithBigView:tempData];
            
            
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        }
        
        
    } failBlock:^(id tempData) {
        
    }];
    
    
    
}


- (void)setUpWithBigView:(NSDictionary *)newDic {
    
    UIScrollView *scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight - kTopHeight - kWidthChange(41) - 20)];
    scrollerView.showsVerticalScrollIndicator = NO;
    scrollerView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:scrollerView];
    
    UIView *oneView = [Toos setBigView:kWidthChange(0) origin:0];
    [scrollerView addSubview:oneView];
    
    
    UIView *twoView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(oneView.frame), kScreenWidth, kWidthChange(60))];
    twoView.backgroundColor = [UIColor whiteColor];
    [scrollerView addSubview:twoView];
    
    
    UILabel *twoFristLabel = [Toos setUpWithUserLabel:@"问题类型" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - 24, kWidthChange(60)) color:[UIColor whiteColor] textColor:newColor(51, 51, 51, 1) textSize:kWidthChange(16)];
    
   
    
    [twoView addSubview:twoFristLabel];
    
    UIImageView *rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    rightImage.frame = CGRectMake(kScreenWidth - kWidthChange(20) - 6, kWidthChange(30) - 11 / 2, 6, 11);
    [twoView addSubview:rightImage];
  
    
    
    UILabel *twoLabel = [Toos setUpWithUserLabel:@"请选择问题类型" CGRect:CGRectMake(0, 0, kScreenWidth - kWidthChange(20) - kWidthChange(6) - kWidthChange(15), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(139, 140, 142, 1) textSize:kWidthChange(16)];
    
    twoLabel.textAlignment = NSTextAlignmentRight;
    
    [twoView addSubview:twoLabel];
    
    
    
  
    
    self.titleArray = newDic[@"data"];
    CGRect twoFrame = twoView.frame;
    
    int lie=0;
    
    lie= 3;
    int Allcount= [newDic[@"data"]count];
    int line=Allcount/lie;
    if(Allcount%lie>0)
        line++;
    
    
    
    
//    twoFrame.size.height = line  * kWidthChange(31) + (line - 1 ) * 15 + 15 + CGRectGetMaxY(twoLineLabel.frame) + 15 ;
//
//
//    CGFloat w = 12;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
//    CGFloat h = CGRectGetMaxY(twoLineLabel.frame) + 18;//用来控制button距离父视图的高
//    for (int i = 0; i < Allcount; i++) {
//        UILabel *view = [[UILabel alloc]init];
//        view.tag = i + 200;
//        //根据计算文字的大小
//
//        //为button赋值
//        //label.text = array;
//        view.backgroundColor = [UIColor whiteColor];
//        //设置button的frame
//        view.frame = CGRectMake( w, h , (kScreenWidth - 24 - 36) / 3 ,kWidthChange(31));
//
//        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
//        if(w + (kScreenWidth - 24 - 36) / 3 > twoFrame.size.width + 3){
//            w = 12; //换行时将w置为0
//            h = h + view.frame.size.height + 15 ;//距离父视图也变化
//            view.frame = CGRectMake( w, h, (kScreenWidth - 24 - 36) / 3,kWidthChange(31));//重设button的frame
//        }
//        w = view.frame.size.width + view.frame.origin.x + 18;
//
//        view.layer.masksToBounds = YES;
//        view.layer.cornerRadius = 5;
//        view.layer.borderWidth = .6;
//        view.layer.borderColor = newColor(217, 217, 217, 1).CGColor;
//        view.textAlignment = NSTextAlignmentCenter;
//        view.font = [UIFont systemFontOfSize:kWidthChange(14)];
//        view.textColor = newColor(102, 102, 102, 1);
//        view.text = [NSString stringWithFormat:@"%@",[newDic[@"data"] objectAtIndex:i ][@"type"]];
//        view.userInteractionEnabled = YES;
//        view.backgroundColor = [UIColor whiteColor];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTap:)];
//        [view addGestureRecognizer:tap];
//
//        [twoView addSubview:view];
//    }
//    twoView.frame = twoFrame;

    
    UIView *fourView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(twoView.frame) + kWidthChange(15), kScreenWidth, kWidthChange(60))];
    
    
    fourView.backgroundColor = [UIColor whiteColor];
    [scrollerView addSubview:fourView];
    
    UILabel *fiveLabel = [Toos setUpWithUserLabel:@"联系电话" CGRect:CGRectMake(kWidthChange(20), 0, [Toos textRect:@"联系电话" textFont:[UIFont systemFontOfSize:kWidthChange(14)]], kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(51, 51, 51, 1) textSize:kWidthChange(16)];
    
    
    
    [fourView addSubview:fiveLabel];
    
    
    
    
    self.phoneTF = [[UITextField alloc]initWithFrame:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(40) , kWidthChange(60))];
    self.phoneTF.text = [NSString stringWithFormat:@"%@",[[UserModel shared].mobile stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"]];
    
    self.phoneTF.font = [UIFont systemFontOfSize:kWidthChange(16)];
    self.phoneTF.delegate = self;
    self.phoneTF.textColor = newColor(51, 51, 51, 1);
    
    self.phoneTF.keyboardType = UIKeyboardTypePhonePad;
    
    self.phoneTF.textAlignment = NSTextAlignmentRight;
    
    [fourView addSubview:self.phoneTF];
    
    
    
    
    
    
    UIView *threeView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(fourView.frame) + kWidthChange(15), kScreenWidth, kWidthChange(198))];
    threeView.backgroundColor = [UIColor whiteColor];
    [scrollerView addSubview:threeView];
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(40), kWidthChange(198) - 24)];
    self.textView.textColor = newColor(51, 51, 51, 1);
    self.textView.font = [UIFont systemFontOfSize:kWidthChange(14)];
    [threeView addSubview:self.textView];
    self.textView.delegate = self;
    
    self.messageLabel = [Toos setUpWithUserLabel:@"请输入您要反馈的问题内容" CGRect:CGRectMake(0, 0, kScreenWidth, kWidthChange(20)) color:[UIColor clearColor] textColor:newColor(102, 102, 102, 1) textSize:kWidthChange(14)];
    
    [self.textView addSubview:self.messageLabel];
    
    
    self.numberLabel = [Toos setUpWithUserLabel:@"1/600" CGRect:CGRectMake(0, kWidthChange(198) - 24 - 12, kScreenWidth - 12, 12) color:[UIColor whiteColor] textColor:newColor(102, 102, 102, 1) textSize:kWidthChange(14)];
    self.numberLabel.textAlignment = NSTextAlignmentRight;
    //[threeView addSubview:self.numberLabel];
    
    
    
  
    
  
    
    scrollerView.contentSize = CGSizeMake(0, CGRectGetMaxY(fourView.frame));
    
    
    UIButton *TJBT = [UIButton buttonWithType:UIButtonTypeCustom];
    
    TJBT.frame = CGRectMake(11, kScreenHeight - 30 - kWidthChange(41),kScreenWidth - 22, kWidthChange(41));
    TJBT.backgroundColor = newColor(233, 20, 50, 1);
    [TJBT setTitle:@"提交" forState:UIControlStateNormal];
    [TJBT setTitleColor:newColor(255, 255,255, 1) forState:UIControlStateNormal];
    TJBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    TJBT.layer.masksToBounds = YES;
    TJBT.layer.cornerRadius = kWidthChange(41) / 2;
    [self.view addSubview:TJBT];
    [TJBT addTarget:self action:@selector(clickTJBT:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)textViewDidChange:(UITextView *)textView {
    
    self.numberLabel.text = [NSString stringWithFormat:@"%ld/600",textView.text.length];
    
    
}


#pragma mark---选择类型
-(void)clickTap:(UITapGestureRecognizer *)sender {
    
    UILabel *newLabel = (UILabel *)sender.view;
    
    
    for (int i = 200; i < self.titleArray.count + 200; i++) {
        UILabel *label = (UILabel *)[self.view viewWithTag:i];
        if (label == newLabel) {
            newLabel.layer.borderColor = newColor(245, 61, 5, 1).CGColor;
          
            newLabel.textColor = [UIColor whiteColor];
          
            newLabel.backgroundColor = newColor(245, 61, 5, 1);
        }else {
            label.layer.borderColor = newColor(217, 217, 217, 1).CGColor;
          
            label.textColor = newColor(102, 102, 102, 1);
         
            label.backgroundColor = [UIColor whiteColor];
        }
    }
    
    self.titleID = [self.titleArray objectAtIndex:newLabel.tag - 200][@"id"];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    self.phoneStr = textField.text;
}


#pragma mark---提交
-(void)clickTJBT:(UIButton *)sender {
    if (self.phoneTF.text.length == 0) {
        
        [Toos setUpWithMBP:@"请输入您的联系方式" UIView:self.view];
        return;
    }
    if ([Toos isBlank:self.titleID]) {
        
        [Toos setUpWithMBP:@"请选择反馈类型" UIView:self.view];
        return;
    }
    
    if (self.textView.text.length == 0) {
        
          [Toos setUpWithMBP:@"请输入反馈内容" UIView:self.view];
        
        return;
    }
    
    NSDictionary *newDic = @{@"token":[Toos setUpWithObjectForKey:@"token"],@"uid":[UserModel shared].uid,@"type":self.titleID,@"content":self.textView.text,@"phone":self.phoneStr};
    
    [Toos dataWithSessionurl:@"app/user/opinion" body:newDic view:self.view token:@"" Block:^(id tempData) {
        if ([tempData[@"status"]intValue] == 1) {
            [Toos JiaZaiAnimation:tempData[@"msg"] myView:self.view block:^(id temp) {
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
            
            
        }
        
        
    } failBlock:^(id tempData) {
        
    }];
    
    
    
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    self.messageLabel.hidden = YES;
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
