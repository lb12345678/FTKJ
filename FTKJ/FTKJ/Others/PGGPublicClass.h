//
//  PGGPublicClass.h
//  PetPlanet
//
//  Created by 王钶 on 14/11/11.
//  Copyright (c) 2014年 com.xw.cwxq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGGPublicClass : NSObject<UIAlertViewDelegate>

///lb计算文本的宽和高
+(CGSize)countTextSize:(CGSize)size andtextfont:(UIFont *)font andtext:(NSString *)str;

///去掉cell中多余的线
+(void)setExtraCellLineHidden: (UITableView *)tableView;

///利用正则表达式验证邮箱
+(BOOL)isValidateEmail:(NSString *)email;

///利用正则表达式验证电话
+(BOOL)isphonenumber:(NSString *)phone;

///保存图片
+(void)saveimage:(NSData *)data andpicname:(NSString *)strfile;

///图片的路径文件夹
+(NSString *)imagefile;

/*
 获得录音文件的绝对路径
 */
+ (NSString *) audioRecordingPath:(NSString *)fileNmaeParams;

///语音保存
+(void)saveAuido:(NSData *)data andname:(NSString *)strfile;

///自动清理文件
+(void)removeAutometicfile;

///对图片进行压缩
+(UIImage *)imgcut:(NSData *)dataimg;

///根据年月日计算星期
+(NSString *)counxq:(NSString *)year andmouth:(NSString *)mouth andday:(NSString *)day;

///根据年和月  返回当前月的天数
+(int)countday:(NSString *)year andmouth:(NSString *)mouth;

///时间戳转时间
+(NSString *)chuochangetime:(NSString *)str;

////时间转时间戳 strtype:yyyy-MM-dd HH:mm:ss
+(NSString *)timechangechuo:(NSString *)str andtype:(NSString *)strtype;

////yyyy-MM-dd HH:mm:ss
+(NSString *)chuochangetime:(NSString *)str andtype:(NSString *)strtype;

///判断文字是否全为空格
+(NSString *)judgekongge:(NSString *)str;

///获取当前时间 yyyy-MM-dd HH:mm:ss
+(NSString *)getnowdata:(NSString *)strtype bigType:(NSString *)type;

///单个文件的大小
+ (long long) fileSizeAtPath:(NSString*) filePath;

///遍历文件夹获得文件夹大小，返回多少M
+ (float ) folderSizeAtPath:(NSString*) folderPath;

+ (void) altetshow:(NSString *)strcontent;

//打电话
+(void)telPhone:(NSString *)strnumber;

///设置uitableview分割线左顶点绘制
+(void)settabviewcellLine:(UITableView *)tabview;

///tableview滚动到最后
+(void)backtoButton:(UITableView *)tableview;

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *) colorWithHexString: (NSString *)color;

///设置一行显示不同字体 颜色
+(NSMutableAttributedString *)arrstring:(NSString *)str andstart:(int)istart andend:(int)length andfont:(float)ff andcolor:(UIColor *)color;

///对图片进行缩
+(UIImage *)imgcutsuo:(UIImage *)image andsize:(CGSize)size;

///修改语言
+(void)changelanguage;

////得到string中英文
+(NSString *)getStringValue:(NSString *)strkey;

@end
