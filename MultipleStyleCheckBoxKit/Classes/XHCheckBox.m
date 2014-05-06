//
//  XHCheckBox.m
//  MultipleStyleCheckBoxKit
//
//  Created by qtone-1 on 14-5-6.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
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
