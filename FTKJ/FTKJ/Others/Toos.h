//
//  Toos.h
//  AntApp
//
//  Created by 4 on 17/2/22.
//  Copyright © 2017年 4. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>


typedef void (^Block) (id tempData);
typedef void (^failBlock) (id tempData);

typedef void (^Agree) ();
typedef void (^registe) ();


typedef void (^downRefresh) ();//下啦刷新
typedef void (^UpRefresh) ();//上拉加载


typedef void (^Animation) (id temp);//上拉加载

@interface Toos : NSObject
+(UIWindow *)window;
+(CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request;
+ (void)setUpAlertViewController:(NSString *)title reject:(NSString *)regect agree:(NSString *)agree view:(UIViewController *)view Block:(Agree)block failBlock:(registe)failblock ;


//左右BarBtnItem
+(UIBarButtonItem *)barButtonItemWith:(CGRect)fe  type:(UIButtonType)type title:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)select navigationItem:(UINavigationItem*)nav leftAndRight:(BOOL)leftRight;

//左右BarBtnItem
+(UIBarButtonItem *)barButtonItemWith:(CGRect)btnFrame title:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)select navigationItem:(UINavigationItem*)nav leftAndRight:(BOOL)leftRight color:(UIColor *)color textColor:(UIColor *)textColor;

//一边有一个lab和btn
+(UIBarButtonItem *)twoBarButtonItemTitleWith:(CGRect)btn1Frame btnFrame:(CGRect)btn2Frame title:(NSString *)title color:(UIColor *)color image:(UIImage *)image target:(id)target action:(SEL)select navigationItem:(UINavigationItem*)nav leftAndRight:(BOOL)leftRight;

+(UILabel *)setUpWithUserLabel:(NSString *)text CGRect:(CGRect)CGRect color:(UIColor *)color textColor:(UIColor *)textColor textSize:(CGFloat)size;

//隐藏tabbar
+(void)hideTabBar:(UITabBarController *)tabBarController view:(UIView *)contentView;


//显示tabbar
+(void)showTabBar:(UITabBarController *)tabBarController view:(UIView *)contentView;

+(void)setUpWithMBP:(NSString *)text UIView:(UIView *)view;


//string中是否有中文
+(BOOL)isChinese:(NSString *)str;
+(void)postImages:(NSMutableArray *)arrimages andkey:(NSString *)strkey andpram:(id )strpra inistback:(Block)block;

//压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

//图片转字符串
+(NSString *)UIImageToBase64Str:(UIImage *) image;

//字符串转图片

+(UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr;


//计算label的宽高
+(CGFloat)textRect:(NSString *)text  textFont:(UIFont*)textfont;
//计算label的高度

+(CGFloat)textRectWithHeight:(NSString *)text  textFont:(UIFont*)textfont weight:(CGFloat)weight;
//保存用户登录的撕号和userId

+(void)saveUserInfoWithData:(NSDictionary *)data;

+ (void)saveUserID:(NSInteger)uid forKey:(NSString *)key;

//提取用户保存的本地信息
+(NSString *)getUserInfoForKey:(NSString *)key;

//修改某个用户信息

+(void)updateUserInfoWithKey:(NSString *)key AndObject:(id )obj;



+ (id)setUpWithObjectForKey:(NSString *)key;



//头像存储本地
+ (void)saveUserPic:(UIImage *)image;

//提取本地存储头像
+ (UIImage *)takeUserPic;


+(BOOL)isBlank:(id)obj;

+(BOOL)isNotBlank:(id)obj;

/**
 *	@brief	判断对象是不是Null
 *
 *	@param 	obj 	对象
 *
 *	@return	返回BOOL值
 */
+(BOOL)isNull:(id)obj;

+(BOOL)isNotNull:(id)obj;
//数字转换 中文数字
+(NSString *)translationArabicNum:(NSInteger)arabicNum;

//解析列表Json字符串
+(NSArray *)getArrayByJsonString:(NSString *)str;

//解析字典Json字符串
+(NSDictionary *)getDictionaryByJsonString:(NSString *)str;

//列表生成Json字符串
+(NSString *)getJsonStringByArray:(NSArray *)array;

//字典生成Json字符串
+(NSString *)getJsonStringByDictionary:(NSDictionary *)dictionary;

+(NSString *)getJsonStringByArray:(NSArray *)array encoding:(NSStringEncoding)encoding;

+(NSArray *)getArrayByJsonString:(NSString *)str encoding:(NSStringEncoding)encoding;

+(NSDictionary *)getDictionaryByJsonString:(NSString *)str encoding:(NSStringEncoding)encoding;

+(NSString *)getJsonStringByDictionary:(NSDictionary *)dictionary encoding:(NSStringEncoding)encoding;

+(NSData *)getJSONDataFromString:(NSString *)str encoding:(NSStringEncoding)encoding;

+(NSData *)getJSONDataFromObject:(id)obj;

+ (void)receiveDataWithURLString:(NSString *)string url:(NSString *)url view:(UIView *)view method:(NSString *)method body:(NSDictionary *)body Block:(Block)block failBlock:(failBlock)failblock;
+(BOOL)isMobilePhoneNumber:(NSString *)str;

//当前网速
+ (long long)getInterfaceBytes;
#pragma mark---时间比较
+ (BOOL)setBeginTimeAndEndTime:(NSString *)beginTime endTime:(NSString *)endTime;

+ (NSURLSessionDataTask *)dataWithSessionurl:(NSString *)url body:(NSDictionary *)body view:(UIView *)view token:(NSString *)token Block:(Block)block failBlock:(failBlock)failblock;

+(void)postDataWithUrl:(NSString *)url params:(NSDictionary *)params imageDatas:(UIImage *)images Block:(Block)block failBlock:(failBlock)failblock;

+(void)startMultiPartUploadTaskWithURL:(NSString *)url
                           imagesArray:(NSArray *)images
                     parameterOfimages:(NSString *)parameter
                        parametersDict:(NSDictionary *)parameters
                      compressionRatio:(float)ratio
                          succeedBlock:(void(^)( id responseObject))succeedBlock
                           failedBlock:(void(^)(id operation, NSError *error))failedBlock
                   uploadProgressBlock:(void(^)(float uploadPercent,long long totalBytesWritten,long long totalBytesExpectedToWrite))uploadProgressBlock view:(UIView *)view;

+(NSString *)backDocumentsPathWithFileName:(NSString *)fileName;
#pragma mark-----存储数组--
+ (void)saveArray:(NSString *)name string:(NSMutableArray  *)string;
#pragma mark----读取数组
+ (NSMutableArray *)readArrayByPath:(NSString *)name;

#pragma mark----是否允许推送
+ (void)setPushMessage;

#pragma mark---是否允许访问通讯录
+(void)requestAuthorizationForAddressBook;

#pragma mark----label字体
+ (NSMutableAttributedString *)setUpWithtext:(NSString *)text color:(UIColor *)color color1:(UIColor *)color1 font:(NSInteger )font font1:(NSInteger )font1 length:(NSInteger)length length1:(NSInteger)length1;

#pragma mark---监测手机号
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
#pragma mark----验证身份证号
//正则匹配用户身份证号15或18位
+(BOOL)validateIDCardNumber:(NSString *)value;

#pragma mark---验证银行卡号

+ (BOOL) IsBankCard:(NSString *)cardNumber;

#pragma mark---验证是否是数字
+ (BOOL)deptNumInputShouldNumber:(NSString *)num;
+ (CGSize)getImageSizeWithURL:(NSURL *)url;

+ (UIImage *)imageWithColor:(UIColor *)color image:(UIImage *)image;

+(UIImageView *)setUpWithImage:(CGRect)frame;
#pragma mark---验证中文
//1、判断输入的字符串是否有中文

+(BOOL)IsChinese:(NSString *)str;

+ (NSMutableDictionary *) entityToDictionary:(id)entity;

#pragma mark---时间戳
+(NSString*)getCurrentTimestamp;

#pragma mark--fanhuishiian
+ (NSString *)setUpWithTime:(NSString *)time foementData:(NSString *)fomentData;
#pragma mark - fanhuishijianchuo
+(NSString*)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;
#pragma mark---图文混排
+ (NSAttributedString *)setUpWithNewAttributedString:(NSString *)imagename name:(NSString *)name number:(int)number CGRect:(CGRect)CGRect;

+ (UIImageView *)findHairlineImageViewUnder:(UIView *)view ;

+ (MJRefreshHeader *)RefreshHeader:(downRefresh)down;


+ (MJRefreshAutoFooter *)RefreshFooter:(UpRefresh)Up;


#pragma mark---拆分数组
+(NSArray *)splitArray: (NSArray *)array withSubSize : (int)subSize;

#pragma mark----布局
//1图左问右。2:图有文作。3:图上问下。4:图下文上
+ (UIView *)smallView:(CGRect)imageFrame labelFrame:(CGRect)labelFrame bigFrame:(CGRect)bigFrame type:(NSInteger)type labelText:(NSString *)text image:(NSString *)image font:(CGFloat)font textColor:(UIColor *)textColor;

//顶部试图
+(UIView *)setBigView:(CGFloat)height origin:(CGFloat)y;

#pragma mark---检测是否登录
+(BOOL)isLogin:(UIView *)myView;


#pragma mark----加载动画
+ (void)JiaZaiAnimation:(NSString *)string myView:(UIView *)myView  block:(Animation)block;

#pragma mark---汉语转阿拉伯数字
+(NSString *)translationArebicStr:(NSString *)chineseStr;


#pragma mark---补充
+ (BOOL)isBlankString:(NSString *)string;


+ (NSString *)convertTimeStampToDate:(NSString *)timeInterval;

+ (NSString *)convertTimeStampToTime:(NSString *)timeInterval;

+ (CGSize)getSizeWithString:(NSString *)string font:(UIFont *)font maxWidth:(CGFloat)maxWidth height:(CGFloat)height;

+ (UIImage *) createImageWithColor:(UIColor *) color;

#pragma mark---带间距的字符串
+(NSAttributedString *)setLabelSpacewithValue:(NSString*)str withFont:(UIFont*)font jianju:(float)jianju suojin:(float)suojin;

+(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width jianju:(float)jianju suojin:(float)suojin;

+(double )LantitudeLongitudeDistance:(double )other_lon other_Lat:(double )other_lat self_Lon:(double )self_lon self_Lat:(double )self_lat;

+ (double)distanceBetweenCoordinates:(CLLocation * )from and:(CLLocation *)to;
@end
