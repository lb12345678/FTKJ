//
//  MyWebViewController.m
//  jieSHiBan
//
//  Created by ios on 2017/11/27.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "MyWebViewController.h"

@interface MyWebViewController ()<UIWebViewDelegate>

@property(nonatomic,retain)UIWebView *webView;
@end

@implementation MyWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"";
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight )];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = NO;
    [self.view addSubview:self.webView];
   
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",self.isFrom]];
    NSURLRequest *re = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:re];
    // Do any additional setup after loading the view.
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
   [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    // 完成加载
    [MBProgressHUD hideHUDForView:self.view animated:YES];
 
    NSString *theTitle=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];

    self.navigationItem.title = theTitle;
  
    //[self navbarTitle:theTitle];
    // [self setTitle:theTitle];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
      [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
