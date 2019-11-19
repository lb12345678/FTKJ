//
//  DataBaseManager.m
//  ZZLM
//
//  Created by ios on 2017/6/26.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "DataBaseManager.h"

#import "FMDatabase.h"

#import "Toos.h"


static DataBaseManager *DatabaseSingleton = nil;
static dispatch_queue_t databaseDispatchQueue = nil;
static const char *databaseQueueSpecific = "com.BGLT.databasequeue";

@interface DataBaseManager ()
{
    NSString *_usersTable;
}

@property (nonatomic, strong) FMDatabase *database;
@property (nonatomic, copy) NSString *databasePath;

@end

@implementation DataBaseManager

+ (NSString *)documentsPath
{
    static NSString *path = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if ([[[UIDevice currentDevice] systemVersion] intValue] >= 8)
        {
            NSString *groupName = [@"group." stringByAppendingString:[[NSBundle mainBundle] bundleIdentifier]];
            
            NSURL *groupURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:groupName];
            if (groupURL != nil)
            {
                NSString *documentsPath = [[groupURL path] stringByAppendingPathComponent:@"Documents"];
                
                [[NSFileManager defaultManager] createDirectoryAtPath:documentsPath withIntermediateDirectories:true attributes:nil error:NULL];
                
                path = documentsPath;
            }
            else
                path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
        }
        else
            path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
        
    });
    
    return path;
}

DataBaseManager *DatabaseInstance()
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DatabaseSingleton = [[DataBaseManager alloc] init];
    });
    
    return DatabaseSingleton;
}

+ (DataBaseManager *)sharedFMDBManager
{
    return DatabaseInstance();
}

- (bool)isCurrentQueueDatabaseQueue
{
    return dispatch_get_specific(databaseQueueSpecific) != NULL;
}

- (void)dispatchOnDatabaseThread:(dispatch_block_t)block synchronous:(bool)synchronous
{
    if ([self isCurrentQueueDatabaseQueue])
    {
        @autoreleasepool
        {
#ifdef DEBUG
            CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
#endif
            block();
#ifdef DEBUG
            CFAbsoluteTime executionTime = (CFAbsoluteTimeGetCurrent() - startTime);
            if (executionTime > 0.3)
                NSLog(@"***** DB Dispatch took %f s", executionTime);
#endif
        }
    }
    else
    {
        if (synchronous)
        {
            dispatch_sync([self databaseQueue], ^
                          {
                              @autoreleasepool
                              {
#ifdef DEBUG
                                  CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
#endif
                                  block();
#ifdef DEBUG
                                  CFAbsoluteTime executionTime = (CFAbsoluteTimeGetCurrent() - startTime);
                                  if (executionTime > 0.3)
                                      NSLog(@"***** DB Dispatch took %f s", executionTime);
#endif
                              }
                          });
        }
        else
        {
            dispatch_async([self databaseQueue], ^
                           {
                               @autoreleasepool
                               {
#ifdef DEBUG
                                   CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
#endif
                                   block();
#ifdef DEBUG
                                   CFAbsoluteTime executionTime = (CFAbsoluteTimeGetCurrent() - startTime);
                                   if (executionTime > 0.3)
                                       NSLog(@"***** DB Dispatch took %f s", executionTime);
#endif
                               }
                           });
        }
    }
}

- (dispatch_queue_t)databaseQueue
{
    if (databaseDispatchQueue == NULL)
    {
        databaseDispatchQueue = dispatch_queue_create("com.actionstage.databasequeue", 0);
        
        dispatch_queue_set_specific(databaseDispatchQueue, databaseQueueSpecific, (void *)databaseQueueSpecific, NULL);
    }
    return databaseDispatchQueue;
}

- (instancetype)init
{
    if (self = [super init])
    {
        [self creatTableIfNeed];
    }
    return self;
}

- (void)closeDatabase
{
    __weak typeof(self)weakSelf = self;
    [self dispatchOnDatabaseThread:^{
         [weakSelf.database close];
    } synchronous:true];
}

- (void)creatTableIfNeed
{
    
    _usersTable = [NSString stringWithFormat:@"users"];
    
    // 创建数据库
    // 1、找到数据库存储路径
    _databasePath = [[DataBaseManager documentsPath] stringByAppendingPathComponent:@"BGLTData.db"];
    
    // 2、使用路径初始化FMDB对象
    _database = [FMDatabase databaseWithPath:_databasePath];
    
    // 3、判断数据库是否打开，打开时才执行sql语句
    if ([_database open])
    {
        // 1.user 表
        NSString *createUsersTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (uid INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT, sex TEXT, create_time TEXT, update_time TEXT, data BLOB)", _usersTable];
        
        if (![_database executeUpdate:createUsersTable]) NSLog(@"creat tables is fail: %@", _usersTable);
    }
    
}



@end
