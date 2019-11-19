//
//  GeneralView.h
//  TTZS
//
//  Created by ios on 2018/4/13.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void(^AddTuPian)(NSInteger tag);

typedef void(^Deleter)(NSInteger tag);

typedef void(^Time)(NSString *beginTime,NSString *endTime);

typedef void(^xiangMu)(NSString *xiangmu);

@interface GeneralView : NSObject


- (UIView *)setUpWithOneBigView:(NSString *)isFrom;

@property(nonatomic,retain)UIViewController *MyView;

@property(nonatomic,copy)Time time;

@property(nonatomic,copy)xiangMu xaingMu;


@property(nonatomic,copy)AddTuPian AddTP;

@property(nonatomic,copy)Deleter ShanChu;


@property(nonatomic,retain)NSMutableArray *imageArray;



/*
 第一个：图片数量
 第二个：父视图
 第三个：每列数量
 第四个：图片宽
 第五个：图片高
 第六个：图片宽之间间距
 第七个：图片高之间间距
 第八个：图片上的叉号宽
 第八个：图片上的叉号高
 
 第十个：最后一张图片是否是添加和是否有叉号(1有2无)
 
 */


- (CGFloat)setUpWithMyImageCount:(NSMutableArray *)imageArray bigView:(UIView *)bigView number:(NSInteger)number weight:(CGFloat)weight height:(CGFloat)height weightJianJu:(CGFloat)weightJianJu heightJianJu:(CGFloat)heightJianJu chaWeight:(CGFloat)chaWight chaHeight:(CGFloat)chaHeight isFrom:(NSString *)isFrom;

@end
