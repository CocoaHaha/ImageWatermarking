//
//  ViewController.m
//  图片加水印
//
//  Created by CocoaSXF on 2018/7/10.
//  Copyright © 2018年 CocoHaHa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.加载图片
    UIImage *image = [UIImage imageNamed:@"233.jpg"];
    //2.开启一个和图片一样大小的上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //3.把图片绘制到上下文当中
    [image drawAtPoint:CGPointZero];
    //4.把文字绘制到上下文当中
    NSString *str =@"小小俊杰";
    NSMutableDictionary *dict =[NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    dict[NSStrokeColorAttributeName] =[UIColor greenColor];
    dict[NSStrokeWidthAttributeName] = @2;
    //设置阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor blueColor];
    //设置阴影的偏移量
    shadow.shadowOffset = CGSizeMake(10, 10);
    shadow.shadowBlurRadius =2;
    dict[NSShadowAttributeName] = shadow;
    [str drawAtPoint:CGPointMake(10, 20) withAttributes:dict];
    //5.从上下文当中生成一张新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //6.关闭上下文
    UIGraphicsEndImageContext();
    self.imageV.image = newImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
