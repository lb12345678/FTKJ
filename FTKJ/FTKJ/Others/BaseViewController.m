//
//  BaseViewController.m
//  FRY
//
//  Created by ios on 2019/8/11.
//  Copyright © 2019年 iOS 开发. All rights reserved.
//

#import "BaseViewController.h"
#import "TabBarController.h"
#import "ShareKeCheng.h"

@interface BaseViewController (){
    CGFloat _currentKeyboardH;
    CGFloat _transformY;
}
@property(nonatomic,retain)ShareKeCheng *ShareKC;
@end

@implementation BaseViewController


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
   
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont setFontWithSize:kWidthChange(18)],
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    
//    DengLuTanKuangView *DengLu = [[DengLuTanKuangView alloc]initWithFrame:CGRectMake(kScreenWidth / 2 - kWidthChange(90), kScreenHeight / 2 - kWidthChange(118) / 2, kWidthChange(180), kWidthChange(118))];
//    
//    if ([Toos isNotBlank:DatabaseInstance().user.token] && [Toos isNotBlank:[Toos setUpWithObjectForKey:@"loginTime"]]) {
//        [[UIApplication sharedApplication].keyWindow addSubview:DengLu];
//        
//    }
//    
    
    
}





-(NSURL *)setPath:(NSString *)path{
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",APP_IMAGEURl,path]];
    return url;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    UIImage *bgImage = [UIImage imageNamed:@"navBag"];
    
    bgImage = [bgImage resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    
    
    //    self.view.backgroundColor = newColor(235, 235, 235, 1);
    //
    //
    //    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    //
    //
    //
    //    [self.navigationController.navigationBar setShadowImage:[self imageWithColor:[UIColor lightGrayColor] size:CGSizeMake(self.view.frame.size.width, 0.5)]];
    //
    self.view.backgroundColor = newColor(241, 242, 244, 1);
    
    self.navigationController.navigationBar.barTintColor = newColor(255, 255, 255, 1);
    
//    [self.navigationController.navigationBar setShadowImage:[self imageWithColor:[UIColor lightGrayColor] size:CGSizeMake(self.view.frame.size.width, 0.5)]];
    
    // Do any additional setup after loading the view.
}
-(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <=0 || size.height <=0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (AppDelegate *)getCJAppDelegate{
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    return appDelegate;
}


- (void)callPhone:(NSString *)phone{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"dengLuFail" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"messageCount" object:nil];
     [[NSNotificationCenter defaultCenter]removeObserver:self name:@"login" object:nil];
}

-(void)setUpWithMyImage:(UIViewController *)myView isFrom:(NSString *)isFrom{
    
    
    UIAlertController *Sheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self pictureFromCamera:@"1"];
        
    }];
    
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self pickerPictureFromAlbum];
        
        
    }];
    
    
    UIAlertAction *MoVieAction = [UIAlertAction actionWithTitle:@"录像" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self pictureFromCamera:@"2"];
        
    }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [Sheet addAction:cancelAction];
    [Sheet addAction:cameraAction];
    
    [Sheet addAction:albumAction];
    if ([isFrom intValue] != 1) {
        [Sheet addAction:MoVieAction];
    }
    
    [myView presentViewController:Sheet animated:YES completion:nil];
    
}

//拍照功能----照相机
- (void)pictureFromCamera:(NSString *)type {
    
    
    //    if ([Toos detectionCameraState:^{
    //
    //    }] == NO) {
    //
    //        return;
    //
    //    }
    //
    //
    //1.判断当前摄像头是否可用
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    //设置图片选择器,选择图片的路径
    imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;//拍照选取图片
    if ([type intValue] == 2) {
        
        
        imagePicker.cameraDevice=UIImagePickerControllerCameraDeviceRear/UIImagePickerControllerCameraDeviceFront;
        
        imagePicker.mediaTypes=@[(NSString *)kUTTypeMovie];
        imagePicker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModeVideo;
        imagePicker.videoMaximumDuration=20.0;
    }
    
    //设置拍照时下方的工具栏是否显示样式
    imagePicker.allowsEditing = YES;
    //设置代理对象
    imagePicker.delegate = self;
    //最后，模态推出本地相册即可
    [self presentViewController:imagePicker animated:YES completion:nil];
    
    
}
//从本地选取照片
- (void)pickerPictureFromAlbum {
    //创建图片选择器对象
    //    if ([Toos detectionPhotoState:^{
    //
    //    }] == NO) {
    //
    //
    //        return;
    //
    //    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    //设置图片选择器,选择图片的路径
    
    
    imagePicker.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;//本地选取图片
    
    
    
    imagePicker.mediaTypes  = [NSArray arrayWithObjects:@"public.movie",@"public.image", nil];
    
    
    //设置拍照时下方的工具栏是否显示样式
    imagePicker.allowsEditing = YES;
    //设置代理对象
    imagePicker.delegate = self;
    //最后，模态推出照相机即可
    [self presentViewController:imagePicker animated:YES completion:nil];
}
#pragma mark-------UIImagePickerControllerDelegate
//当得到选中的图片之后或者视频之后，响应触发的方法



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //将选中的图片得到之后需要让控件显示
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        [self saveImage:image withName:@"currentImage.png"];
    }else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]){
        
        NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
        
        [self setUpWithVideo:videoURL];
    }
    
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)clickDengLuFail:(NSNotification *)noti {
    
//    LoginViewController *login = [[LoginViewController alloc]init];
//    ZFNavigationController *navi = [[ZFNavigationController alloc]initWithRootViewController:login];
//
//    [self  presentViewController:navi animated:YES completion:nil];
    
}



- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    
    
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"application/json",@"text/json",@"text/html",@"image/jpeg",@"text/plain",nil];
    
    
    __weak typeof(self)weakSelf =self;
    
    [manager POST:[NSString stringWithFormat:@"%@%@",APP_URl,@"/uploads/upload"] parameters:nil constructingBodyWithBlock:^(id formData) {
        
        //NSData *data = UIImagePNGRepresentation(image);
        
        NSData* data =UIImageJPEGRepresentation(currentImage,0.1);
        
        NSDateFormatter*formatter = [[NSDateFormatter alloc]init];
        
        //设置时间格式
        
        formatter.dateFormat=@"yyyyMMddHHmmss";
        
        NSString*str = [formatter stringFromDate:[NSDate date]];
        
        NSString*fileName = [NSString stringWithFormat:@"%@.png", str];
        
        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
        
    }success:^(NSURLSessionDataTask*task,id responseObject) {
        
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        
        if ([dictionary[@"code"]intValue] == 200) {
            self.myImage(dictionary);
        }else {
            [Toos setUpWithMBP:@"图片上传失败" UIView:self.view];
        }
        
    }failure:^(NSURLSessionDataTask*task,NSError*error) {
        
        NSLog(@"error==%@",error);
    }];
    
}
#pragma mark---上传视频
-(void)setUpWithVideo:(NSURL *)data {
    
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:data  options:nil];
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyyMMddHHmmss"];
    NSString *fileName = [NSString stringWithFormat:@"output-%@.mp4",[formater stringFromDate:[NSDate date]]];
    
    
    
    NSString *mimeType;
    
    
    mimeType = [NSString stringWithFormat:@"video/%@", fileName];
    
    //创建AFHTTPSessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置响应文件类型为JSON类型
    manager.responseSerializer  = [AFJSONResponseSerializer serializer];
    //初始化requestSerializer
    manager.requestSerializer   = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = nil;
    //设置timeout
    [manager.requestSerializer setTimeoutInterval:20.0];
    //设置请求头类型
    [manager.requestSerializer setValue:@"form/data" forHTTPHeaderField:@"Content-Type"];
    //设置请求头, 授权码
    [manager.requestSerializer setValue:@"YgAhCMxEehT4N/DmhKkA/M0npN3KO0X8PMrNl17+hogw944GDGpzvypteMemdWb9nlzz7mk1jBa/0fpOtxeZUA==" forHTTPHeaderField:@"Authentication"];
    //上传服务器接口
    NSString *url = [NSString stringWithFormat:@"%@%@",APP_URl,@"public/uploads"];
    //开始上传
    
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        NSError *error;
        BOOL success = [formData appendPartWithFileURL:data name:@"file" fileName:fileName mimeType:mimeType error:&error];
        if (!success) {
            NSLog(@"appendPartWithFileURL error: %@", error);
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"上传进度: %f", uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        NSLog(@"成功返回: %@", responseObject);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        });
        
        if ([responseObject[@"code"]intValue] == 200) {
            if (self.myImage) {
                
                NSMutableDictionary *tempDic = [[NSMutableDictionary alloc]initWithDictionary:responseObject];
                [tempDic setObject:@"1" forKey:@"type"];
                
                
                self.myImage(tempDic);
            }
            
        }else {
            [Toos setUpWithMBP:@"视频上传失败" UIView:self.view];
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败: %@", error);
        
    }];
    
    
    
    
    
}
-(void)setUpWithShare:(NSDictionary *)tempDic {
    
    
    
    if (self.ShareKC) {
        self.ShareKC.hidden = NO;
    }else {
        self.ShareKC = [[ShareKeCheng alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - downH)];
        self.ShareKC.type = @"1";
        self.ShareKC.bigDic = tempDic;
        [[UIApplication sharedApplication].keyWindow addSubview:self.ShareKC];
        
    }
    
    
    
}
-(void)setUpWithWeiXin:(NSDictionary *)newDic {
    
    PayReq* req             = [[PayReq alloc] init];
    req.openID              = [NSString stringWithFormat:@"%@",newDic[@"appid"]];
    req.partnerId           = [NSString stringWithFormat:@"%@",newDic[@"mch_id"]];
    req.prepayId            = [NSString stringWithFormat:@"%@",newDic[@"prepay_id"]];
    req.nonceStr            = [NSString stringWithFormat:@"%@",newDic[@"nonce_str"]];;
    req.timeStamp           = [newDic[@"timestamp"] intValue];
    req.package             = @"Sign=WXPay";
    req.sign                = [NSString stringWithFormat:@"%@",newDic[@"sign"]];;;
    [WXApi sendReq:req];
    
}
#pragma mark--支付宝
//- (void)zhiFubao:(NSString *)string {
//    NSString *appScheme = @"JMSX";
//    
//    if (string != nil) {
//        
//        [[AlipaySDK defaultService] payOrder:string fromScheme:appScheme callback:^(NSDictionary *resultDic) {
//            
//            if ([resultDic[@"resultStatus"]intValue] == 9000) {
//                
//                [[NSNotificationCenter defaultCenter]postNotificationName:@"paySuccess" object:nil];
//                
//            }else {
//                [Toos setUpWithMBP:resultDic[@"memo"] UIView:self.view];
//            }
//        }];
//        
//        
//    }
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
