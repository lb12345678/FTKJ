//
//  MyLoveViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/26.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "MyLoveViewController.h"
#import "HomeThreeViewCell.h"

@interface MyLoveViewController ()



@end

@implementation MyLoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的收藏";
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}
-(void)setUpWithBigView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH - kTopHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
  
    [self.tableView registerClass:[HomeThreeViewCell class] forCellReuseIdentifier:@"threeCell"];
 
    
    
    
    
    
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    
    return [HomeThreeViewCell setUpWithHeightWithNewDic:@{}];
}






-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  
    HomeThreeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeCell" forIndexPath:indexPath];
    [cell setUpWithNewBigDic:@{}];
    return cell;
    
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
