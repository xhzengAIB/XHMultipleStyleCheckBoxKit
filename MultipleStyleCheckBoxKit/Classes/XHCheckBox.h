//
//  XHCheckBox.h
//  MultipleStyleCheckBoxKit
//
//  Created by qtone-1 on 14-5-6.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XHCheckBoxStyle) {
    kXHCheckBoxLocalPhotoStyle = 0,
    kXHCheckBoxNetworkPhotoStyle,
    kXHCheckBoxTextStyle,
};

@interface XHCheckBox : NSObject

@property (nonatomic, assign) XHCheckBoxStyle checkBoxStyle;

// text
@property (nonatomic, copy) NSString *text;

// network photo
@property (nonatomic, copy) NSString *photoUrlString;
@property (nonatomic, strong) UIImage *placeholderImage;

// local photo
@property (nonatomic, strong) UIImage *localPhoto;

- (instancetype)initWithLocalPhoto:(UIImage *)localPhoto;

- (instancetype)initWithNetworkPhotoUrlString:(NSString *)networkPhotoUrlString
             placeholderImage:(UIImage *)placeholderImage;

- (instancetype)initWithText:(NSString *)text;

@end
