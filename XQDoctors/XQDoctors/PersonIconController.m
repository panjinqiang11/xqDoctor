//
//  PersonIconController.m
//  XQDoctors
//
//  Created by kassia on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "PersonIconController.h"

@interface PersonIconController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation PersonIconController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人头像";
    
    //右边item
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"save"] style:UIBarButtonItemStylePlain target:self action:@selector(saveBtn)];
}

- (void)saveBtn{

    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    

}
/**
 *  从相册获取图片
 */
- (IBAction)photoBtn:(UIButton *)sender {
    //创建UIImagePickerController
    UIImagePickerController *imageController = [[UIImagePickerController alloc]init];
    //获取照片的方式
    imageController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //设置代理
    imageController.delegate = self;
    
    [self presentViewController:imageController animated:YES completion:nil];

}
- (void)sendImage:(ImageBlock)imageBlock{
    
    if (imageBlock) {
        
      imageBlock(self.iconImage.image);
    }
    
}
#pragma mark - 实现代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    //dismiss
    [picker dismissViewControllerAnimated:YES completion:nil];

    //赋值
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    self.iconImage.image = image;
    
}
/**
 *  跳转到相机
 */
- (IBAction)cameraBtn:(UIButton *)sender {
//    //创建UIImagePickerController
//    UIImagePickerController *camareController = [[UIImagePickerController alloc]init];
//    //获取照片的方式
//    camareController.sourceType = UIImagePickerControllerSourceTypeCamera;
//    //设置代理
//    camareController.delegate = self;
//    
//    [self presentViewController:camareController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
