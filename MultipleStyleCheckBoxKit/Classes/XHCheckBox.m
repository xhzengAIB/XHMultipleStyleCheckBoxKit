//
//  XHCheckBox.m
//  MultipleStyleCheckBoxKit
//
//  Created by qtone-1 on 14-5-6.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHCheckBox.h"

@implementation XHCheckBox

- (instancetype)initWithLocalPhoto:(UIImage *)localPhoto {
    self = [super init];
    if (self) {
        self.checkBoxStyle = kXHCheckBoxLocalPhotoStyle;
        self.localPhoto = localPhoto;
    }
    return self;
}

- (instancetype)initWithNetworkPhotoUrlString:(NSString *)networkPhotoUrlString
                             placeholderImage:(UIImage *)placeholderImage {
    self = [super init];
    if (self) {
        self.checkBoxStyle = kXHCheckBoxNetworkPhotoStyle;
        self.photoUrlString = networkPhotoUrlString;
        self.placeholderImage = placeholderImage;
    }
    return self;
}

- (instancetype)initWithText:(NSString *)text {
    self = [super init];
    if (self) {
        self.checkBoxStyle = kXHCheckBoxTextStyle;
        self.text = text;
    }
    return self;
}

@end
