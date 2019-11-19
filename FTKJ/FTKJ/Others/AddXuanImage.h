//
//  AddXuanImage.h
//  TCZB
//
//  Created by ios on 2017/11/17.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^HeiMingDan)(NSString *newString);

typedef void(^myImage)(NSDictionary *newDic);
typedef void(^img)(UIImage *img);
typedef void(^imgurl)(NSString *imgurl);

typedef void(^JuBao)(NSInteger temp);

@interface AddXuanImage : NSObject

- (void)setUpWithMyImage:(UIViewController *)myView;


-(UIView *)setUpWithSearchView:(CGRect)frame myView:(UIViewController *)myView  XBianJu:(CGFloat)XBianJu isFrom:(NSString *)isFrom YFrame:(CGFloat)YFrame backGrondColor:(UIColor *)backGrondColor text:(NSString *)text textColor:(UIColor *)textColor textFont:(CGFloat)textFont imageFrame:(CGRect)imageFrame;



@property(nonatomic,retain)UIViewController *myView;

@property(nonatomic,copy)myImage addImage;

@property(nonatomic,copy)JuBao juBao;
@property(nonatomic,copy)img img;
@property(nonatomic,copy)imgurl imgurl;

@property(nonatomic,copy)HeiMingDan mingDan;
@property(nonatomic,retain)NSString *MyString;

@property(nonatomic,retain)NSString *movieID;

@property(nonatomic,retain)NSString *isFrom;



+ (void)setupWithBigImage:(NSMutableArray *)imageArray imageView:(UIImageView *)imageView number:(NSInteger )number viewController:(UIViewController *)myView;


@end
