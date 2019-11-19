//
//  PGGPublicClass.m
//  PetPlanet
//
//  Created by 王钶 on 14/11/11.
//  Copyright (c) 2014年 com.xw.cwxq. All rights reserved.
//

#import "PGGPublicClass.h"
#define ARIAL @"Arial"///项目主体字

#define MAINCOLOR [UIColor colorWithRed:255/255.0 green:70/255.0 blue:70/255.0 alpha:1]
#define RGB(R, G, B ,P)    [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:P]

@implementation PGGPublicClass
/*scrollview偏移设置0
 self.edgesForExtendedLayout=UIRectEdgeNone;
 self.extendedLayoutIncludesOpaqueBars=NO;
 self.automaticallyAdjustsScrollViewInsets=NO;
 */
//lb计算文本的宽和高
+(CGSize)countTextSize:(CGSize)size andtextfont:(UIFont *)font andtext:(NSString *)str
{
    CGSize detailsLabSize = size;
    NSDictionary *detailsLabAttribute = @{NSFontAttributeName: font};
    //ios7方法，获取文本需要的size
    CGSize  msize =[str boundingRectWithSize:detailsLabSize options:NSStringDrawingUsesLineFragmentOrigin  attributes:detailsLabAttribute context:nil].size;
    return msize;
}

//去掉cell中多余的线
+(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    
}

//利用正则表达式验证
+(BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+(BOOL)isphonenumber:(NSString *)phone
{
    NSString *emailRegex = @"[0-9]{11}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:phone];
}
//保存图片
+(void)saveimage:(NSData *)data andpicname:(NSString *)strfile
{
    //保存图片
    NSString *imageDir = [self imagefile];
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:imageDir isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) )
    {
        [fileManager createDirectoryAtPath:imageDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    
    
    NSData *datatemp = data;
    float fc = datatemp.length/50000;
    UIImage *image = [UIImage imageWithData:datatemp];
    float fwidth = image.size.width*pow(0.9, fc);
    float fheight = image.size.height*pow(0.9, fc);
    if(fwidth<image.size.width*0.4)
    {
        fwidth = image.size.width*0.4;
    }
    if(fheight<image.size.height*0.4)
    {
        fheight = image.size.height*0.4;
    }
    
    if (datatemp.length>50000) {
        datatemp = UIImageJPEGRepresentation([PGGPublicClass imgcutsuo:[UIImage imageWithData:datatemp] andsize:CGSizeMake(fwidth , fheight)], 0.8);
    }
    
    BOOL isok =  [datatemp writeToFile:[NSString stringWithFormat:@"%@/%@",imageDir,strfile] atomically:NO];
    if(isok == NO)
    {
        NSLog(@"图片保存出错");
    }
    
    
    //完
}

//图片的路径文件夹
+(NSString *)imagefile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *filePath = [paths objectAtIndex:0];
    NSString *imageDir = [NSString stringWithFormat:@"%@/pengimg", filePath];
    return imageDir;
}
/*
 获得录音文件的绝对路径
 */
+ (NSString *) audioRecordingPath:(NSString *)fileNmaeParams{
    NSString *result = nil;
    // 应用程序沙盒Document路径
    NSArray *folders =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsFolder = [folders objectAtIndex:0];
    NSString *imageDir = [NSString stringWithFormat:@"%@/pengAudio", documentsFolder];
    result = [imageDir stringByAppendingPathComponent:fileNmaeParams];
    BOOL isDir = NO;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:imageDir isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) )
    {
        [fileManager createDirectoryAtPath:imageDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return result;
    
}
///语音保存
+(void)saveAuido:(NSData *)data andname:(NSString *)strfile
{
    //保存图片
    NSString *imageDir = [self audioRecordingPath:strfile];
    BOOL isok =  [data writeToFile:[NSString stringWithFormat:@"%@",imageDir] atomically:NO];
    if(isok == NO)
    {
        NSLog(@"语音保存出错");
    }
}

//自动清理文件
+(void)removeAutometicfile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *filePath = [paths objectAtIndex:0];
    NSString *strfile = [NSString stringWithFormat:@"%@/pengimg",filePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //计算文件得个数
    NSArray *filecoun = [fileManager contentsOfDirectoryAtPath:strfile error:Nil];
    NSLog(@"filecoun  = %lu",(unsigned long)filecoun.count);
    if(filecoun.count > 1)
    {
        for(NSInteger i = 0; i < filecoun.count - 1 ; i ++)
        {
            NSString *strfilepath = [NSString stringWithFormat:@"%@/%@",strfile,filecoun[i]];
            [fileManager removeItemAtPath:strfilepath error:Nil];
        }
    }
    UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"提示" message:@"已清理！" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alter show];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(alterdis:) userInfo:alter repeats:NO];
    
    
}
+(void)alterdis:(NSTimer *)sender
{
    UIAlertView *aler = sender.userInfo;
    [aler dismissWithClickedButtonIndex:0 animated:NO];
}

//对图片进行压缩
+(UIImage *)imgcut:(NSData *)dataimg
{
    UIImage *imgtemp = [[UIImage alloc]initWithData:dataimg];
    NSData *datatemp = UIImageJPEGRepresentation(imgtemp, 0.1);
    
    return [[UIImage alloc]initWithData:datatemp];
    
}

#pragma mark - 根据年月日计算星期
+(NSString *)counxq:(NSString *)year andmouth:(NSString *)mouth andday:(NSString *)day
{
    NSMutableArray *arrdata = [[NSMutableArray alloc]initWithObjects:@"31",@"28",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31", nil];
    if([year intValue]%4 == 0)
    {
        if([year intValue]%100 == 0)
        {
            if([year intValue]%400 == 0)
            {
                arrdata[1] = @"29";
            }
            else
            {
                arrdata[1] = @"28";
            }
            
        }
        else
        {
            arrdata[1] = @"29";
        }
        
    }
    else
    {
        arrdata[1] = @"28";
    }
    
    NSInteger y=0;
    
    for(int i = 0; i < [mouth integerValue]-1;i++)
    {
        y=[arrdata[i] integerValue] +y;
    }
    y=y+[day  integerValue];
    NSInteger x=[year integerValue];
    NSInteger first = x-1+((x-1)/4)-((x-1)/100)+((x-1)/400)+y;
    NSInteger end = first/7;
    NSString *strtishi;
    NSInteger xingqi=first-end*7;
    switch (xingqi) {
        case 0:
            strtishi = @"星期天";
            break;
        case 1:
            strtishi = @"星期一";
            break;
        case 2:
            strtishi = @"星期二";
            break;
        case 3:
            strtishi = @"星期三";
            break;
        case 4:
            strtishi = @"星期四";
            break;
        case 5:
            strtishi = @"星期五";
            break;
        case 6:
            strtishi = @"星期六";
            break;
        default:
            break;
    }
    return strtishi;
}

#pragma mark - 根据年和月  返回当前月的天数
+(int)countday:(NSString *)year andmouth:(NSString *)mouth
{
    NSMutableArray *arrdata = [[NSMutableArray alloc]initWithObjects:@"31",@"28",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31", nil];
    if([year intValue]%4 == 0)
    {
        if([year intValue]%100 == 0)
        {
            if([year intValue]%400 == 0)
            {
                arrdata[1] = @"29";
            }
            else
            {
                arrdata[1] = @"28";
            }
            
        }
        else
        {
            arrdata[1] = @"29";
        }
        
    }
    else
    {
        arrdata[1] = @"28";
    }
    return [arrdata[[mouth intValue]-1] intValue];
}


+(NSString *)chuochangetime:(NSString *)str
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[str intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}
////strtype:yyyy-MM-dd HH:mm:ss
+(NSString *)timechangechuo:(NSString *)str andtype:(NSString *)strtype
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:strtype];
    NSDate *date = [formatter dateFromString:str];
    NSTimeInterval a=[date timeIntervalSince1970]; // *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a]; //转为字符型
    
    return timeString;
}

////yyyy-MM-dd HH:mm:ss
+(NSString *)chuochangetime:(NSString *)str andtype:(NSString *)strtype
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:strtype];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[str intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
    
}

///获取当前时间 yyyy-MM-dd HH:mm:ss
+(NSString *)getnowdata:(NSString *)strtype bigType:(NSString *)type
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:strtype];
    
    NSDate *data = [NSDate dateWithTimeIntervalSinceNow:7200];
    
    
    
    NSString *str = [formatter stringFromDate:data];
    
    
    return str;
}

///判断文字是否全为空格
+(NSString *)judgekongge:(NSString *)str
{
    NSArray *arrtmep = [str componentsSeparatedByString:@" "];
    BOOL isnil = YES;
    for(NSString *strtemp in arrtmep)
    {
        if([strtemp isEqualToString:@""])
        {
            
        }
        else
        {
            isnil = NO;
            break;
        }
    }
    if(isnil == YES)
    {
        str = @"";
    }
    return str;
}

///单个文件的大小
+ (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
///遍历文件夹获得文件夹大小，返回多少M
+ (float ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}

+ (void) altetshow:(NSString *)strcontent
{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:strcontent delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];
    
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(alterdis:) userInfo:alter repeats:NO];
    
}


//打电话
+(void)telPhone:(NSString *)strnumber
{
    
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel://%@",strnumber];///telprompt
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

///设置uitableview分割线左顶点绘制
+(void)settabviewcellLine:(UITableView *)tabview
{
    if ([tabview respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [tabview setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([tabview respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [tabview setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
}

///tableview滚动到最后
+(void)backtoButton:(UITableView *)tableview
{
    //tableview滚动到最后
    NSUInteger sectioncount = [tableview numberOfSections];
    if(sectioncount){
        NSUInteger rowcount = [tableview numberOfRowsInSection:0];
        if(rowcount){
            NSUInteger ii[2]={0,rowcount-1};
            NSIndexPath *inderxpath=[NSIndexPath indexPathWithIndexes:ii length:2];
            
            [UIView animateWithDuration:0.5 animations:^{
                [tableview scrollToRowAtIndexPath:inderxpath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
            }];
            
        }
    }
    
}

+ (UIColor *) colorWithHexString: (NSString *)color
{
    @try {
        NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        
        // String should be 6 or 8 characters
        if ([cString length] < 6) {
            return [UIColor clearColor];
        }
        // 判断前缀
        if ([cString hasPrefix:@"0X"])
            cString = [cString substringFromIndex:2];
        if ([cString hasPrefix:@"#"])
            cString = [cString substringFromIndex:1];
        if ([cString length] != 6)
            return [UIColor clearColor];
        // 从六位数值中找到RGB对应的位数并转换
        NSRange range;
        range.location = 0;
        range.length = 2;
        //R、G、B
        NSString *rString = [cString substringWithRange:range];
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        // Scan values
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
    } @catch (NSException *exception) {
        return [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0f];
    } @finally {
        
    }
    
}

///设置一行显示不同字体 颜色
+(NSMutableAttributedString *)arrstring:(NSString *)str andstart:(int)istart andend:(int)length andfont:(float)ff andcolor:(UIColor *)color
{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc]initWithString:str];
    @try {
        [noteStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:ARIAL size:ff] range:NSMakeRange(istart, length)];
        
        [noteStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(istart, length)];
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
    return noteStr;
}

///对图片进行缩
+(UIImage *)imgcutsuo:(UIImage *)image andsize:(CGSize)size
{
    
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/////修改语言
//+(void)changelanguage
//{
//    NSString *lan = [InternationalControl userLanguage];
//
//    if([lan isEqualToString:@"en"]){//判断当前的语言，进行改变
//
//        [InternationalControl setUserlanguage:@"zh-Hans"];
//        
//    }else{
//
//        [InternationalControl setUserlanguage:@"en"];
//    }
//    //改变完成之后发送通知，告诉其他页面修改完成，提示刷新界面
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:nil];
//}

////得到string中英文
//+(NSString *)getStringValue:(NSString *)strkey
//{
//    NSString *str = [[InternationalControl bundle] localizedStringForKey:strkey value:nil table:@"hello"];
//    return str;
//}

@end
