//
//  CKWLViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/22.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "CKWLViewController.h"
#import "TJViewCell.h"
#import "CKWLView.h"
@interface CKWLViewController ()

@end

@implementation CKWLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"查看物流";
    // Do any additional setup after loading the view.
}
-(void)setUpWithBigView {
self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH - kTopHeight  ) style:UITableViewStylePlain];

self.tableView.delegate = self;
self.tableView.dataSource = self;
//    [self.tableView registerClass:[PLViewCell class] forCellReuseIdentifier:@"plCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"oneCell"];
[self.tableView registerClass:[CKWLView class] forHeaderFooterViewReuseIdentifier:@"oneHeader"];

[self.tableView registerClass:[TJViewCell class] forCellReuseIdentifier:@"TJCell"];
//    [self.tableView registerClass:[TJViewCell class] forCellReuseIdentifier:@"threeCell"];
self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
[self.view addSubview:self.tableView];


//    MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
//        [self setUpWithData:self.page++];;
//    }];
//    self.tableView.mj_footer = footer;
//    footer.automaticallyRefresh = NO;
//

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
  
    
    return 1;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"oneCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    }
  
            TJViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TJCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSeparatorStyleNone;
            
            //            if ([Toos isNotBlank:self.tempDic]) {
            //                [cell setUpWithBigArray:self.tempDic[@"tj_product"]];
            //            }
            
            cell.backgroundColor = newColor(245, 244, 249, 1);
            __weak typeof(self)weakSelf = self;
            cell.ClickBlock = ^(NSString * _Nonnull str) {
                //                [DataBaseManager sharedFMDBManager].SPStr = @"";
                //                weakSelf.typeID = str;
                //
                //                [weakSelf setUpWithData:1];
                tableView.contentOffset = CGPointMake(0, 0);
            };
            return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 0;
    }
  
        
    
    return kScreenWidth ;
    

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [CKWLView setUpWithHeightWithBigDic:@{}];
    }
    return kWidthChange(60);
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        CKWLView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"oneHeader"];
        
        //        if ([Toos isNotBlank:self.tempDic]) {
        
        [view setUpWithNewBigDic:@{}];
        //        }
       
        
        return view;
    }
   
        
    
            UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , kWidthChange(60))];
            bigView.backgroundColor = newColor(245, 244, 249, 1);
            
            
            
            
            UILabel *twoLabel = [Toos setUpWithUserLabel:@"推荐商品" CGRect:CGRectMake(kWidthChange(20), 0, kScreenWidth - kWidthChange(30), kWidthChange(60)) color:[UIColor clearColor] textColor:newColor(64, 73, 85, 1) textSize:kWidthChange(18)];
            [bigView addSubview:twoLabel];
            
            
            return bigView;
    
    
    
    
    
    
    
}

#pragma mark---fenxaing
-(void)clickSearch:(UIButton *)sender {
    
    
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
