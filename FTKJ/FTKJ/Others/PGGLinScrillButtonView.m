//
//  PGGLinScrillButtonView.m
//  PGGFrame
//
//  Created by IOS on 2017/9/20.
//  Copyright © 2017年 com.xiewei. All rights reserved.
//

#import "PGGLinScrillButtonView.h"

@implementation PGGLinScrillButtonView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    if(scv == nil)
    {
        _isscroll = YES;
        scv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
        [scv setShowsVerticalScrollIndicator:NO];
        [scv setShowsHorizontalScrollIndicator:NO];
        [self addSubview:scv];
        
        UIView *viewline = [[UIView alloc] initWithFrame:CGRectMake(0, scv.frame.size.height-1, scv.frame.size.width, 1)];
        //    [viewline setBackgroundColor:[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]];
        [scv addSubview:viewline];
        
        arrbt = [NSMutableArray new];
        float fw = 0.0;
        int icc = (int)_arrbttitle.count;
       if(icc>4 && ![self.isFrom isEqualToString:@"1"])
       {
           icc=4;
        }else {
            icc=(int)_arrbttitle.count;;
       }

        
        for(int i = 0 ; i < _arrbttitle.count; i++)
        {
            UIButton *bt = [self drawbt:CGRectMake(scv.frame.size.width/icc*i, 0, scv.frame.size.width/icc, scv.frame.size.height) andtitle:_arrbttitle[i]];
            [bt setTag:i];
            [scv addSubview:bt];
            
            [bt addTarget:self action:@selector(btAction:) forControlEvents:UIControlEventTouchUpInside];
            [arrbt addObject:bt];
            
            fw = bt.right;
        }
        [scv setContentSize:CGSizeMake(fw, 0)];
        
        
        UIView *viewmh = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, scv.frame.size.height)];
        [viewmh setRight:scv.frame.size.width];
        [self addSubview:viewmh];
        [self drawjianbian:viewmh];
        [viewmh setHidden:!_isshowmeng];
        
        if(_btselect == nil && _inomoselect == 0)
        {
            [self btAction:arrbt[0]];
        }
        else
        {
            [self btAction:arrbt[_inomoselect]];
        }
    }
    
    
    
    
}

-(void)drawjianbian:(UIView *)view
{
    
    //为透明度设置渐变效果
    UIColor *colorOne = [UIColor colorWithRed:(200/255.0)  green:(200/255.0)  blue:(200/255.0)  alpha:0.2];
    UIColor *colorTwo = [UIColor colorWithRed:(200/255.0)  green:(200/255.0)  blue:(200/255.0)  alpha:1.0];
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    //设置开始和结束位置(设置渐变的方向)
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 0);
    gradient.colors = colors;
    gradient.frame = CGRectMake(0, 0, 40, 40);
    [view.layer insertSublayer:gradient atIndex:0];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [scv setScrollEnabled:_isscroll];
    
    
}

-(UIButton *)drawbt:(CGRect)rect andtitle:(NSString *)strtitle
{
    UIButton *bt = [[UIButton alloc] initWithFrame:rect];
    [bt setClipsToBounds:YES];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 9, 9)];
    [lb setText:strtitle];
    [lb setTextColor:[UIColor colorWithRed:139/255.0 green:139/255.0 blue:139/255.0 alpha:1]];
    [lb setTextAlignment:NSTextAlignmentCenter];
    [lb setFont:[UIFont fontWithName:@"PingFang-SC-Medium" size:14]];
    [lb sizeToFit];
    [bt addSubview:lb];
    [lb setCenter:CGPointMake(bt.width/2.0, bt.height/2.0)];
    
    
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, lb.width*1.4, 1.5)];
    [imgv setBackgroundColor:[UIColor clearColor]];
    [bt addSubview:imgv];
    [imgv setCenter:CGPointMake(bt.width/2.0, bt.height/2.0)];
    [imgv setBottom:bt.height];
//    [imgv setTop:lb.bottom+3];
//    [imgv setLeft:lb.left];
    
//    [bt setWidth:lb.width+20];
    return bt;
}

-(void)btAction:(UIButton *)sender
{
    if(_btselect != nil && _btselect.tag == sender.tag)return;
    if(_btselect != nil)
    {
        for(UIView *view in _btselect.subviews)
        {
            if([view isKindOfClass:[UILabel class]])
            {
                UILabel *lb = (UILabel *)view;
                [lb setTextColor:[UIColor colorWithRed:139/255.0 green:139/255.0 blue:139/255.0 alpha:1]];
            }
            else if([view isKindOfClass:[UIImageView class]])
            {
                UIImageView *imgv = (UIImageView *)view;
                [imgv setBackgroundColor:[UIColor clearColor]];
            }
        }
    }
    if(_btselect != nil)
    {
        if(sender.tag != _btselect.tag)
        {
            [self.degelate selectTag:(int)sender.tag];
        }
    }
    else
    {
        [self.degelate selectTag:(int)sender.tag];
    }
    _btselect = sender;
    
    for(UIView *view in _btselect.subviews)
    {
        if([view isKindOfClass:[UILabel class]])
        {
            UILabel *lb = (UILabel *)view;
            [lb setTextColor:newColor(0, 0, 0, 1)];
        }
        else if([view isKindOfClass:[UIImageView class]])
        {
            UIImageView *imgv = (UIImageView *)view;
            [imgv setBackgroundColor:newColor(0, 0, 0, 1)];
        }
    }
    
    _inomoselect = (int)_btselect.tag;
    
}

-(void)selectbttag:(int)itag
{
    
   
    
    [self btAction:arrbt[itag]];
}


@end
