//
//  ViewController.m
//  长按图片抖动
//
//  Created by 章芝源 on 16/1/10.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //setup UI
    [self setupUI];
}

- (void)setupUI
{
    //设置UI
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.image = [UIImage imageNamed:@"普京"];
    imageview.frame = CGRectMake(100, 100, 200, 200);
    imageview.userInteractionEnabled = YES;
    self.imageView = imageview;
    [self.view addSubview:imageview];
    
    //添加手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    [self.imageView addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer *)longPresss
{
    if (longPresss.state == UIGestureRecognizerStateBegan) {
        //设置动画  keyframe
        CAKeyframeAnimation *keyAnim = [[CAKeyframeAnimation alloc]init];
        keyAnim.keyPath = @"transform.rotation";
        keyAnim.values = @[@(-5 / 180.0 * M_PI), @(5 / 180.0 * M_PI)];
        keyAnim.duration = 0.1;
        keyAnim.repeatCount = MAXFLOAT;
        //自动翻转动画
        keyAnim.autoreverses = YES;
        
        [self.imageView.layer addAnimation:keyAnim forKey:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
