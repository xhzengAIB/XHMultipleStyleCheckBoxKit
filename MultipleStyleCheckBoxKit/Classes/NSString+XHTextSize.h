//
//  NSString+XHTextSize.h
//  MultipleStyleCheckBoxKit
//
//  Created by qtone-1 on 14-5-6.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define IOS7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] intValue] >= 7) ? YES : NO)

@interface NSString (XHTextSize)

+ (CGSize)getSizeWithString:(NSString *)string font:(UIFont *)font contentWidth:(CGFloat)width contentHight:(CGFloat)height;

@end
