//
//  AddXuanImage.m
//  TCZB
//
//  Created by ios on 2017/11/17.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "AddXuanImage.h"
#import "XCPhotoBrowserConfigure.h"
#import "XCPhotoBrowserManager.h"

@interface AddXuanImage ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate,TZImagePickerControllerDelegate,UITextFieldDelegate>

@end



@implementation AddXuanImage


-(void)setUpWithMyImage:(UIViewController *)myView {
    UIAlertController *Sheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         [self pictureFromCamera];
       
    }];
    
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      
      
            TZImagePickerController *imagePC=[[TZImagePickerController alloc]initWithMaxImagesCount:1 delegate:self];
            [imagePC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *imagarr, NSArray *array, BOOL bl) {
                UIImage *selimage = [imagarr firstObject];
                [self saveImage:selimage withName:@"image"];
                
            }];
            [self.myView presentViewController:imagePC animated:YES completion:nil];
        
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [Sheet addAction:cancelAction];
    [Sheet addAction:cameraAction];
  
          [Sheet addAction:albumAction];
   
    [myView presentViewController:Sheet animated:YES completion:nil];
    self.myView = myView;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        
        //从手机相册选取
        [self pictureFromCamera];
        
        
    }else if (buttonIndex == 1){
        [self pickerPictureFromAlbum];
        //调用拍照功能
        
    }else {
    }
}

//拍照功能----照相机
- (void)pictureFromCamera {
    //1.判断当前摄像头是否可用
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    //设置图片选择器,选择图片的路径
    imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;//拍照选取图片
    //设置拍照时下方的工具栏是否显示样式
    imagePicker.allowsEditing = YES;
    //设置代理对象
    imagePicker.delegate = self;
    //最后，模态推出本地相册即可
    [self.myView presentViewController:imagePicker animated:YES completion:nil];
    
    
}
//从本地选取照片
- (void)pickerPictureFromAlbum {
    //创建图片选择器对象
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    //设置图片选择器,选择图片的路径
    imagePicker.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;//本地选取图片
    //设置拍照时下方的工具栏是否显示样式
    imagePicker.allowsEditing = YES;
    //设置代理对象
    imagePicker.delegate = self;
    //最后，模态推出照相机即可
    [self.myView presentViewController:imagePicker animated:YES completion:nil];
}
#pragma mark-------UIImagePickerControllerDelegate
//当得到选中的图片之后或者视频之后，响应触发的方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //将选中的图片得到之后需要让控件显示
    UIButton *button = (UIButton *)[self.myView.view viewWithTag:1200];
    
    
    
 
    
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    [self saveImage:image withName:@"currentImage.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    [button setImage:savedImage forState:UIControlStateNormal];
    [self.myView dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
    
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:currentImage];
    
    
  
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
   
  
    
    manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"application/json",@"text/json",@"text/html",@"image/jpeg",@"text/plain",nil];
//
//    manager.requestSerializer= [AFJSONRequestSerializer serializer];
//
//    manager.requestSerializer= [AFJSONRequestSerializer serializer];
//
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"gamea_%@",[Toos setUpWithObjectForKey:@"token"]] forHTTPHeaderField:@"Authorization"];
//    
//    NSLog(@"requestSerializer===%@",manager.requestSerializer);
    
    
   
    
    NSDictionary *newDic = @{@"service":@"imageinfo.imgUp",@"title":@"12",@"rotatingDegree":@"0",@"platform":@"2",@"imgName":@"123.jpg",@"imgData": [Toos UIImageToBase64Str:currentImage]};
    
    
    
    [Toos receiveDataWithURLString:APP_URl url:@"" view:self.myView.view method:@"POST" body:newDic Block:^(id tempData) {
        if ([tempData[@"head"] [@"response_status"]intValue] == 100) {
            NSString *tid=[NSString stringWithFormat:@"%d",[tempData[@"body"][@"id"]intValue]]; 
            self.imgurl(tid);
        }
    } failBlock:^(id tempData) {
        
    }];
    
    
   
  
    
    
    
//    [manager POST:[NSString stringWithFormat:@"%@",APP_URl] parameters:newDic constructingBodyWithBlock:^(id formData) {
//
//        //NSData *data = UIImagePNGRepresentation(image);
//
//        NSData* data =UIImageJPEGRepresentation(currentImage,0.1);
//
//        NSDateFormatter*formatter = [[NSDateFormatter alloc]init];
//
//        //设置时间格式
//
//        formatter.dateFormat=@"yyyyMMddHHmmss";
//
//        NSString*str = [formatter stringFromDate:[NSDate date]];
//
//        NSString*fileName = [NSString stringWithFormat:@"%@.jpeg", str];
//       [formData appendPartWithFileData:imageData name:@"icon" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
//
//    }success:^(NSURLSessionDataTask*task,id responseObject) {
//
//
//         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
//
//        if ([dictionary[@"code"]intValue] == 200) {
//             self.addImage(dictionary);
//        }else {
//            [Toos setUpWithMBP:@"图片上传失败" UIView:self.myView.view];
//        }
//
//
//
//    }failure:^(NSURLSessionDataTask*task,NSError*error) {
//
//        NSLog(@"error==%@",error);
//
//
//
//    }];
//

    
}

#pragma mark----全平看大图
+ (void)setupWithBigImage:(NSMutableArray *)imageArray imageView:(UIImageView *)imageView number:(NSInteger)number viewController:(UIViewController *)myView{
    XCPhotoBrowserConfigure *configure = [XCPhotoBrowserConfigure defaultConfigure];
    configure.photoViewEdgeInsets   = UIEdgeInsetsMake(0, 0, 0, 0);
    configure.photoViewRowMargin    = 8;
    configure.photoViewColumnMargin = 8;
    configure.column = 2;
   
    [XCPhotoBrowserManager showFromViewController:myView
                                    selectedIndex:number
                                 seletedImageView:imageView
                                             urls:imageArray
                                        thumbImgs:nil
                                        configure:configure];
}


#pragma mark----搜索
-(UIView *)setUpWithSearchView:(CGRect)frame myView:(UIViewController *)myView  XBianJu:(CGFloat)XBianJu isFrom:(NSString *)isFrom YFrame:(CGFloat)YFrame backGrondColor:(UIColor *)backGrondColor text:(NSString *)text textColor:(UIColor *)textColor textFont:(CGFloat)textFont imageFrame:(CGRect)imageFrame{
    
    UIView *bigView = [[UIView alloc]initWithFrame:frame];
    
    bigView.backgroundColor = [UIColor whiteColor];
    
    
    UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(XBianJu, kWidthChange(20), frame.size.width - 2 * XBianJu, YFrame)];
    
    smallView.layer.masksToBounds = YES;
    smallView.layer.cornerRadius = 4;
    [bigView addSubview:smallView];
    
    smallView.backgroundColor = backGrondColor;
    UIButton *newBT = [UIButton buttonWithType:UIButtonTypeCustom];
    newBT.frame = CGRectMake(frame.size.width - kWidthChange(57), kWidthChange(20), kWidthChange(57), YFrame);
    [newBT setTitle:@"取消" forState:UIControlStateNormal];
    [newBT setTitleColor:newColor(102, 102, 102, 1) forState:UIControlStateNormal];
    newBT.titleLabel.font = [UIFont setFontWithSize:kWidthChange(14)];
    
    
      CGRect smallFrame = smallView.frame;
    

    if ([isFrom isEqualToString:@"1"]) {
        
        smallFrame.size.width = frame.size.width - 2 * XBianJu;
        
        
        
        
    }else {
        smallFrame.size.width = frame.size.width - XBianJu - kWidthChange(57);
        
        [bigView addSubview:newBT];
        
        
        
    }
    smallView.frame = smallFrame;
    
  
    UIImageView *searchimage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
    searchimage.frame = CGRectMake(imageFrame.origin.x, smallView.frame.size.height / 2 - imageFrame.size.height / 2, imageFrame.size.width, imageFrame.size.height);
    [smallView addSubview:searchimage];
    
    
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(searchimage.frame) + 10, 0, smallView.frame.size.width - imageFrame.size.width - 20, smallView.frame.size.height)];
    textField.returnKeyType =UIReturnKeyDone;
    textField.delegate = self;
    textField.placeholder = text;
    
    textField.font = [UIFont systemFontOfSize:textFont];
    if ([isFrom isEqualToString:@"1"]) {
        
        textField.userInteractionEnabled = NO;
        
        
        
        
    }else {
       
        
        textField.userInteractionEnabled = YES;
        
        
        
        
    }
    
    [textField setValue:textColor forKeyPath:@"_placeholderLabel.Color"];
    
    [smallView addSubview:textField];
  
    
    return bigView;
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"点击了搜索");
    return YES;
}
@end
