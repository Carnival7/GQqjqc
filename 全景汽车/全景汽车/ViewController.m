//
//  ViewController.m
//  全景汽车
//
//  Created by apple on 15/4/26.
//  Copyright (c) 2015年 七. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *carImage;

// 定义变量记录索引
@property (nonatomic, assign)NSInteger index;
// 记录上一次的位置
@property (nonatomic, assign)CGPoint previousLocation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = 0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 获取手指
    UITouch *touch = [touches anyObject];
    // 获取手指触摸位置
    CGPoint point = [touch locationInView:touch.view];
    // 记录当前触摸位置
    self.previousLocation = point;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:touch.view];
    // 用当前位置和上次位置作比较
    if (currentPoint.x > self.previousLocation.x) {
        // 右
        self.index -= 1;
    }else{
        // 左
        self.index += 1;
    }
    
    
    // 处理越界
    if (self.index <= 0) {
        self.index = 36;
    }else if (self.index > 36){
        self.index = 1;
    }
    NSLog(@"%tu", self.index);
    
    // 根据索引生成图片
    NSString *imageName = [NSString stringWithFormat:@"img_360car_black_%02tu", self.index];
    
    // 替换图片
    self.carImage.image = [UIImage imageNamed:imageName];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
