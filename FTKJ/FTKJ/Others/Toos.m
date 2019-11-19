//
//  Toos.m
//  AntApp
//
//  Created by 4 on 17/2/22.
//  Copyright © 2017年 4. All rights reserved.
//

#import "Toos.h"
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>
#import <Availability.h>

#import "AppDelegate.h"

@implementation Toos
+(UIWindow *)window
{
    return [[[UIApplication sharedApplication]delegate]window];
}


+ (void)setUpAlertViewController:(NSString *)title reject:(NSString *)regect agree:(NSString *)agree view:(UIViewController *)view Block:(Agree)block failBlock:(registe)failblock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
   
    
    //拒绝按钮
    UIAlertAction *reject = [UIAlertAction actionWithTitle:regect style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        failblock();
        
    }];
    
    //同意
    UIAlertAction *agreeAction = [UIAlertAction actionWithTitle:agree style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        
        block();
    }];

    
    
   
    [alertController addAction:reject];
     [alertController addAction:agreeAction];
    
    [view presentViewController:alertController animated:YES completion:nil];
    
    
}
+(UIBarButtonItem *)barButtonItemWith:(CGRect)fe  type:(UIButtonType)type title:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)select navigationItem:(UINavigationItem*)nav leftAndRight:(BOOL)leftRight
{
    
    UIButton * Btn = [UIButton buttonWithType:type];
    Btn.layer.masksToBounds = YES;
    Btn.frame =fe;
    [Btn setBackgroundImage:image forState:UIControlStateNormal];
    [Btn setTitle:title forState:UIControlStateNormal];
    [Btn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Btn addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * barBtnItem = [[UIBarButtonItem alloc]initWithCustomView:Btn];
    
    if (leftRight) {
        nav.leftBarButtonItem =barBtnItem;
        
    }
    else
    {
        nav.rightBarButtonItem =barBtnItem;
        
    }
    
    
    return barBtnItem;
}

+(UILabel *)setUpWithUserLabel:(NSString *)text CGRect:(CGRect)CGRect color:(UIColor *)color textColor:(UIColor *)textColor textSize:(CGFloat)size{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRect];
    if (text) {
        if ([Toos isNotBlank:text]) {
             label.text = text;
        }
       
        
    }
    label.backgroundColor = color;
    label.textColor = textColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont setFontWithSize:size ];
    label.userInteractionEnabled = YES;
    return label;
}




+(UIBarButtonItem *)barButtonItemWith:(CGRect)btnFrame title:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)select navigationItem:(UINavigationItem*)nav leftAndRight:(BOOL)leftRight color:(UIColor *)color textColor:(UIColor *)textColor
{
    
    UIButton * Btn = [UIButton buttonWithType:UIButtonTypeSystem];
    Btn.layer.masksToBounds = YES;
    Btn.frame =btnFrame;
    [Btn setBackgroundImage:image forState:UIControlStateNormal];
    [Btn setTitle:title forState:UIControlStateNormal];
    [Btn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
   // [Btn setTitleColor:Black_Font forState:UIControlStateNormal];
    [Btn addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    Btn.backgroundColor = color;
    [Btn setTintColor:textColor];
    
    UIBarButtonItem * barBtnItem = [[UIBarButtonItem alloc]initWithCustomView:Btn];
    
    if (leftRight) {
        nav.leftBarButtonItem =barBtnItem;
        
    }
    else
    {
        nav.rightBarButtonItem =barBtnItem;
        
    }
    
    
    return barBtnItem;
}

+(UIBarButtonItem *)twoBarButtonItemTitleWith:(CGRect)btn1Frame btnFrame:(CGRect)btn2Frame title:(NSString *)title color:(UIColor *)color image:(UIImage *)image target:(id)target action:(SEL)select navigationItem:(UINavigationItem*)nav leftAndRight:(BOOL)leftRight
{
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,  btn1Frame.size.width+btn2Frame.size.width, btn2Frame.size.height)];
    //    bgView.backgroundColor = White_Default;
    
    
    UIButton * Btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    Btn1.layer.masksToBounds = YES;
    Btn1.frame =btn1Frame;
    [Btn1 setTitle:title forState:UIControlStateNormal];
    [Btn1.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [Btn1 setTitleColor:color forState:UIControlStateNormal];
    [Btn1 addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:Btn1];
    
    
    UIButton * Btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    Btn2.layer.masksToBounds = YES;
    Btn2.frame =btn2Frame;
    //    Btn.backgroundColor = Black_Font;
    [Btn2 setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [Btn2 addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:Btn2];
    
    UIBarButtonItem * barBtnItem = [[UIBarButtonItem alloc]initWithCustomView:bgView];
    
    if (leftRight) {
        nav.leftBarButtonItem =barBtnItem;
        
    }
    else
    {
        nav.rightBarButtonItem =barBtnItem;
        
    }
    
    
    return barBtnItem;
}

//隐藏
+(void)hideTabBar:(UITabBarController *)tabBarController view:(UIView *)contentView
{
    if (tabBarController.tabBar.hidden == YES) {
        return;
    }
    
    if ([[tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]]) {
        
        contentView = [tabBarController.view.subviews objectAtIndex:1];
        [contentView setBackgroundColor:[UIColor whiteColor]];
        
    }
    else
    {
        contentView = [tabBarController.view.subviews objectAtIndex:0];
        [contentView setBackgroundColor:[UIColor whiteColor]];
        contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y, contentView.bounds.size.width, contentView.bounds.size.height);
        tabBarController.tabBar.hidden = YES;
    }
}

//显示
+(void)showTabBar:(UITabBarController *)tabBarController view:(UIView *)contentView
{
    if (tabBarController.tabBar.hidden == NO) {
        return;
    }
    if ([[tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]]) {
        contentView = [tabBarController.view.subviews objectAtIndex:1];
        [contentView setBackgroundColor:[UIColor whiteColor]];
        
    }
    else
    {
        contentView = [tabBarController.view.subviews objectAtIndex:0];
        [contentView setBackgroundColor:[UIColor whiteColor]];
        contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y, contentView.bounds.size.width, contentView.bounds.size.height);
        tabBarController.tabBar.hidden =NO;
    }
}

+ (void)setUpWithMBP:(NSString *)text UIView:(UIView *)view{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
                          HUD.mode = MBProgressHUDModeText;
    
    if ([Toos isBlank:text]) {
        text=@"";
    }
                           HUD.label.text = text;
    
                          [HUD hideAnimated:YES afterDelay:1];
    HUD.removeFromSuperViewOnHide = YES;
}
//string中是否有中文
+(BOOL)isChinese:(NSString *)str
{
    for (int i = 0;  i<[str length]; i++) {
        int a =[str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        { return YES;
        }
    }
    return nil;
}

//压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}


//图片转字符串
+(NSString *)UIImageToBase64Str:(UIImage *) image

{
    
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return encodedImageStr;
    
}

//字符串转图片

+(UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr

{
    
    NSData *_decodedImageData   = [[NSData alloc] initWithBase64Encoding:_encodedImageStr];
    
    UIImage *_decodedImage      = [UIImage imageWithData:_decodedImageData];
    
    return _decodedImage;
    
}
//计算label的宽高
+(CGFloat)textRect:(NSString *)text  textFont:(UIFont*)textfont
{
    
    NSString *string;
    if ([Toos isNotBlank:text]) {
        string = text;
    }else {
        string = @"";
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
    label.text = string;
    label.font = textfont;
    [label sizeToFit];
    return label.frame.size.width;
}


+(CGFloat)textRectWithHeight:(NSString *)text  textFont:(UIFont*)textfont weight:(CGFloat)weight
{
    
    
    NSString *string;
    if ([Toos isNotBlank:text]) {
        string = text;
    }else {
        string = @"";
    }
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, weight, 1000)];
    label.text = string;
    label.font = textfont;
    label.numberOfLines = 0;
    [label sizeToFit];
    return label.frame.size.height;
}



+ (void)saveUserID:(NSInteger)uid forKey:(NSString *)key
{
    NSUserDefaults *manager = [NSUserDefaults standardUserDefaults];
    [manager setObject:@(uid) forKey:key];
}

+(NSString *)getUserInfoForKey:(NSString *)key
{
    NSUserDefaults *manager = [NSUserDefaults standardUserDefaults];
    return [manager objectForKey:key];
}


+(void)updateUserInfoWithKey:(NSString *)key AndObject:(id )obj
{
    
    NSUserDefaults *userDefults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:obj];
    
    
    
    [userDefults setValue:data forKey:key];

    [userDefults synchronize];
}

+ (id)setUpWithObjectForKey:(NSString *)key {
    if ([key isEqualToString:@"uid"]) {
        return @"1";
    }
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData * data = [userDefaults objectForKey:key];
    
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    
    if ([Toos isBlank:object]) {
        return @"";
    }
    
    
    
    return object;
    
}




//+(UserInfo *)getUser
//{
//    NSUserDefaults *manager = [NSUserDefaults standardUserDefaults];
//    return [NSKeyedUnarchiver unarchiveObjectWithData:[manager objectForKey:@"userInfo"]];
//}
//
//+(void)updataUser:(UserInfo *)user
//{
//    NSUserDefaults *manager = [NSUserDefaults standardUserDefaults];
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
//    [manager setValue:data forKey:@"userInfo"];
//    [manager synchronize];
//}

+ (void)saveUserPic:(UIImage *)image
{
    NSUserDefaults *manager = [NSUserDefaults standardUserDefaults];
    NSData *data = UIImagePNGRepresentation(image);
    [manager setValue:data forKey:@"userHeadPic"];
    [manager synchronize];
    
}

+ (UIImage *)takeUserPic
{
    NSUserDefaults *manager = [NSUserDefaults standardUserDefaults];
    NSData *data = [manager objectForKey:@"userHeadPic"];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

#pragma mark -
#pragma mark 为空判断
/**
 *	@brief	判断对象是否为空、NULL、nil
 *
 *	@param 	obj 	对象
 *
 *	@return	返回BOOL值
 */
+(BOOL)isBlank:(id)obj
{
    if(obj == [NSNull null] || obj == nil)return YES;
    if([obj isKindOfClass:[NSArray class]])
        return [obj count]==0;
    if([obj isKindOfClass:[NSMutableArray class]])
        return [obj count]==0;
    if([obj isKindOfClass:[NSDictionary class]])
        return [obj count]==0;
    if([obj isKindOfClass:[NSMutableDictionary class]])
        return [obj count]==0;
    if([obj isKindOfClass:[NSData class]])
        return [obj length]==0;
    if([obj isKindOfClass:[NSString class]])
        return [obj length]==0;
   
    return NO;
}

+(BOOL)isNotBlank:(id)obj{
    return ![self isBlank:obj];
}

/**
 *	@brief	判断对象是不是Null
 *
 *	@param 	obj 	对象
 *
 *	@return	返回BOOL值
 */
+(BOOL)isNull:(id)obj
{
    if(obj == [NSNull null] || obj == nil)return YES;
    return NO;
}

+(BOOL)isNotNull:(id)obj{
    return ![self isNull:obj];
}

+(void)postImages:(NSMutableArray *)arrimages andkey:(NSString *)strkey andpram:(id )strpra inistback:(Block)block
{
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
   
    
    
    [manage POST:[NSString stringWithFormat:@"%@/app/public/uploads",APP_URl] parameters:strpra constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        
        for (int i = 0; i < arrimages.count; i++)
        {
            if(![arrimages[i] isKindOfClass:[UIImage class]])continue;
            
            UIImage *image = arrimages[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            [formatter setDateFormat:@"yyyyMMddHHmmss"];
            
            NSString *dateString = [NSString stringWithFormat:@"%f%d",[[NSDate date] timeIntervalSince1970]*1000,i];
            
            NSString *fileName = [NSString  stringWithFormat:@"%@.jpg",dateString];
            
            
            NSLog(@"---%@----%@",dateString,fileName);
            
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"%@[]",strkey] fileName:fileName mimeType:@"image/jpeg"]; //
        }
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil);
    }];
    
    
}
+(void)receiveDataWithURLString:(NSString *)string url:(NSString *)url view:(UIView *)view method:(NSString *)method body:(NSDictionary *)body Block:(Block)block failBlock:(failBlock)failblock {
    
   
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",nil];
    if ([method isEqualToString:@"POST"]) {
      
        [manager POST:[NSString stringWithFormat:@"%@%@",string,url] parameters:body progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
              [MBProgressHUD hideHUDForView:view animated:YES];
             NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
            NSData *data=responseObject;
            
            if ([Toos isNotBlank:dictionary[@"head"]]) {
                
                if ([dictionary[@"head"][@"response_code"] isEqualToString:@"SUCCESS"]) {
                    
                    
                    
                    block(dictionary);
                }
                else {
                    block(dictionary);
                     [Toos setUpWithMBP:dictionary[@"head"][@"response_msg"] UIView:view];
                }
                
    
            }else {
                block(data);
                  [Toos setUpWithMBP:dictionary[@"errorMsg"] UIView:view];
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
             [MBProgressHUD hideHUDForView:view animated:YES];
             [Toos setUpWithMBP:@"请求失败" UIView:view];
             failblock (error);
        }];
        
         }else {
       
            
        [manager GET:[NSString  stringWithFormat:@"%@%@",string,url] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
             [MBProgressHUD hideHUDForView:view animated:YES];
            block(dictionary);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
             [MBProgressHUD hideHUDForView:view animated:YES];
             [Toos setUpWithMBP:@"请求失败" UIView:view];
            failblock (error);

        }];
        
    }
    
}

/**
 *	@brief	正则判断是否手机号
 *
 *	@param 	str 	字符串
 *
 *	@return	返回BOOL值
 */
+(BOOL)isMobilePhoneNumber:(NSString *)str
{
    if([Toos isBlank:str])return NO;
    NSString * regex = @"^[1][3-8]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:str];
}

+(NSArray *)getArrayByJsonString:(NSString *)str{
    return [self getArrayByJsonString:str encoding:NSUTF8StringEncoding];
}

+(NSDictionary *)getDictionaryByJsonString:(NSString *)str{
    return [self getDictionaryByJsonString:str encoding:NSUTF8StringEncoding];
}

+(NSString *)getJsonStringByArray:(NSArray *)array{
    return [self getJsonStringByArray:array encoding:NSUTF8StringEncoding];
}

+(NSString *)getJsonStringByDictionary:(NSDictionary *)dictionary{
    return [self getJsonStringByDictionary:dictionary encoding:NSUTF8StringEncoding];
}

+(NSString *)getJsonStringByArray:(NSArray *)array encoding:(NSStringEncoding)encoding{
    if([Toos isBlank:array])return nil;
    if(!encoding)return nil;
    NSData *JSONData = [self getJSONDataFromObject:array];
    return [[NSString alloc] initWithData:JSONData encoding:encoding];
}

+(NSArray *)getArrayByJsonString:(NSString *)str encoding:(NSStringEncoding)encoding{
    if([Toos isBlank:str])return nil;
    if(!encoding)return nil;
    NSData *JSONData = [self getJSONDataFromString:str encoding:encoding];
    return [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
}

+(NSDictionary *)getDictionaryByJsonString:(NSString *)str encoding:(NSStringEncoding)encoding
{
    if([Toos isBlank:str])return nil;
    if(!encoding)return nil;
    NSData *JSONData = [self getJSONDataFromString:str encoding:encoding];
    return [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
}

+(NSString *)getJsonStringByDictionary:(NSDictionary *)dictionary encoding:(NSStringEncoding)encoding{
    if([Toos isBlank:dictionary])return nil;
    if(!encoding)return nil;
    NSData *JSONData = [self getJSONDataFromObject:dictionary];
    return [[NSString alloc] initWithData:JSONData encoding:encoding];
}

+(NSData *)getJSONDataFromString:(NSString *)str encoding:(NSStringEncoding)encoding{
    if([Toos isBlank:str])return nil;
    if(!encoding)return nil;
    return [str dataUsingEncoding:encoding];
}

+(NSData *)getJSONDataFromObject:(id)obj{
    if([Toos isBlank:obj])return nil;
    NSError *error = nil;
    return [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&error];
}
#pragma mark---时间比较
+ (BOOL)setBeginTimeAndEndTime:(NSString *)beginTime endTime:(NSString *)endTime{
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
   
    int hour = (int) [dateComponent hour];
    int minute = (int) [dateComponent minute];
    
    
    int time = hour * 3600 + minute * 60;
    
    NSString *time1;
     NSString *time2;
    NSString *time3;
    NSString *time4;
    
    if (beginTime.length == 7) {
        time1 =   [beginTime substringWithRange:NSMakeRange(3, 1)];
        time2 =  [beginTime substringWithRange:NSMakeRange(5, 2)];
    }else {
        time1 =   [beginTime substringWithRange:NSMakeRange(3, 2)];
        time2 =  [beginTime substringWithRange:NSMakeRange(6, 2)];
    }
    
    if (endTime.length == 7 ) {
        time3 =   [endTime substringWithRange:NSMakeRange(3, 1)];
        time4  =  [endTime substringWithRange:NSMakeRange(5, 2)];
    }else {
        time3 =   [endTime substringWithRange:NSMakeRange(3, 2)];
       time4  =  [endTime substringWithRange:NSMakeRange(6, 2)];
    }
    
    
    int timeNow = [time1 intValue] * 3600 + [time2 intValue] * 60;
    int timeEnd = [time3 intValue] * 3600 + [time4 intValue] * 60;
  
  
    int timeEndNew;
       
    if (timeEnd < timeNow) {
        
        timeEndNew = timeEnd + 24 * 3600;
        if (timeNow < time && time < timeEndNew) {
            return YES;
        }else {
            return NO;
            
            
        }

        
    }else if (timeEnd == timeNow) {
        timeEndNew = timeEnd + 24 * 3600;
        if (timeNow < time && time < timeEndNew) {
            return YES;
        }else {
            return NO;
            
            
        }

    }else {
        if (timeNow < time && time < timeEnd) {
            return YES;
        }else {
            return NO;
            
            
        }

    }
    
}

+ (NSURLSessionDataTask *)dataWithSessionurl:(NSString *)url body:(NSDictionary *)body view:(UIView *)view token:(NSString *)token Block:(Block)block failBlock:(failBlock)failblock{
    
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest     requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_URl,url]]];
    
//    NSString *newToken = [NSString stringWithFormat:@"%@%@",@"gamea_",token];
//    [request addValue:newToken forHTTPHeaderField:@"Authorization"];
    
    if ([Toos isNotBlank:[DataBaseManager sharedFMDBManager].typeStr]) {
        request = [NSMutableURLRequest     requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://www.hiparty.fun/App/",url]]];
    }
    [request setHTTPMethod:@"POST"];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval:20];
    
    NSData * data1 = [NSJSONSerialization dataWithJSONObject:body
                                                     options:NSJSONWritingPrettyPrinted
                                                       error:nil];
    
    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSString *urlStr=[NSString stringWithFormat:@"%@%@",APP_URl,url];
//    urlStr =[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    NSMutableURLRequest *request = [NSMutableURLRequest     requestWithURL:[NSURL URLWithString:urlStr]];
////    NSString *newToken = [NSString stringWithFormat:@"%@%@",@"header_",token];
////    [request addValue:newToken forHTTPHeaderField:@"Authorization"];
//
//
//    [request setHTTPMethod:@"POST"];
//    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
//    [request setTimeoutInterval:20];
//
//    NSData * data1 = [NSJSONSerialization dataWithJSONObject:body
//                                                     options:NSJSONWritingPrettyPrinted
//                                                       error:nil];
   // [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    NSURLSessionDataTask * uploadTask = [session uploadTaskWithRequest:request fromData:data1 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if ([Toos isNull:data]) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [MBProgressHUD hideHUDForView:view animated:YES];
                NSLog(@"请求错误%@",error);
//                [Toos setUpWithMBP:@"网络连接失败" UIView:view];
                 failblock(@{@"msg":@"请求失败，请稍后重试"});
            });
            
            
        }else {
            
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            
            if (error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideHUDForView:view animated:YES];
                    NSLog(@"请求错误%@",error);
                    failblock(@{@"msg":@"请求失败，请稍后重试"});
//                    [Toos setUpWithMBP:@"请求失败" UIView:view];
                });
                
            }else {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideHUDForView:view animated:YES];
                    if ([dictionary[@"msg"]isEqualToString:@"您的帐号在其他地方登陆"]) {
                        [[NSNotificationCenter defaultCenter]postNotificationName:@"dengLuFail" object:nil];

                    }else if ([dictionary[@"code"]intValue] ==201) {
                        [Toos setUpWithMBP:dictionary[@"msg"] UIView:[UIApplication sharedApplication].keyWindow];
                    }else{

                        
                        block(dictionary);
                    }



//                    block(dictionary);
                });
               
//
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [MBProgressHUD hideHUDForView:view animated:YES];
//                    block(dictionary);
//                });

                
                
            }
            
            
            
        }
        
    }];
    [uploadTask resume];
    
    return uploadTask;
}
+(void)postDataWithUrl:(NSString *)url params:(NSDictionary *)params imageDatas:(UIImage *)images Block:(Block)block failBlock:(failBlock)failblock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         
                                                         @"text/html",
                                                         
                                                         @"image/jpeg",
                                                         
                                                         @"image/png",
                                                         
                                                         @"application/octet-stream",
                                                         
                                                         @"text/json",
                                                         
                                                         nil];
    
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
       
        
        NSData *data = UIImagePNGRepresentation(images);
        
        //上传的参数(上传图片，以文件流的格式)
        
        [formData appendPartWithFileData:data
         
                                    name:@"filename"
         
                                fileName:@"gauge.png"
         
                                mimeType:@"image/png"];

    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        block(responseObject);
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failblock(error);
    }];
    

}
+(void)startMultiPartUploadTaskWithURL:(NSString *)url
                           imagesArray:(NSArray *)images
                     parameterOfimages:(NSString *)parameter
                        parametersDict:(NSDictionary *)parameters
                      compressionRatio:(float)ratio
                          succeedBlock:(void (^)(id))succeedBlock
                           failedBlock:(void (^)(id, NSError *))failedBlock
                   uploadProgressBlock:(void (^)(float, long long, long long))uploadProgressBlock view:(UIView *)view{
    
    if (images.count == 0) {
        NSLog(@"上传内容没有包含图片");
        return;
    }
    
    [MBProgressHUD showHUDAddedTo:view animated:YES];
    
      AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
      manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    for (int i = 0; i < images.count; i++) {
        
        [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            //根据当前系统时间生成图片名称
            NSDate *date = [NSDate date];
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"yyyy年MM月dd日"];
            NSString *dateString = [formatter stringFromDate:date];
            
            NSString *fileName = [NSString stringWithFormat:@"%@%d.png",dateString,i];
            NSData *imageData;
            if (ratio > 0.0f && ratio < 1.0f) {
                imageData = UIImageJPEGRepresentation([images objectAtIndex:i], ratio);
            }else{
                imageData = UIImageJPEGRepresentation([images objectAtIndex:i], 1.0f);
            }
            
            [formData appendPartWithFileData:imageData name:parameter fileName:fileName mimeType:@"image/jpg/png/jpeg"];
            

        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
             succeedBlock(responseObject);
            
            if (images.count == 1) {
                [MBProgressHUD hideHUDForView:view animated:YES];
            }

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            //failedBlock(error);
            [MBProgressHUD hideHUDForView:view animated:YES];
        }];
        
//        [ manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//            
//            
//            //根据当前系统时间生成图片名称
//            NSDate *date = [NSDate date];
//            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//            [formatter setDateFormat:@"yyyy年MM月dd日"];
//            NSString *dateString = [formatter stringFromDate:date];
//            
//                NSString *fileName = [NSString stringWithFormat:@"%@%d.png",dateString,i];
//                NSData *imageData;
//                if (ratio > 0.0f && ratio < 1.0f) {
//                    imageData = UIImageJPEGRepresentation([images objectAtIndex:i], ratio);
//                }else{
//                    imageData = UIImageJPEGRepresentation([images objectAtIndex:i], 1.0f);
//                }
//                
//                [formData appendPartWithFileData:imageData name:parameter fileName:fileName mimeType:@"image/jpg/png/jpeg"];
//            
//            
//            
//            
//        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            succeedBlock(operation,responseObject);
//            if (images.count == 1) {
//                 [MBProgressHUD hideHUDForView:view animated:YES];
//            }
//            
//        } failure:^(AFHTTPSessionManager *operation, NSError *error) {
//            NSLog(@"%@",error);
//            failedBlock(operation,error);
//              [MBProgressHUD hideHUDForView:view animated:YES];
//            
//        } ];
      

        
    }
    

}

#pragma mark---图文label

+ (NSAttributedString *)setUpWithNewAttributedString:(NSString *)imagename name:(NSString *)name number:(int)number CGRect:(CGRect)CGRect{
    
    if ([Toos isNull:name]) {
        name = @"";
    }
    
    
    NSMutableAttributedString *attri =    [[NSMutableAttributedString alloc] initWithString:name];
    
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    
    attch.image = [UIImage imageNamed:imagename];
    
    attch.bounds = CGRect;
    
    
    
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    
    [attri insertAttributedString:string atIndex:number];
    
    
    return attri;
    
}
#pragma mark---获取文件路径 （封装）
+(NSString *)backDocumentsPathWithFileName:(NSString *)fileName {
    //获取document文件夹路径
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    //拼接上新的文件路径，使用方法二
    NSString *newFilePath = [documents stringByAppendingPathComponent:fileName];
    return newFilePath;//返回新的路径
}
#pragma mark-----存储数组--
+ (void)saveArray:(NSString *)name string:(NSMutableArray *)string {
    //1.获取封装方法，获取新文件路径
    NSString *arrayPath = [self backDocumentsPathWithFileName:name];
    
    NSMutableArray *listAry = [[NSMutableArray alloc]init];
    for (NSString *str in string) {
        if (![listAry containsObject:str]) {
            [listAry addObject:str];
        }
    }

    //3.写入文件
    BOOL isWrite = [listAry writeToFile:arrayPath atomically:YES];
    if (isWrite) {
        NSLog(@"写入成功");
    }else {
        NSLog(@"写入失败");
    }
    
    NSLog(@"%@",arrayPath );
//
    
    
}

#pragma mark----读取数组
+ (NSMutableArray *)readArrayByPath:(NSString *)name {
    //1.获取文件路径
    NSString *arrayPath = [self backDocumentsPathWithFileName:name];
    //2.通过路径获取数据
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:arrayPath];
    
    return array;
}

#pragma mark----是否允许推送
+ (void)setPushMessage {
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0f) {
        
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        
        if (UIUserNotificationTypeNone == setting.types) {
            [Toos updateUserInfoWithKey:@"pushOf" AndObject:@"no"];
            [Toos updateUserInfoWithKey:@"pushMessage" AndObject:@"no"];
            
        }
        else if(setting.types == /* DISABLES CODE */ (5))
        {
            [Toos updateUserInfoWithKey:@"pushOf" AndObject:@"yes"];
            
            [Toos updateUserInfoWithKey:@"pushMessage" AndObject:@"yes"];
            
          
            [Toos updateUserInfoWithKey:@"newSond" AndObject:@"no"];
            [Toos updateUserInfoWithKey:@"sond" AndObject:@"no"];
            
            
        }else {
            [Toos updateUserInfoWithKey:@"pushOf" AndObject:@"yes"];
            
            [Toos updateUserInfoWithKey:@"pushMessage" AndObject:@"yes"];
            
            [Toos updateUserInfoWithKey:@"newSond" AndObject:@"yes"];
            
            
            [Toos updateUserInfoWithKey:@"sond" AndObject:@"yes"];
        }
    }
    else
    {
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        
        if(UIRemoteNotificationTypeNone == type){
            [Toos updateUserInfoWithKey:@"pushOf" AndObject:@"no"];
            
            [Toos updateUserInfoWithKey:@"pushMessage" AndObject:@"no"];
            
        }
        else if(type == /* DISABLES CODE */ (5))
        {
            [Toos updateUserInfoWithKey:@"pushOf" AndObject:@"yes"];
            
            [Toos updateUserInfoWithKey:@"pushMessage" AndObject:@"yes"];
            
           
            [Toos updateUserInfoWithKey:@"newSond" AndObject:@"no"];
            [Toos updateUserInfoWithKey:@"sond" AndObject:@"no"];
            
        }else {
            [Toos updateUserInfoWithKey:@"pushOf" AndObject:@"yes"];
            
            [Toos updateUserInfoWithKey:@"pushMessage" AndObject:@"yes"];
            [Toos updateUserInfoWithKey:@"newSond" AndObject:@"yes"];
            [Toos updateUserInfoWithKey:@"sond" AndObject:@"yes"];
            
          
        }
    }
    

}

+(void)requestAuthorizationForAddressBook {
   // CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
   
    
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0f) {
        
        
        //iOS9授权
        CNContactStore *store = [[CNContactStore alloc] init];
        [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (error) {
                NSLog(@"error=%@",error);
            }
            if (granted) {
                [Toos updateUserInfoWithKey:@"MYAssressBook" AndObject:@"yes"];
                
                 [Toos updateUserInfoWithKey:@"myassressBook" AndObject:@"yes"];
                
            }else{
                [Toos updateUserInfoWithKey:@"MYAssressBook" AndObject:@"no"];
                
                 [Toos updateUserInfoWithKey:@"myassressBook" AndObject:@"no"];
            }
            
        }];

        
        
    } else {
       
         ABAddressBookRef book = ABAddressBookCreateWithOptions(NULL, NULL);
      
         ABAddressBookRequestAccessWithCompletion(book, ^(bool granted, CFErrorRef error) {
             if (granted) {
                 [Toos updateUserInfoWithKey:@"MYAssressBook" AndObject:@"yes"];
                  [Toos updateUserInfoWithKey:@"myassressBook" AndObject:@"yes"];
             }else{
                 [Toos updateUserInfoWithKey:@"MYAssressBook" AndObject:@"no"];
                  [Toos updateUserInfoWithKey:@"myassressBook" AndObject:@"no"];
             }
         });

    }
    
    
}

#pragma mark----label字体
+ (NSMutableAttributedString *)setUpWithtext:(NSString *)text color:(UIColor *)color color1:(UIColor *)color1 font:(NSInteger )font font1:(NSInteger )font1 length:(NSInteger)length length1:(NSInteger)length1{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    
    
    [str addAttribute:NSForegroundColorAttributeName
                value:color
                range:NSMakeRange(0, length)];
    
    [str addAttribute:NSForegroundColorAttributeName
                value:color1
                range:NSMakeRange(length, length1)];
    [str addAttribute:NSFontAttributeName value:[UIFont  systemFontOfSize:font] range:NSMakeRange(0, length)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font1] range:NSMakeRange(length, length1)];
    return str;
    
}
#pragma mark---监测手机号
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[356]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark----验证身份证号
//正则匹配用户身份证号15或18位
+(BOOL)validateIDCardNumber:(NSString *)value {
    
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSInteger length =0;
    if (!value) {
        return NO;
    }else {
        length = value.length;
        //不满足15位和18位，即身份证错误
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray = @[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    // 检测省份身份行政区代码
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag =NO; //标识省份代码是否正确
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return NO;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    //分为15位、18位身份证进行校验
    switch (length) {
        case 15:
            //获取年份对应的数字
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                //创建正则表达式 NSRegularExpressionCaseInsensitive：不区分字母大小写的模式
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            //使用正则表达式匹配字符串 NSMatchingReportProgress:找到最长的匹配字符串后调用block回调
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch >0) {
                //1：校验码的计算方法 身份证号码17位数分别乘以不同的系数。从第一位到第十七位的系数分别为：7－9－10－5－8－4－2－1－6－3－7－9－10－5－8－4－2。将这17位数字和系数相乘的结果相加。
                
                int S = [value substringWithRange:NSMakeRange(0,1)].intValue*7 + [value substringWithRange:NSMakeRange(10,1)].intValue *7 + [value substringWithRange:NSMakeRange(1,1)].intValue*9 + [value substringWithRange:NSMakeRange(11,1)].intValue *9 + [value substringWithRange:NSMakeRange(2,1)].intValue*10 + [value substringWithRange:NSMakeRange(12,1)].intValue *10 + [value substringWithRange:NSMakeRange(3,1)].intValue*5 + [value substringWithRange:NSMakeRange(13,1)].intValue *5 + [value substringWithRange:NSMakeRange(4,1)].intValue*8 + [value substringWithRange:NSMakeRange(14,1)].intValue *8 + [value substringWithRange:NSMakeRange(5,1)].intValue*4 + [value substringWithRange:NSMakeRange(15,1)].intValue *4 + [value substringWithRange:NSMakeRange(6,1)].intValue*2 + [value substringWithRange:NSMakeRange(16,1)].intValue *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                
                //2：用加出来和除以11，看余数是多少？余数只可能有0－1－2－3－4－5－6－7－8－9－10这11个数字 
                int Y = S %11; 
                NSString *M =@"F"; 
                NSString *JYM =@"10X98765432"; 
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 3：获取校验位 
                //4：检测ID的校验位 
                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) { 
                    return YES; 
                }else { 
                    return NO; 
                } 
                
            }else { 
                return NO; 
            } 
        default: 
            return NO; 
    } 
}
#pragma mark---验证银行卡号



+ (BOOL) IsBankCard:(NSString *)cardNumber
{
    if(cardNumber.length==0 || ![self deptNumInputShouldNumber:cardNumber])
    {
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < cardNumber.length; i++)
    {
        c = [cardNumber characterAtIndex:i];
        if (isdigit(c))
        {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--)
    {
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo)
        {
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}


+ (BOOL)deptNumInputShouldNumber:(NSString *)num {
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:num]) {
        return YES;
    }
    return NO;
}

+(CGSize)getImageSizeWithURL:(id)imageURL
{
    NSURL* URL = nil;
    if([imageURL isKindOfClass:[NSURL class]]){
        URL = imageURL;
    }
    if([imageURL isKindOfClass:[NSString class]]){
        URL = [NSURL URLWithString:imageURL];
    }
    if(URL == nil)
        return CGSizeZero;                  // url不正确返回CGSizeZero
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString* pathExtendsion = [URL.pathExtension lowercaseString];
    
    CGSize size = CGSizeZero;
    if([pathExtendsion isEqualToString:@"png"]){
        size =  [self getPNGImageSizeWithRequest:request];
    }
    else if([pathExtendsion isEqual:@"gif"])
    {
        size =  [self getGIFImageSizeWithRequest:request];
    }
    else{
        size = [self getJPGImageSizeWithRequest:request];
    }
    if(CGSizeEqualToSize(CGSizeZero, size))                    // 如果获取文件头信息失败,发送异步请求请求原图
    {
        NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:URL] returningResponse:nil error:nil];
        UIImage* image = [UIImage imageWithData:data];
        UIViewContentModeScaleAspectFit;
        if(image)
        {
            size = image.size;
        }
    }
    return size;
}
//  获取gif图片的大小
+(CGSize)getGIFImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 4)
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        short w = w1 + (w2 << 8);
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        short h = h1 + (h2 << 8);
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取jpg图片的大小
+(CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if ([data length] <= 0x58) {
        return CGSizeZero;
    }
    
    if ([data length] < 210) {// 肯定只有一个DQT字段
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    } else {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        if (word == 0xdb) {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            if (word == 0xdb) {// 两个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            } else {// 一个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        } else {
            return CGSizeZero;
        }
    }
}

//  获取PNG图片的大小
+(CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request
{
   
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 8)
    {
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}

+ (UIImage *)imageWithColor:(UIColor *)color image:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextClipToMask(context, rect, image.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//1、判断输入的字符串是否有中文

+(BOOL)IsChinese:(NSString *)str;{
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)//判断输入的是否是中文
        {
            return YES;
        }
    }
    return NO;
}


#pragma mark--返回图片
+(UIImageView *)setUpWithImage:(CGRect)frame{
    UIImageView *logoImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BUTTON"]];
   
    logoImage.frame = frame;
    logoImage.userInteractionEnabled = YES;
    // 设置端盖的值
//    CGFloat top = frame.size.height * .5;
//    CGFloat left = frame.size.width * .1;
//    CGFloat bottom = frame.size.height * .5;
//    CGFloat right = frame.size.width * .1;
//    
//    // 设置端盖的值
//    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
//    // 设置拉伸的模式
//    UIImageResizingMode mode = UIImageResizingModeTile;
//    
//    // 拉伸图片
//    UIImage *newImage = [[UIImage imageNamed:@"BUTTON"] resizableImageWithCapInsets:edgeInsets resizingMode:mode];
//    
//    logoImage.image = newImage;
    
  
    return logoImage;
}

+ (NSMutableDictionary *) entityToDictionary:(id)entity
{
    
    Class clazz = [entity class];
    u_int count;
    
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    NSMutableArray* valueArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++)
    {
        objc_property_t prop=properties[i];
        const char* propertyName = property_getName(prop);
        
        [propertyArray addObject:[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
        
        //        const char* attributeName = property_getAttributes(prop);
        //        NSLog(@"%@",[NSString stringWithUTF8String:propertyName]);
        //        NSLog(@"%@",[NSString stringWithUTF8String:attributeName]);
        
        id value =  [entity performSelector:NSSelectorFromString([NSString stringWithUTF8String:propertyName])];
        if(value ==nil)
            [valueArray addObject:[NSNull null]];
        else {
            [valueArray addObject:value];
        }
        //        NSLog(@"%@",value);
    }
    
    free(properties);
    
    NSMutableDictionary* returnDic = [NSMutableDictionary dictionaryWithObjects:valueArray forKeys:propertyArray];
    NSLog(@"%@", returnDic);
    
    return returnDic;
}
#pragma mark---时间戳
+(NSString*)getCurrentTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
//    
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    
//    [formatter setTimeZone:timeZone];
//    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue]];
    
    return timeSp;
   
}
+ (NSString *)setUpWithTime:(NSString *)time foementData:(NSString *)fomentData{
    NSString *latestMessageTime = @"";
    
    if ([Toos isNotBlank:time] && ![time isEqualToString:@"0"]) {
    
    
    double timeInterval = [time doubleValue] ;
    
    
    if(timeInterval > 140000000000) {
        timeInterval = timeInterval / 1000;
    }
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:fomentData];
    latestMessageTime = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
    
   
    }
     return latestMessageTime;
   
    
}
#pragma mark - 将某个时间转化成 时间戳

+(NSString *)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    return [NSString stringWithFormat:@"%ld",timeSp];
}
+ (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        
        return (UIImageView *)view;
        
    }
    
    
    
    
    
    for (UIView *subview in view.subviews) {
        
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        
        if (imageView) {
            
            return imageView;
            
        }
        
    }
    
    return nil;
    
}

+ (MJRefreshHeader *)RefreshHeader:(downRefresh)down {
    
    MJRefreshHeader *header = [MJRefreshHeader headerWithRefreshingBlock:^{
        down;
    }];
    
    return header;
}

+ (MJRefreshAutoFooter *)RefreshFooter:(UpRefresh)Up {
    MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        Up;
    }];
  
    footer.automaticallyRefresh = NO;
    return footer;
}
+(NSArray *)splitArray: (NSArray *)array withSubSize : (int)subSize{
    //  数组将被拆分成指定长度数组的个数
    unsigned long count = array.count % subSize == 0 ? (array.count / subSize) : (array.count / subSize + 1);
    //  用来保存指定长度数组的可变数组对象
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    //利用总个数进行循环，将指定长度的元素加入数组
    for (int i = 0; i < count; i ++) {
        //数组下标
        int index = i * subSize;
        //保存拆分的固定长度的数组元素的可变数组
        NSMutableArray *arr1 = [[NSMutableArray alloc] init];
        //移除子数组的所有元素
        [arr1 removeAllObjects];
        
        int j = index;
        //将数组下标乘以1、2、3，得到拆分时数组的最大下标值，但最大不能超过数组的总大小
        while (j < subSize*(i + 1) && j < array.count) {
            [arr1 addObject:[array objectAtIndex:j]];
            j += 1;
        }
        //将子数组添加到保存子数组的数组中
        [arr addObject:[arr1 copy]];
    }
    
    return [arr copy];
}
+ (UIView *)smallView:(CGRect)imageFrame labelFrame:(CGRect)labelFrame bigFrame:(CGRect)bigFrame type:(NSInteger)type labelText:(NSString *)text image:(NSString *)image font:(CGFloat)font textColor:(UIColor *)textColor{
    UIView *bigView = [[UIView alloc]initWithFrame:bigFrame];
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:image]];
    image1.frame = imageFrame;
    UILabel *label = [Toos setUpWithUserLabel:text CGRect:labelFrame color:[UIColor clearColor] textColor:textColor textSize:font];
    label.userInteractionEnabled = NO;
    image1.contentMode = UIViewContentModeScaleAspectFill;
    if (type == 1) {
        label.textAlignment = NSTextAlignmentLeft;
    } else if(type == 2){
        label.textAlignment = NSTextAlignmentCenter;
    }else {
        label.textAlignment = NSTextAlignmentRight;
    }
    [bigView addSubview:image1];
    [bigView addSubview:label];
    return bigView;
}

//顶部试图
+(UIView *)setBigView:(CGFloat)height origin:(CGFloat)y{
    UIView *alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, y, kScreenWidth, height)];
    alphaView.backgroundColor = newColor(239, 239, 239, 1);
    return alphaView;
}


#pragma mark---检测是否登录
+(BOOL)isLogin:(UIView *)myView {
    BOOL islogin;
    
    if ([Toos isBlank:[UserModel shared].uid]) {
        islogin = NO;
        [Toos setUpWithMBP:@"尚未登录，请前往登录" UIView:myView];
    }else {
        islogin = YES;
    }
    return islogin;
}



#pragma mark----加载动画
+ (void)JiaZaiAnimation:(NSString *)string myView:(UIView *)myView  block:(Animation)block{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:myView];
    [myView addSubview:HUD];
    
    
    //如果设置此属性则当前的view置于后台
    HUD.dimBackground = YES;
    
    //设置对话框文字
    HUD.labelText = string;
    
    //显示对话框
    [HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
        sleep(1);
    } completionBlock:^{
        
        
        block(@"1");
        
    }];
    
    
    
}
#pragma mark---汉语转阿拉伯数字
+(NSString *)translationArebicStr:(NSString *)chineseStr {
     NSString *str = chineseStr;
    NSArray *arabic_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"日",@"八",@"九",@"零", @"十"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:arabic_numerals forKeys:chinese_numerals];
    
    NSMutableArray *sums = [NSMutableArray array];
    
    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *sum = substr;
        if([chinese_numerals containsObject:substr]){
            
            if([substr isEqualToString:@"十"] && i < str.length){
                NSString *nextStr = [str substringWithRange:NSMakeRange(i+1, 1)];
                if([chinese_numerals containsObject:nextStr]){
                    continue;
                }
            }
            sum = [dictionary objectForKey:substr];
        }
        
        [sums addObject:sum];
    }
    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    return sumStr;
}


/**
 判断空字符串
 */
+ (BOOL)isBlankString:(NSString *)string
{
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if (!string.length) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    
    return NO;
}

+ (NSString *)convertTimeStampToDate:(NSString *)timeInterval
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    // 毫秒值转化为秒
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSString *)convertTimeStampToTime:(NSString *)timeInterval
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH:mm"];
    
    // 毫秒值转化为秒
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/** 根据label或button的文字取得宽高
 * param string label或是button的文字
 * param font 要求的字体大小
 * param maxWidth 要求的最大宽度
 * param height 要求的最大高度
 */
+ (CGSize)getSizeWithString:(NSString *)string font:(UIFont *)font maxWidth:(CGFloat)maxWidth height:(CGFloat)height
{
    if ([self isBlankString:string]) {
        return CGSizeMake(60, 30);
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    CGRect newRect = [attributeString boundingRectWithSize:CGSizeMake(maxWidth, height) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return newRect.size;
}

+ (UIImage *) createImageWithColor:(UIColor *) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
#pragma mark---带间距的字符串
+(NSAttributedString *)setLabelSpacewithValue:(NSString*)str withFont:(UIFont*)font jianju:(float)jianju suojin:(float)suojin{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
    
    paraStyle.lineSpacing = jianju; //设置行间距
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = suojin;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    //设置字间距 NSKernAttributeName:@1.5f
    
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.5f
                          };
    
    
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    
    return attributeStr;
    
}




+(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width jianju:(float)jianju suojin:(float)suojin{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
    
    paraStyle.lineSpacing = jianju;
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = suojin;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
    
}
+ (double)distanceBetweenCoordinates:(CLLocation * )from and:(CLLocation *)to {
    
    double latitudeArc  = (from.coordinate.latitude - to.coordinate.latitude) * AMAPLOC_DEG_TO_RAD;
    double longitudeArc = (from.coordinate.longitude - to.coordinate.longitude) * AMAPLOC_DEG_TO_RAD;
    
    double latitudeH = sin(latitudeArc * 0.5);
    latitudeH *= latitudeH;
    double lontitudeH = sin(longitudeArc * 0.5);
    lontitudeH *= lontitudeH;
    
    double tmp = cos(from.coordinate.latitude*AMAPLOC_DEG_TO_RAD) * cos(to.coordinate.latitude*AMAPLOC_DEG_TO_RAD);
    return AMAPLOC_EARTH_RADIUS * 2.0 * asin(sqrt(latitudeH + tmp*lontitudeH));
}
#pragma mark - 距离
+(double )LantitudeLongitudeDistance:(double )other_lon other_Lat:(double )other_lat self_Lon:(double )self_lon self_Lat:(double )self_lat{
//    double er = 6378137; // 6378700.0f;
//    double radlat1 = PI*other_lat/180.0f;
//    double radlat2 = PI*self_lat/180.0f;
//    //now long.
//    double radlong1 = PI*other_lon/180.0f;
//    double radlong2 = PI*self_lat/180.0f;
    
    double EARTH_RADIUS = 6378137;//地球半径  人类规定(单位：m)
    double radLat1 = other_lat;
    double radLat2 = self_lat;
    double radLng1 = other_lon;
    double radLng2 = self_lat;
    
    double a = radLat1 - radLat2;
    double b = radLng1 - radLng2;
    
    double s = 2 * asin(sqrt(pow(sin(a/2),2) + cos(radLat1)*cos(radLat2)*pow(sin(b/2),2)));//google maps里面实现的算法
    s = s * EARTH_RADIUS;
    
    return s;
//    if( radlat1 < 0 ) radlat1 = PI/2 + fabs(radlat1);// south
//    if( radlat1 > 0 ) radlat1 = PI/2 - fabs(radlat1);// north
//    if( radlong1 < 0 ) radlong1 = PI*2 - fabs(radlong1);//west
//    if( radlat2 < 0 ) radlat2 = PI/2 + fabs(radlat2);// south
//    if( radlat2 > 0 ) radlat2 = PI/2 - fabs(radlat2);// north
//    if( radlong2 < 0 ) radlong2 = PI*2 - fabs(radlong2);// west
//    //spherical coordinates x=r*cos(ag)sin(at), y=r*sin(ag)*sin(at), z=r*cos(at)
//    //zero ag is up so reverse lat
//    double x1 = er * cos(radlong1) * sin(radlat1);
//    double y1 = er * sin(radlong1) * sin(radlat1);
//    double z1 = er * cos(radlat1);
//    double x2 = er * cos(radlong2) * sin(radlat2);
//    double y2 = er * sin(radlong2) * sin(radlat2);
//    double z2 = er * cos(radlat2);
//    double d = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)+(z1-z2)*(z1-z2));
//    //side, side, side, law of cosines and arccos
//    double theta = acos((er*er+er*er-d*d)/(2*er*er));
//    double dist  = theta*er;
//    return dist;
}

//-(double)getDistanceLat1:(double)lat1 whitLng1:(double)lng1  whitLat2:(double)lat2  whitLng2:(double)lng2{
//    double EARTH_RADIUS = 6378137;//地球半径  人类规定(单位：m)
//    double radLat1 = [self red:lat1];
//    double radLat2 = [self red:lat2];
//    double radLng1 = [self red:lng1];
//    double radLng2 = [self red:lng2];
//
//    double a = radLat1 - radLat2;
//    double b = radLng1 - radLng2;
//
//    double s = 2 * asin(sqrt(pow(sin(a/2),2) + cos(radLat1)*cos(radLat2)*pow(sin(b/2),2)));//google maps里面实现的算法
//    s = s * EARTH_RADIUS;
//
//    return s;
//
//}


@end
