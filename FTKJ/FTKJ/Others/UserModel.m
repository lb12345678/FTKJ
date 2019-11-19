//
//  UserModel.m
//  TTZS
//
//  Created by ios on 2018/4/12.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self getUserInfoData];
    }
    return self;
}

+ (UserModel *)shared{
    static UserModel *user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[UserModel alloc]init];
    });
    return user;
}

- (void)saveUser{
    NSUserDefaults *defultsUser = [NSUserDefaults standardUserDefaults];
    [defultsUser setValue:self.token forKey:@"userToken"];
    [defultsUser setValue:@(self.getTokenServerTime) forKey:@"getSEerverTime"];
    [defultsUser setValue:self.uid forKey:@"uid"];
    [defultsUser setValue:self.type forKey:@"type"];
    [defultsUser setValue:self.icon forKey:@"icon"];
    [defultsUser setValue:self.nickname forKey:@"nickname"];
    [defultsUser setValue:self.mobile forKey:@"mobile"];
    [defultsUser setValue:self.fullname forKey:@"fullname"];
    [defultsUser setValue:self.reg_type forKey:@"reg_type"];
      [defultsUser setValue:self.passWord forKey:@"password"];
      [defultsUser setValue:self.balance forKey:@"balance"];
    [defultsUser setValue:self.ZFPassWord forKey:@"ZFPassWord"];
    [defultsUser setValue:self.sex forKey:@"sex"];

      [defultsUser setValue:self.ZFPassWord forKey:@"GYWMStr"];
    
     [defultsUser setValue:self.email forKey:@"email"];
    [defultsUser setValue:self.kfPhone forKey:@"kfPhone"];
    [defultsUser setValue:self.lon forKey:@"lon"];
    [defultsUser setValue:self.lat forKey:@"lat"];
    [defultsUser setValue:self.id_card forKey:@"id_card"];
    [defultsUser setValue:self.style forKey:@"style"];
    [defultsUser setValue:self.city forKey:@"city"];
    [defultsUser setValue:self.work_limit forKey:@"work_limit"];
    [defultsUser setValue:self.company forKey:@"company"];
    [defultsUser setValue:self.sty_id forKey:@"sty_id"];
    [defultsUser synchronize];
}
//@property (nonatomic, strong) NSString *company;
//@property (nonatomic, strong) NSString *work_limit;

- (void)getUserInfoData{
    NSUserDefaults *defultsUser = [NSUserDefaults standardUserDefaults];
    self.token = [defultsUser objectForKey:@"userToken"];
    self.getTokenServerTime = [[defultsUser objectForKey:@"getSEerverTime"] longValue];
    self.uid = [defultsUser objectForKey:@"uid"];
    self.type = [defultsUser objectForKey:@"type"];
    self.icon = [defultsUser objectForKey:@"icon"];
    self.nickname = [defultsUser objectForKey:@"nickname"];
    self.mobile = [defultsUser objectForKey:@"mobile"];
    self.fullname = [defultsUser objectForKey:@"fullname"];
    self.reg_type = [defultsUser objectForKey:@"reg_type"];
     self.passWord = [defultsUser objectForKey:@"password"];
    self.balance = [defultsUser objectForKey:@"balance"];
    self.sex = [defultsUser objectForKey:@"sex"];

      self.ZFPassWord = [defultsUser objectForKey:@"ZFPassWord"];
    self.GYWMStr = [defultsUser objectForKey:@"GYWMStr"];
    self.email = [defultsUser objectForKey:@"email"];
     self.kfPhone = [defultsUser objectForKey:@"kfPhone"];
    self.lon = [defultsUser objectForKey:@"lon"];
    self.lat = [defultsUser objectForKey:@"lat"];
    self.id_card = [defultsUser objectForKey:@"id_card"];
    self.style = [defultsUser objectForKey:@"style"];
    self.city = [defultsUser objectForKey:@"city"];
    self.company = [defultsUser objectForKey:@"company"];
    self.work_limit = [defultsUser objectForKey:@"work_limit"];
    self.sty_id = [defultsUser objectForKey:@"sty_id"];

}

- (void)deleteUser{
    NSUserDefaults *defultsUser = [NSUserDefaults standardUserDefaults];
    [defultsUser removeObjectForKey:@"uid"];
    [defultsUser removeObjectForKey:@"type"];
    [defultsUser removeObjectForKey:@"icon"];
    [defultsUser removeObjectForKey:@"nickname"];
    [defultsUser removeObjectForKey:@"mobile"];
    [defultsUser removeObjectForKey:@"fullname"];
    [defultsUser removeObjectForKey:@"reg_type"];
     [defultsUser removeObjectForKey:@"password"];
      [defultsUser removeObjectForKey:@"balance"];
      [defultsUser removeObjectForKey:@"ZFPassWord"];
     [defultsUser removeObjectForKey:@"GYWMStr"];
    [defultsUser removeObjectForKey:@"email"];
    [defultsUser removeObjectForKey:@"kfPhone"];
    [defultsUser removeObjectForKey:@"lon"];
    [defultsUser removeObjectForKey:@"lat"];
    [defultsUser removeObjectForKey:@"style"];
    [defultsUser removeObjectForKey:@"id_card"];
    [defultsUser removeObjectForKey:@"city"];
    [defultsUser removeObjectForKey:@"company"];
    [defultsUser removeObjectForKey:@"work_limit"];
    [defultsUser removeObjectForKey:@"sex"];
    [defultsUser removeObjectForKey:@"userToken"];
    [defultsUser removeObjectForKey:@"sty_id"];
    self.sty_id = @"";

    self.sex = @"";
    self.token = @"";
    self.id_card = @"";
    self.city = @"";
    self.company = @"";

    self.uid = @"";
    self.type = @"";
    self.icon = @"";
    self.nickname = @"";
    self.mobile = @"";
    self.fullname = @"";
    self.reg_type = @"";
     self.balance = @"";
     self.ZFPassWord = @"";
     self.GYWMStr = @"";
    self.email = @"";
    self.kfPhone = @"";
    self.lon = @"";
    self.style = @"";
    self.work_limit = @"";
}


@end
