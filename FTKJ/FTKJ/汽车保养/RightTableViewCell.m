//
//  RightTableViewCell.m
//  JZGL
//
//  Created by ios on 2019/8/5.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "RightTableViewCell.h"


@implementation RightTableViewCell

-(UIView *)bigView {
    
    if (_bigView == nil) {
        self.bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - kWidthChange(130), kWidthChange(1000))];
        self.bigView.backgroundColor = [UIColor whiteColor];
    }
    return _bigView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bigView];
    }
    return self;
}

-(void)setUpWithOneBigArray:(NSMutableArray *)dataArray {
    [self.bigView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    self.dataArray = dataArray;
    int lie=0;
    
    lie= 2;
    int Allcount= [dataArray count];
    int line=Allcount/lie;
    if(Allcount%lie>0)
        line++;
    
    
    CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat h = 0;//用来控制button距离父视图的高
    
     CGRect bigFrame = self.bigView.frame;
    
    bigFrame.size.height = line  * (( kScreenWidth - kWidthChange(130)) / 2 + kWidthChange(30))  ;
    
    
    for (int i = 0; i < dataArray.count; i++) {
        UIButton *bigView1 = [[UIButton alloc]initWithFrame:CGRectMake(w, h, ( kScreenWidth - kWidthChange(130)) / 2, ( kScreenWidth - kWidthChange(130)) / 2 )];
        
        
        bigView1.backgroundColor = [UIColor whiteColor];
        [bigView1 setTitle:[NSString stringWithFormat:@"%@",[dataArray objectAtIndex:i][@"id"]] forState:UIControlStateNormal];
        [bigView1 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [bigView1 addTarget:self action:@selector(setUpWithClick:) forControlEvents:UIControlEventTouchUpInside];
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
        if(w +( kScreenWidth - kWidthChange(130)) / 2 > bigFrame.size.width){
            w = 0; //换行时将w置为0
            h = h + bigView1.frame.size.height + 10 ;//距离父视图也变化
            bigView1.frame = CGRectMake( w, h, ( kScreenWidth - kWidthChange(130)) / 2,( kScreenWidth - kWidthChange(130)) / 2 );//重设button的frame
              NSLog(@"-------------%f",w);
        }
        w = bigView1.frame.size.width + bigView1.frame.origin.x  ;
        NSLog(@"+++++++++++%f",w);
       
        bigView1.userInteractionEnabled = YES;

        [self.bigView addSubview:bigView1];
        
        
        UIImageView *view = [[UIImageView alloc]init];
        view.tag = i + 200;
        //根据计算文字的大小
        //        [self.imageArray addObject:[NSString stringWithFormat:@"%@%@",APP_URlImage,  [newDic[@"imgarr"] objectAtIndex:i]]];
        //为button赋值
        //label.text = array;
        view.backgroundColor = [UIColor whiteColor];
        //设置button的frame
        view.frame = CGRectMake( kWidthChange(35), 0 , (kScreenWidth - kWidthChange(130)) / 2 - kWidthChange(35) ,(kScreenWidth - kWidthChange(130)) / 2 - kWidthChange(35));
        [view sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_IMAGEURl,[dataArray objectAtIndex:i][@"img"]]]];
        [bigView1 addSubview:view];
        
        UILabel *smallLabel = [Toos setUpWithUserLabel:[NSString stringWithFormat:@"%@",[dataArray objectAtIndex:i][@"title"]] CGRect:CGRectMake(kWidthChange(35), CGRectGetMaxY(view.frame) , (kScreenWidth - kWidthChange(130)) / 2 - kWidthChange(35) ,kWidthChange(35)) color:[UIColor clearColor] textColor:newColor(0, 0, 0, 1) textSize:kWidthChange(17)];
        smallLabel.textAlignment = NSTextAlignmentCenter;
         [bigView1 addSubview:smallLabel];
        smallLabel.userInteractionEnabled = NO;
        
        
    }
        
    self.bigView.frame = bigFrame;
        
        
    
    
    
}
+(CGFloat)tableViewHeightWithArray:(NSMutableArray *)dataArray {
    
    int lie=0;
    
    lie= 2;
    int Allcount= [dataArray count];
    int line=Allcount/lie;
    if(Allcount%lie>0)
        line++;
    
    
    
   return  line  * (( kScreenWidth - kWidthChange(130)) / 2 + kWidthChange(30)) + (line - 1 ) * 10 ;
   
}

-(void)setUpWithClick:(UIButton *)sender {

    if (self.ClickBlock) {
        self.ClickBlock(@"");
    }
//    self.viewController.hidesBottomBarWhenPushed = YES;
//    SCFLViewController *SCFL = [[SCFLViewController alloc]init];
//    SCFL.searchStr = @"";
//    SCFL.bigArray = self.dataArray;
//    SCFL.oneType = [[Toos readDataByPath:@"category"]objectAtIndex:self.numberType][@"id"];
//    SCFL.twoType = sender.titleLabel.text;
//
//
//
//    [self.viewController.navigationController pushViewController:SCFL animated:YES];
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
