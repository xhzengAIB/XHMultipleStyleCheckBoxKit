//
//  ViewController.m
//  MultipleStyleCheckBoxKitStoryboardExample
//
//  Created by qtone-1 on 14-5-6.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "ViewController.h"
#import <MultipleStyleCheckBoxKit/XHMultipleStyleCheckBoxView.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XHMultipleStyleCheckBoxView *textCheckBox;

@property (nonatomic, strong) IBOutletCollection(XHMultipleStyleCheckBoxView) NSArray *checkBoxs;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.textCheckBox.checkBox = [[XHCheckBox alloc] initWithText:@"这里测试车市啊开始觉得理解阿里斯顿"];
    for (XHMultipleStyleCheckBoxView *checkBox in self.checkBoxs) {
        checkBox.checkBox = [[XHCheckBox alloc] initWithText:@"我是数组里面的对象哦！哈哈可以这样用的啦！"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
