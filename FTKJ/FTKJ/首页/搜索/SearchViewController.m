//
//  SearchViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/21.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchViewCell.h"

@interface SearchViewController ()

@property(nonatomic,retain)UITextField *searchField;

@property(nonatomic,retain)NSMutableArray *searchArray;

@property(nonatomic,retain)NSMutableArray *hotArray;
@end

@implementation SearchViewController

-(NSMutableArray *)searchArray {
    if (_searchArray == nil) {
        self.searchArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _searchArray;
}
-(NSMutableArray *)hotArray {
    if (_hotArray == nil) {
        self.hotArray = [NSMutableArray arrayWithCapacity:1];
        
    }
    return _hotArray;
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
      [self.navigationController.navigationBar setHidden:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.searchArray addObject:@{@"keywords":@"杜兰特"}];
    
      [self.searchArray addObject:@{@"keywords":@"科"}];
    
      [self.searchArray addObject:@{@"keywords":@"迈克尔乔丹"}];
    
     [self.searchArray addObject:@{@"keywords":@"是肯德基肯德基肯德基啊看得见"}];
    
    
    [self.hotArray addObject:@{@"keywords":@"杜兰特"}];
    
    [self.hotArray addObject:@{@"keywords":@"科"}];
    
    [self.hotArray addObject:@{@"keywords":@"迈克尔乔丹"}];
    
    [self.hotArray addObject:@{@"keywords":@"是肯德基肯德基肯德基啊看得见"}];
    [self setUpWithBigView];
    // Do any additional setup after loading the view.
}

-(void)setUpWithBigView {
    
    
    UIImageView *bigView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kTopHeight + kWidthChange(12) )];
    bigView.image = [UIImage imageNamed:@"bg7-1"];
    
    [self.view addSubview:bigView];
    
    bigView.userInteractionEnabled = YES;
    
    UIButton *leftBT = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBT setImage:[UIImage imageNamed:@"box14-1"] forState:UIControlStateNormal];
    leftBT.frame = CGRectMake(kWidthChange(15), kStatusBarHeight + kWidthChange(12.5), kWidthChange(20), kWidthChange(20));
    [leftBT addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:leftBT];
    
    
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftBT.frame) + kWidthChange(20) ,kStatusBarHeight + kWidthChange(5)  ,kScreenWidth - kWidthChange(80) - CGRectGetMaxX(leftBT.frame)  , kWidthChange(35))];
    searchView.layer.masksToBounds = YES;
    searchView.backgroundColor = newColor(255, 255, 255, 1);
    searchView.layer.cornerRadius = kWidthChange(17.5);
    [bigView addSubview:searchView];
    searchView.layer.borderWidth = 1;
    searchView.layer.borderColor = newColor(221, 221, 221, 1).CGColor;
    
    
    
    
    self.searchField = [[UITextField alloc]initWithFrame:CGRectMake( kWidthChange(15), 0,kScreenWidth - kWidthChange(125)  , kWidthChange(35))];
    self.searchField.delegate = self;
    
    self.searchField.placeholder = @"请输入搜索内容";
    [self.searchField setValue:newColor(218, 219, 220, 1) forKeyPath:@"_placeholderLabel.font"];
    [self.searchField setValue:[UIFont systemFontOfSize:kWidthChange(16)] forKeyPath:@"_placeholderLabel.font"];
    self.searchField.font = [UIFont systemFontOfSize:kWidthChange(16)];
    self.searchField.textColor = newColor(51, 51, 51, 1);
    
    
    [searchView addSubview:self.searchField];
    
    
    
    UIImageView *oneSearchImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"box37"]];
    oneSearchImage.frame = CGRectMake(kScreenWidth - kWidthChange(105) - kWidthChange(40), kWidthChange(35) / 2 - kWidthChange(14) / 2,  kWidthChange(14) , kWidthChange(14));
    
     [searchView addSubview:oneSearchImage];
    
    
    
    
    
    UIButton *searchImage = [UIButton buttonWithType:UIButtonTypeCustom];
   
    [searchImage setTitle:@"搜索" forState:UIControlStateNormal];
    [searchImage setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    searchImage.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(16)];
    searchImage.frame = CGRectMake(kScreenWidth  - kWidthChange(60),   kStatusBarHeight + kWidthChange(5) , kWidthChange(60), kWidthChange(35));
    [bigView addSubview:searchImage];
    
    [searchImage addTarget:self action:@selector(clickSearch:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bigView.frame) + kWidthChange(10), kScreenWidth, kScreenHeight - CGRectGetMaxY(bigView.frame) - kWidthChange(10)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[SearchViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return [SearchViewCell setUpWithHeightWithArray:self.hotArray];
    }
    
    
    return [SearchViewCell setUpWithHeightWithArray:self.searchArray];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *string = [NSString stringWithFormat:@"cell%ld",indexPath.section];
    
    
    SearchViewCell *cell  = [self.tableView cellForRowAtIndexPath:indexPath];
    
    
    // 判断为空进行初始化  --（当拉动页面显示超过主页面内容的时候就会重用之前的cell，而不会再次初始化）
    if (cell == nil) {
        cell = [[SearchViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        
    }
//    cell.category = self.categoryBT.titleLabel.text;
    
    if (indexPath.section == 0) {
        [cell setUpWithMyBigView:self.hotArray interGer:indexPath];
    }else {
        [cell setUpWithMyBigView:self.searchArray interGer:indexPath];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    __weak typeof(self)weakSelf = self;
    
    cell.deleteCategory = ^(NSInteger newId) {
        
        
        [weakSelf.searchArray removeObjectAtIndex:newId - 200];
        [Toos saveArray:@"search" string:self.searchArray];
        [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
        
        
    };
    
   
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return kWidthChange(45);
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(45))];
    oneView.backgroundColor = [UIColor whiteColor];
    
    NSArray *oneArray = @[@"搜索历史",@"热门搜索"];
    
    
    UILabel *smallLabel = [Toos setUpWithUserLabel:[oneArray objectAtIndex:section] CGRect:CGRectMake(kWidthChange(10), 0 ,kScreenWidth -  20 ,kWidthChange(45)) color:[UIColor clearColor] textColor:newColor(55, 55, 55, 1) textSize:kWidthChange(17)];
    [oneView addSubview:smallLabel];
    
    UIButton *deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [deleteBT setImage:[UIImage imageNamed:@"box38"] forState:UIControlStateNormal];
    deleteBT.frame = CGRectMake(kScreenWidth - kWidthChange(30), kWidthChange(10), kWidthChange(15), kWidthChange(20));
    if (section == 0) {
        
        
        
        
         [deleteBT setImage:[UIImage imageNamed:@"box38"] forState:UIControlStateNormal];
        
        
       
    }else {
        
         [deleteBT setImage:[UIImage imageNamed:@"box39"] forState:UIControlStateNormal];
    }
    
    [deleteBT addTarget:self action:@selector(clickDeleter:) forControlEvents:UIControlEventTouchUpInside];
     [oneView addSubview:deleteBT];
    
    return oneView;
}

- (void)clickDeleter:(UIButton *)sender {
    
    if ([DataBaseManager sharedFMDBManager].isDelete == YES) {
        [DataBaseManager sharedFMDBManager].isDelete = NO;
    }else if ([DataBaseManager sharedFMDBManager].isDelete == NO){
        
        [DataBaseManager sharedFMDBManager].isDelete = YES;
    }
    
    
    
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return kWidthChange(0);
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    if (section == 0) {
        return nil;
//    }
//    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(55))];
//    bigView.backgroundColor = newColor(255, 255, 255, 1);
//
//    UIButton *qingChuBT = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    [qingChuBT setTitle:@"清除历史搜索" forState:UIControlStateNormal];
//    qingChuBT.frame = CGRectMake(kWidthChange(25),  kWidthChange(10) ,kScreenWidth - kWidthChange(50), kWidthChange(45));
//    [ bigView addSubview:qingChuBT];
//
//    [qingChuBT addTarget:self action:@selector(clickQingChu:) forControlEvents:UIControlEventTouchUpInside];
//    [qingChuBT setTitleColor:newColor(0, 0, 0, 1) forState:UIControlStateNormal];
//    qingChuBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(17)];
//    return bigView;
}

#pragma mark----类别
-(void)clickCategory:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"商品"]) {
        [sender setTitle:@"商家" forState:UIControlStateNormal];
    } else if ([sender.titleLabel.text isEqualToString:@"商家"]) {
        [sender setTitle:@"商品" forState:UIControlStateNormal];
    }
    [self.tableView reloadData];
    [sender layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:2 weight:2];
}

-(void)clickQingChu:(UIButton *)sender {
    [self.searchArray removeAllObjects];
    [Toos saveArray:@"search" string:self.searchArray];
    [DataBaseManager sharedFMDBManager].isDelete = NO;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}
#pragma mark--点击搜索
- (void)clickSearch:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    if (self.searchField.text.length == 0) {
        [Toos setUpWithMBP:@"请输入搜索内容" UIView:self.view];
        return;
    }
    
//    SearchJieGuoViewController *jieGuo = [[SearchJieGuoViewController alloc]init];
//    jieGuo.isCategory = self.categoryBT.titleLabel.text;
//    jieGuo.searchText = self.searchField.text;
//    NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:1];
//    [newDic setObject:self.categoryBT.titleLabel.text forKey:@"title"];
//    [newDic setObject:self.searchField.text forKey:@"keywords"];
//    [self.searchArray addObject: newDic];
//
//
//    [Toos saveArray:@"search" string:self.searchArray];
//    [self.navigationController pushViewController:jieGuo animated:YES];
    
    
    
    
}
-(void)clickReturn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
 
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
