//
//  XIEYIViewController.m
//  FRY
//
//  Created by iOS 开发 on 2019/9/3.
//  Copyright © 2019 iOS 开发. All rights reserved.
//

#import "XIEYIViewController.h"

@interface XIEYIViewController ()
@property(nonatomic,strong)NSMutableDictionary *tempDic;
@end
/**/
@implementation XIEYIViewController
-(NSMutableDictionary *)tempDic{
    if (_tempDic==nil) {
        _tempDic=[NSMutableDictionary dictionaryWithCapacity:1];
    }
    return _tempDic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"用户协议";
    [self loadData];
    // Do any additional setup after loading the view.
}
-(void)loadData{
    
    
    [Toos dataWithSessionurl:@"/app/public/word" body:@{} view:self.view token:@"" Block:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        if ([tempData[@"code"]intValue] == 200) {
            self.tempDic=tempData[@"data"];
            [self setUpWithWebView];
            
        }
        
        
    } failBlock:^(id tempData) {
        [Toos setUpWithMBP:tempData[@"msg"] UIView:self.view];
        
    }];
}
-(void)setUpWithWebView{
    UIWebView *web=[[UIWebView alloc]initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight-kTopHeight)];
    NSString *htmls = [NSString stringWithFormat:@"<html> \n"
                       "<head> \n"
                       "<style type=\"text/css\"> \n"
                       "body {font-size:15px;}\n"
                       "</style> \n"
                       "</head> \n"
                       "<body>"
                       "<script type='text/javascript'>"
                       "window.onload = function(){\n"
                       "var $img = document.getElementsByTagName('img');\n"
                       "for(var p in  $img){\n"
                       "var httpP = \"http://webapi.houno.cn\"+$img[p].getAttribute(\"src\");"
                       "$img[p].setAttribute(\"src\",httpP);"    // 这里发现拼接图片地址也能成功了。
                       "$img[p].style.width = '100%%';\n"
                       "$img[p].style.height ='auto'\n"
                       "}\n"
                       "}"
                       "</script>%@"
                       "</body>"
                       "</html>",self.tempDic[@"content"]];
    [web loadHTMLString:htmls baseURL:[NSURL URLWithString:APP_URl]];
    [self.view addSubview:web];

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
