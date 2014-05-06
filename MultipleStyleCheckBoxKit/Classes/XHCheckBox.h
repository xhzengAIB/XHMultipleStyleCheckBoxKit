//
//  XHCheckBox.h
//  MultipleStyleCheckBoxKit
//
//  Created by qtone-1 on 14-5-6.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
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
