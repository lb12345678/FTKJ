//
//  PLViewController.m
//  JZGL
//
//  Created by ios on 2019/8/14.
//  Copyright © 2019年 ios. All rights reserved.
//

#import "PLViewController.h"
#import "JZPLViewCell.h"

@interface PLViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>



@property(nonatomic,retain)NSMutableArray *imageArray;

@property(nonatomic,retain)NSMutableArray *imageIdArray;


@end

@implementation PLViewController

-(NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        self.imageArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _imageArray;
}



-(NSMutableArray *)imageIdArray {
    if (_imageIdArray == nil) {
        self.imageIdArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _imageIdArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"评价";
    [self setUpWithBigView];
    [self setUpWithNaviagation];
    [self setUpWithShuJuChuLi];
    // Do any additional setup after loading the view.
}

-(void)setUpWithShuJuChuLi {
    
    for (NSDictionary *tempDic in self.tempDic[@"product_list"]) {
        NSMutableDictionary *bigDic = [[NSMutableDictionary alloc]initWithDictionary:tempDic];
        [bigDic setObject:@"" forKey:@"context"];
        [bigDic setObject:[NSMutableArray arrayWithCapacity:1] forKey:@"imgs"];
        
         [bigDic setObject:@"0" forKey:@"stars"];
        [self.imageArray addObject:bigDic];
    }
    [self.tableView reloadData];
}





-(void)setUpWithNaviagation {
    UIButton *SearchBT = [UIButton buttonWithType:UIButtonTypeCustom];
    SearchBT.frame = CGRectMake( 0, 0,  kWidthChange(40), kWidthChange(40));
    
    
    [SearchBT setTitle:@"发布" forState:UIControlStateNormal];
    [SearchBT setTitleColor:newColor(76, 86, 99, 1) forState:UIControlStateNormal];
    SearchBT.titleLabel.font = [UIFont systemFontOfSize:kWidthChange(15)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:SearchBT];
    [SearchBT addTarget:self action:@selector(clickTJPJ:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)setUpWithBigView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight - kTopHeight -  downH) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[JZPLViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.imageArray.count;
    
//    return [self.tempDic[@"order_shop"]count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JZPLViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setUpWithMessage:[self.imageArray objectAtIndex:indexPath.section] indexPath:indexPath];
    cell.textView.delegate = self;
    cell.tag = 10 + indexPath.section;
    
    cell.ClickImage = ^(int temp) {
        NSMutableArray *imageArray = [self.imageArray objectAtIndex:(temp  - 200) / 100][@"imgs"];
       
        
        __weak typeof(self)weakSelf = self;
        [self setUpWithMyImage:self isFrom:@""];
        self.myImage = ^(NSDictionary *newDic) {
            
            [imageArray addObject:newDic];
            [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:( temp - 200) / 100] withRowAnimation:UITableViewRowAnimationNone];
            
            
            
        };
        
        
        
    };
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return [JZPLViewCell tableViewSetHeight:[self.imageArray objectAtIndex:indexPath.section]];
    
    
}



-(void)textViewDidEndEditing:(UITextView *)textView {
    
    JZPLViewCell *cell = (JZPLViewCell *)[textView.superview superview];
    NSMutableDictionary *tempDic = [self.imageArray objectAtIndex:cell.tag - 10];
    [tempDic setObject:[NSString stringWithFormat:@"%@",textView.text] forKey:@"context"];
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidthChange(10))];
    smallView.backgroundColor = newColor(241, 242, 244, 1);
    
    return smallView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return kWidthChange(10);
}

-(void)clickTJPJ:(UIButton *)sender {
    
    NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:1];
    
    
    [newDic setObject:[UserModel shared].uid forKey:@"uid"];
    [newDic setObject:self.tempDic[@"id"] forKey:@"oid"];
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:1];
    
    for (int i = 0; i < self.imageArray.count; i++) {
       
      
        
        if ([Toos isNotBlank: [self.imageArray objectAtIndex:i][@"context"]] &&  [[self.imageArray objectAtIndex:i][@"stars"]intValue] != 0 ) {
            NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:1];
            [tempDic setObject:[self.imageArray objectAtIndex:i][@"context"] forKey:@"content"];
            [tempDic setObject:[self.imageArray objectAtIndex:i][@"product"][@"id"] forKey:@"product_id"];
            [tempDic setObject: [self.imageArray objectAtIndex:i][@"stars"] forKey:@"star"];
            
            if ([Toos isNotBlank:[self.imageArray objectAtIndex:i][@"imgs"]]) {
                NSString *imgStr;
                for (NSDictionary *imageId in   [self.imageArray objectAtIndex:i][@"imgs"]) {
                    if ([Toos isBlank:imgStr]) {
                        imgStr = [NSString stringWithFormat:@"%@",imageId[@"id"]];
                    }else {
                        imgStr = [NSString stringWithFormat:@"%@,%@",imgStr,imageId[@"id"]];
                    }
                }
                
                [tempDic setObject:imgStr forKey:@"imgarr"];
            }
            
            
            
            
            [tempArray addObject: tempDic];
        }
        
        
    }
    
    if (tempArray.count != self.imageArray.count) {
        
        [Toos setUpWithMBP:@"商品评论填写不完整" UIView:self.view];
        
        return;
    }
    
    [newDic setObject:tempArray forKey:@"data"];
    
    [Toos dataWithSessionurl:@"/app/member/order_comment" body:newDic view:self.view token:@"" Block:^(id tempData) {
        if ([tempData[@"code"]intValue] == 200) {
            [self.navigationController popViewControllerAnimated:YES];
        }else {
            [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
            
        }
    } failBlock:^(id tempData) {
        
    }];
    
    
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
