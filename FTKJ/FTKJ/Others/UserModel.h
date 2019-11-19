//
//  UserModel.h
//  TTZS
//
//  Created by ios on 2018/4/12.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic, strong) NSString *token;

@property (nonatomic, assign) long getTokenServerTime;

@property (nonatomic, strong) NSString *uid;

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *icon;

@property (nonatomic, strong) NSString *sty_id;

@property (nonatomic, strong) NSString *sex;

@property (nonatomic, strong) NSString *nickname;

@property (nonatomic, strong) NSString *fullname;

@property (nonatomic, strong) NSString *reg_type;

@property (nonatomic, strong) NSString *mobile;

@property(nonatomic,retain)NSString *passWord;

@property (nonatomic, strong) NSString *litpic;

@property(nonatomic,retain)NSString *balance;

@property (nonatomic, strong) NSString *ZFPassWord;

@property (nonatomic, strong) NSString *GYWMStr;

@property (nonatomic, strong) NSString *email;

@property (nonatomic, strong) NSString *kfPhone;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *id_card;
@property (nonatomic, strong) NSString *style;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *work_limit;

/**
 userinfo单利
 
 @return user
 */
+ (UserModel *)shared;

/**
 保存本地
 */
- (void)saveUser;


/**
 删除用户信息
 */
- (void)deleteUser;


/**
 获取用户信息
 */
- (void)getUserInfoData;

@end
