//
//  AppDelegate.m
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import <Reachability.h>

#import "SSKeychain.h"
#import "LoginViewController.h"

static NSString *kKeychainService = @"WT.FTKJ";
static NSString *kKeychainDeviceId    = @"KeychainDeviceId";
@interface AppDelegate ()
@property (nonatomic,strong)Reachability * reachability;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [NSThread sleepForTimeInterval:3];
    [UserModel shared].uid = @"1";
    [[UserModel shared]saveUser];
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:kWidthChange(18)],
       NSForegroundColorAttributeName:newColor(255, 255, 255, 1)}];
    [[NSUserDefaults standardUserDefaults] setObject:@"one" forKey:@"first"];
    NSString *udid = [[NSString stringWithFormat:@"%@",[self getDeviceId]] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    NSSet *array =[NSSet setWithObjects:[NSString stringWithFormat:@"%@",udid], nil];
    
    
    self.reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    //开启监测
    [self.reachability startNotifier];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeInternet:) name:kReachabilityChangedNotification object:nil];
    UITableView.appearance.estimatedRowHeight = 0;
    UITableView.appearance.estimatedSectionFooterHeight = 0;
    UITableView.appearance.estimatedSectionHeaderHeight = 0;
    
    if ([Toos isBlank:[UserModel shared].uid]) {
            LoginViewController *login = [[LoginViewController alloc]init];
            ZFNavigationController *ZFNavi = [[ZFNavigationController alloc]initWithRootViewController:login];
            self.window.rootViewController = ZFNavi;
        }
        else {
    TabBarController *tabBar = [[TabBarController alloc]init];
    self.window.rootViewController = tabBar;
        }
//    [self SetUpWithShareSdk];
    //[self shareAppVersionAlert];
    
      [UITabBar appearance].translucent = NO;
    
    return YES;
}
- (NSString *)getDeviceId {
    // 读取设备号
    NSString *localDeviceId = [SSKeychain passwordForService:kKeychainService account:kKeychainDeviceId];
    if (!localDeviceId) {
        // 保存设备号
        CFUUIDRef deviceId = CFUUIDCreate(NULL);
        assert(deviceId != NULL);
        CFStringRef deviceIdStr = CFUUIDCreateString(NULL, deviceId);
        [SSKeychain setPassword:[NSString stringWithFormat:@"%@", deviceIdStr] forService:kKeychainService account:kKeychainDeviceId];
        localDeviceId = [NSString stringWithFormat:@"%@", deviceIdStr];
        
    }
    NSLog(@"uuidStr------》%@",localDeviceId);
    
    
    
    return localDeviceId;
}
//当网络发生变化时,监测网络状态
- (void)changeInternet:(NSNotification *)notification
{
    NetworkStatus status = [self.reachability currentReachabilityStatus];
    switch (status) {
        case NotReachable:
            [Toos setUpWithMBP:@"网络连接失败，请检查您的网络连接" UIView:self.window];
            break;
        case ReachableViaWiFi:
            NSLog(@"1");
            
//            [self setUpWithToken];
            
            
            break;
        case ReachableViaWWAN:
            NSLog(@"2");
            
//            [self setUpWithToken];
            
            break;
        default:
            break;
    }
    
}
- (void)dealloc
{
    
    [self.reachability stopNotifier];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    
    
    
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"supportedInterfaceOrientationsForWindow"];
    NSLog(@"supportedInterfaceOrientationsForWindow:%@",str);
    
    
    NSInteger soTime;
    
    
    
    if([[[NSUserDefaults standardUserDefaults] objectForKey:@"first"]isEqualToString:@"one"])
    {
        
        
        //如果是第一次启动的话,使用UserGuideViewController (用户引导页面) 作为根视图
        soTime = 0;
        
    }
    else
    {
        
        //如果不是第一次启动的话,使用LoginViewController作为根视图
        
        soTime = [str intValue];
    }
    
    
    if (soTime == 0)
    {
        return UIInterfaceOrientationMaskPortrait;
    }else
    {
        return UIInterfaceOrientationMaskLandscapeRight;
    }
    
}
- (void)shareAppVersionAlert
{
    
    //App内info.plist文件里面版本号
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = infoDict[@"CFBundleShortVersionString"];
    NSString *bundleId   = infoDict[@"CFBundleIdentifier"];
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?id=%@", @"1473550155"];
    
    
    
    //两种请求appStore最新版本app信息 通过bundleId与appleId判断
    //[NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?bundleid=%@", bundleId]
    //[NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?id=%@", appleid]
    NSURL *urlStr = [NSURL URLWithString:urlString];
    //创建请求体
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:urlStr];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        
        if (connectionError) {
            //            NSLog(@"connectionError->%@", connectionError.localizedDescription);
            return ;
        }
        NSError *error;
        NSDictionary *resultsDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        
        if (error) {
            //            NSLog(@"error->%@", error.localizedDescription);
            return;
        }
        NSArray *sourceArray = resultsDict[@"results"];
        
        
        
        if (sourceArray.count > 0) {
            //AppStore内最新App的版本号
            NSDictionary *sourceDict = sourceArray[0];
            NSString *newVersion = sourceDict[@"version"];
            
            if ([self judgeNewVersion:newVersion withOldVersion:appVersion])
            {
                UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示:\n您的App不是最新版本，请问是否更新" message:@"" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"暂不更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //                    [alertVc dismissViewControllerAnimated:YES completion:nil];
                }];
                [alertVc addAction:action1];
                UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"去更新" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                    //跳转到AppStore，该App下载界面
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:sourceDict[@"trackViewUrl"]]];
                }];
                [alertVc addAction:action2];
                [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertVc animated:YES completion:nil];
            }
        }
    }];
}
//判断当前app版本和AppStore最新app版本大小
- (BOOL)judgeNewVersion:(NSString *)newVersion withOldVersion:(NSString *)oldVersion
{
    NSArray *newArray = [newVersion componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
    NSArray *oldArray = [oldVersion componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
    
    
    //    for (NSInteger i = 0; i < newArray.count; i ++) {
    if ([[newVersion stringByReplacingOccurrencesOfString:@"." withString:@""]intValue] > [[oldVersion stringByReplacingOccurrencesOfString:@"." withString:@""]intValue]) {
        return YES;
        //        }
    }
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"FTKJ"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
