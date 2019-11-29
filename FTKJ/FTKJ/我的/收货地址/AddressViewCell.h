//
//  AddressViewCell.h
//  KuaiPai
//
//  Created by libo on 2018/6/17.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewCell : UITableViewCell

@property(nonatomic,retain)UIView *bigView;





@property(nonatomic,retain)UIImageView *lineImage;

@property(nonatomic,retain)UILabel *nameLabel;

@property(nonatomic,retain)UILabel *phoneLabel;

@property(nonatomic,retain)UILabel *addressLabel;

@property(nonatomic,retain)UILabel *lineLabel;



@property(nonatomic,retain)UIButton *editBT;

@property(nonatomic,retain)UIButton *deleteBT;

- (void)setUpWithNewName:(NSDictionary *)name;

@end
