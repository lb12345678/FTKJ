//
//  FXEWMViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/25.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "FXEWMViewController.h"

@interface FXEWMViewController ()

@property(nonatomic,retain)UIView *alphaView;

@property(nonatomic,assign)BOOL isDrag;

@end

@implementation FXEWMViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
    
    
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpWithBigDic:@{}];
     [self setUpWithBigView];
    // Do any additional setup after loading the view.
}


-(void)setUpWithBigView {
    
   
        
    
        UIImageView *bigView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kTopHeight )];
        bigView.image = [UIImage imageNamed:@"bg7-1"];
        bigView.alpha = 0;
        
        [self.view addSubview:bigView];
        
        self.alphaView = bigView;
        
        UIButton *leftBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBT setImage:[UIImage imageNamed:@"box14-1"] forState:UIControlStateNormal];
        leftBT.frame = CGRectMake(kWidthChange(15), kStatusBarHeight + kWidthChange(10), kWidthChange(25), kWidthChange(25));
        [leftBT addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:leftBT];
        
        UILabel *nameLabel = [Toos setUpWithUserLabel:@"分享二维码" CGRect:CGRectMake(kScreenWidth / 2 - kWidthChange(80), kStatusBarHeight + kWidthChange(10), kWidthChange(160), kWidthChange(25)) color:[UIColor clearColor] textColor:[UIColor whiteColor] textSize:kWidthChange(20)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:nameLabel];
        
        
        
        
        
    }
    - (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
        if (scrollView == self.tableView) {
            self.isDrag = YES;
        }
    }
    
    -(void)scrollViewDidScroll:(UIScrollView *)scrollView {
        
        if (self.isDrag == YES) {
            
            
            CGFloat yoffset = scrollView.contentOffset.y;
            
            if (yoffset >0) {
                
                CGFloat alpha = MIN(1, yoffset/80);
                
                self.alphaView.alpha = alpha;
                
            }else {
                self.alphaView.alpha = 0;
                
            }
        }
    }
    
    
    -(void)clickReturn:(UIButton *)sender {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    
    
    
    -(void)setUpWithBigDic:(NSDictionary *)bigDic
    {
       
        UIImageView *oneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg1"]];
        oneImage.frame = CGRectMake(0, -kStatusBarHeight, kScreenWidth, kScreenHeight - downH + kStatusBarHeight);
        [self.view addSubview:oneImage];
        
        
        UILabel *cateLabel = [Toos setUpWithUserLabel:@"推荐好友获取佣金" CGRect:CGRectMake(0, kTopHeight + kWidthChange(35), kScreenWidth, kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(255, 255, 255, 1) textSize:kWidthChange(35)];
        [self.view addSubview:cateLabel];
      
        cateLabel.textAlignment = NSTextAlignmentCenter;
        
        UIImageView *twoImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg2"]];
        twoImage.frame = CGRectMake(kWidthChange(36), CGRectGetMaxY(cateLabel.frame) + kWidthChange(20), kScreenWidth - kWidthChange(72), (kScreenWidth - kWidthChange(72)) * 1.28);
        [self.view addSubview:twoImage];
        
        
        
        UILabel *timeLabel = [Toos setUpWithUserLabel:@"邀请二维码" CGRect:CGRectMake(0, kWidthChange(30), kScreenWidth  - kWidthChange(72), kWidthChange(40)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(24)];
        [twoImage addSubview:timeLabel];
        timeLabel.textAlignment = NSTextAlignmentCenter;
        
        
        UILabel *messageLabel = [Toos setUpWithUserLabel:@"扫描邀请二维码绑定注册，消费可获得佣金" CGRect:CGRectMake(0,CGRectGetMaxY(timeLabel.frame) , kScreenWidth  - kWidthChange(72), kWidthChange(30)) color:[UIColor clearColor] textColor:newColor(163, 164, 165, 1) textSize:kWidthChange(15)];
        [twoImage addSubview:messageLabel];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        
        
        UILabel *lineLabel = [Toos setUpWithUserLabel:@"" CGRect:CGRectMake(0,CGRectGetMaxY(messageLabel.frame) + kWidthChange(10), kScreenWidth  - kWidthChange(72), kWidthChange(1)) color:lineColor_gary textColor:newColor(163, 164, 165, 1) textSize:kWidthChange(15)];
        [twoImage addSubview:lineLabel];
      
        
       
        
        
        UIImageView *erWeiImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        erWeiImage.frame = CGRectMake((kScreenWidth - kWidthChange(72)) / 2 - kWidthChange(60), CGRectGetMaxY(lineLabel.frame) + kWidthChange(20), kWidthChange(120), kWidthChange(120));
        erWeiImage.backgroundColor = [UIColor redColor];
        [twoImage addSubview:erWeiImage];
        
        for (int i = 0; i < 2; i++) {
            UIButton *bayBT = [UIButton buttonWithType:UIButtonTypeCustom];
            bayBT.frame = CGRectMake( kWidthChange(70),  (kScreenWidth - kWidthChange(72)) * 1.28 - kWidthChange(120) + i * kWidthChange(60),kScreenWidth -  kWidthChange(140) - kWidthChange(72), kWidthChange(40));
            
            CGRect bayFrame = bayBT.frame;
            
            
            if (i == 0) {
                  bayBT.backgroundColor = newColor(231, 20, 51, 0);
                [bayBT setTitle:@"长安保存二维码可分享" forState:UIControlStateNormal];
                [bayBT setTitleColor:newColor(139, 140, 142, 1) forState:UIControlStateNormal];
                
                bayFrame.size.width = kScreenWidth - kWidthChange(72);
                bayFrame.origin.x = 0;
                
                
                
            }else {
                
                bayFrame.size.width = kScreenWidth - kWidthChange(140) - kWidthChange(72);
                bayFrame.origin.x = kWidthChange(70);
                  bayBT.backgroundColor = newColor(250, 123, 35, 1);
                bayBT.layer.masksToBounds = YES;
                bayBT.layer.cornerRadius = kWidthChange(20);
                [bayBT setTitle:@"保存图片" forState:UIControlStateNormal];
                [bayBT setTitleColor:newColor(255, 255, 255, 1) forState:UIControlStateNormal];
            }
          
            bayBT.frame = bayFrame;
           
            bayBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(17)];
            [twoImage addSubview:bayBT];
            [bayBT addTarget:self action:@selector(clickBayBT:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
     
        
        
        
    }

-(void)clickBayBT:(UIButton *)sender {
    
    
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
