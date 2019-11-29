//
//  DataBaseManager.h
//  ZZLM
//
//  Created by ios on 2017/6/26.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>



@class DataBaseManager;

#ifdef __cplusplus
extern "C" {
#endif
    DataBaseManager *DatabaseInstance(void);
#ifdef __cplusplus
}
#endif

@interface DataBaseManager : NSObject



+ (DataBaseManager *)sharedFMDBManager;

+ (NSString *)documentsPath;

@property(nonatomic, assign) BOOL isDelete;

@property(nonatomic, retain) NSDictionary *QuDic;

@property(nonatomic, assign) NSInteger count;

@property(nonatomic, strong) NSString *typeStr;

@property(nonatomic, strong) NSString *YuDingType;

@property(nonatomic,retain)NSMutableDictionary *bigDic;

@property(nonatomic,assign)NSInteger selectNumber;


@property(nonatomic,retain)NSString *order_str;


@end
