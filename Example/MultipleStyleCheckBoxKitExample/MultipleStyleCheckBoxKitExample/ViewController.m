//
//  ViewController.m
//  MultipleStyleCheckBoxKitExample
//
//  Created by qtone-1 on 14-5-6.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "ViewController.h"

#import <MultipleStyleCheckBoxKit/XHMultipleStyleCheckBoxView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    self.title = @"多样式复选框";
    
    XHCheckBox *textCheckBox = [[XHCheckBox alloc] initWithText:@"这里是测试勾选的的"];
    XHMultipleStyleCheckBoxView *textCheckBoxView = [[XHMultipleStyleCheckBoxView alloc] initWithFrame:CGRectMake(30, 100, 200, 100)];
    textCheckBoxView.checkBox = textCheckBox;
    [self.view addSubview:textCheckBoxView];
    
    CGRect multipleLineTextCheckBoxViewFrame = textCheckBoxView.frame;
    multipleLineTextCheckBoxViewFrame.origin.y += CGRectGetHeight(multipleLineTextCheckBoxViewFrame) * 2;
    XHCheckBox *multipleLineTextCheckBox = [[XHCheckBox alloc] initWithText:@"这里是测试勾选的的,为什么需要多行呢？因为我想要做大题app，哈哈！"];
    XHMultipleStyleCheckBoxView *multipleLineTextCheckBoxView = [[XHMultipleStyleCheckBoxView alloc] initWithFrame:multipleLineTextCheckBoxViewFrame];
    multipleLineTextCheckBoxView.checkBox = multipleLineTextCheckBox;
    [self.view addSubview:multipleLineTextCheckBoxView];
    
    CGRect localPhotoCheckBoxViewFrame = multipleLineTextCheckBoxView.frame;
    localPhotoCheckBoxViewFrame.origin.y += CGRectGetHeight(localPhotoCheckBoxViewFrame);
    XHCheckBox *localPhotoCheckBox = [[XHCheckBox alloc] initWithLocalPhoto:[UIImage imageNamed:@"meIcon"]];
    XHMultipleStyleCheckBoxView *localPhotoCheckBoxView = [[XHMultipleStyleCheckBoxView alloc] initWithFrame:localPhotoCheckBoxViewFrame];
    localPhotoCheckBoxView.checkBox = localPhotoCheckBox;
    [self.view addSubview:localPhotoCheckBoxView];
    
    CGRect networkPhotoCheckBoxViewFrame = localPhotoCheckBoxView.frame;
    networkPhotoCheckBoxViewFrame.origin.y += CGRectGetHeight(networkPhotoCheckBoxViewFrame) * 2;
    XHCheckBox *networkPhotoCheckBox = [[XHCheckBox alloc] initWithNetworkPhotoUrlString:@"http://h.hiphotos.baidu.com/image/pic/item/0e2442a7d933c8958e88240cd31373f0830200d6.jpg" placeholderImage:[UIImage imageNamed:@"meIcon"]];
    XHMultipleStyleCheckBoxView *networkPhotoCheckBoxView = [[XHMultipleStyleCheckBoxView alloc] initWithFrame:networkPhotoCheckBoxViewFrame];
    networkPhotoCheckBoxView.checkBox = networkPhotoCheckBox;
    [self.view addSubview:networkPhotoCheckBoxView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
