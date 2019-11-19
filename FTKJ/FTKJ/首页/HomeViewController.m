//
//  HomeViewController.m
//  FTKJ
//
//  Created by ios on 2019/11/19.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "HomeViewController.h"
#import "THDatePickerView.h"
#import "HomeOneHeaderView.h"
#import "HomeOneFooterView.h"
@interface HomeViewController ()<UIScrollViewDelegate>

@property(nonatomic,retain)UIImageView *alphaView;

@property(nonatomic,retain)UIButton *addressBT;

@property(nonatomic,retain)UITextField *searchField;

@property(nonatomic,retain) UIView *searchView;

@property(nonatomic,assign)BOOL isDrag;

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setUpWithTableView];
    [self setUpWithHeaderView];
    
    
    // Do any additional setup after loading the view.
}

-(void)setUpWithTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -kStatusBarHeight, kScreenWidth, kScreenHeight - kTabBarHeight + kStatusBarHeight ) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"oneCell"];
    [self.tableView registerClass:[HomeOneHeaderView class] forHeaderFooterViewReuseIdentifier:@"oneHeader"];
    
     [self.tableView registerClass:[HomeOneFooterView class] forHeaderFooterViewReuseIdentifier:@"oneFooter"];
    self.alphaView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    self.alphaView.frame = CGRectMake(0, 0, kScreenWidth, kTopHeight);
    self.alphaView.image = [UIImage imageNamed:@"背景"];
    [self.view addSubview:self.alphaView];
    self.alphaView.userInteractionEnabled = YES;
    self.alphaView.alpha = 0;
    self.addressBT = [[UIButton alloc]initWithFrame:CGRectMake(kWidthChange(8), kStatusBarHeight + kWidthChange(5), kWidthChange(20), kWidthChange(25))];
    [self.addressBT setImage:[UIImage imageNamed:@"1000"] forState:UIControlStateNormal];
    
    
    [self.addressBT setTitleColor:newColor(70, 79, 83, 1) forState:UIControlStateNormal];
    self.addressBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(14)];
    [self.view addSubview:self.addressBT];
    
    if ([Toos isNotBlank:[Toos setUpWithObjectForKey:@"qu"]]) {
        CGRect addressFrame = self.addressBT.frame;
        addressFrame.size.width = [Toos textRect:[NSString stringWithFormat:@" %@",[Toos setUpWithObjectForKey:@"qu"]] textFont:[UIFont systemFontOfSize:kWidthChange(14)]] + 20;
        self.addressBT.frame = addressFrame;
        
        [self.addressBT setTitle:[Toos setUpWithObjectForKey:@"qu"] forState:UIControlStateNormal];
    }
    
    self.searchView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.addressBT.frame) + kWidthChange(10), kStatusBarHeight + kWidthChange(5), kScreenWidth - CGRectGetMaxX(self.addressBT.frame) - kWidthChange(10) - kWidthChange(15), kWidthChange(37))];
    self.searchView.layer.masksToBounds = YES;
    self.searchView.layer.cornerRadius = kWidthChange(37) / 2;
    self.searchView.layer.borderWidth = .5;
    self.searchView.backgroundColor = [UIColor whiteColor];
    self.searchView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self.view addSubview:self.searchView];
   
    
    self.searchField = [[UITextField alloc]initWithFrame:CGRectMake( kWidthChange(15), 0,kWidthChange(198 + 70) - kWidthChange(40) , kWidthChange(37))];
    self.searchField.delegate = self;
    
    self.searchField.placeholder = @"输入您想查询的商品关键字";
    [self.searchField setValue:newColor(196, 197, 199, 1) forKeyPath:@"_placeholderLabel.Color"];
    [self.searchField setValue:[UIFont systemFontOfSize:kWidthChange(12)] forKeyPath:@"_placeholderLabel.font"];
    self.searchField.font = [UIFont systemFontOfSize:kWidthChange(12)];
    self.searchField.textColor = [UIColor whiteColor];
    self.searchField.userInteractionEnabled = NO;
    
    [self.searchView addSubview:self.searchField];
    [self.searchView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickSearch:)]];
    
    
    UIImageView *searchImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"搜索1"]];
    
    
    searchImage.frame = CGRectMake( kScreenWidth - CGRectGetMaxX(self.addressBT.frame) - kWidthChange(10) - kWidthChange(15) - kWidthChange(30), kWidthChange(37) / 2 - kWidthChange(14) / 2, kWidthChange(14), kWidthChange(14));
    
    [self.searchView addSubview:searchImage];
    
    
    
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        self.isDrag = YES;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.isDrag == YES) {
        
        
        CGFloat yoffset = scrollView.contentOffset.y;
        
        if (yoffset >0) {
            
            CGFloat alpha = MIN(1, yoffset/80);
            
            self.alphaView.alpha = alpha;
            
        }else {
            self.alphaView.alpha = 0;
            
        }
    }
}

-(void)setUpWithHeaderView {
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(342))];
    UIImageView *bigImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(278))];
    bigImage.backgroundColor = [UIColor redColor];
    
    [bigView addSubview:bigImage];
    
    
    UIImageView *smallImage = [[UIImageView alloc]initWithFrame:CGRectMake(kWidthChange(20), kWidthChange(162), kScreenWidth - kWidthChange(40), kWidthChange(180))];
    smallImage.backgroundColor = [UIColor blackColor];
    smallImage.layer.masksToBounds = YES;
    smallImage.layer.cornerRadius = 5;
    [bigView addSubview:smallImage];
    
    self.tableView.tableHeaderView = bigView;
    
}







-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return kWidthChange(500);
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    HomeOneHeaderView *oneHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"oneHeader"];
    [oneHeader setUpWithNewBigDic:@{}];
    return oneHeader;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return kWidthChange(105);
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    HomeOneHeaderView *oneHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"oneFooter"];
    oneHeader.backgroundColor = [UIColor whiteColor];
    return oneHeader;
    
}

#pragma mark--点击搜哟
-(void)clickSearch:(UITapGestureRecognizer *)sender {
    
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
