//
//  AddAddressView.h
//  GZSC
//
//  Created by ios on 2018/9/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAddressView : UIView

@property(nonatomic,copy)void (^ClickAddress)(NSDictionary *newDic);

@property(nonatomic,retain)NSString *isFrom;
@property(nonatomic,retain)NSString *type;

-(void)setUpWithAnimaTion:(NSString *)isFrom;


@property(nonatomic,copy)void(^ClickSheng)(NSDictionary *oneDic,NSDictionary *twoDic,NSDictionary *threeDic);



@end
