//
//  SPXQOneViewCell.h
//  JZGL
//
//  Created by ios on 2019/8/6.
//  Copyright © 2019年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPXQOneViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView *bigImage;

-(void)setUpWithImage:(NSString *)imageUrl imageArray:(NSMutableArray *)imageArray indexPath:(NSIndexPath *)indexPath heightArray:(NSMutableArray *)heightArray;

@property(nonatomic,retain)NSMutableArray *imageArray;





@end

NS_ASSUME_NONNULL_END
