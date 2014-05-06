//
//  NSString+XHTextSize.m
//  MultipleStyleCheckBoxKit
//
//  Created by qtone-1 on 14-5-6.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "NSString+XHTextSize.h"

@implementation NSString (XHTextSize)

+ (CGSize)getSizeWithString:(NSString *)string font:(UIFont *)font contentWidth:(CGFloat)width contentHight:(CGFloat)height {
    CGSize labelSize = CGSizeZero;
    if (IOS7_OR_ABOVE) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        labelSize = [string boundingRectWithSize:CGSizeMake((width ? width : MAXFLOAT), (height ? height : MAXFLOAT)) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        labelSize.height = ceil(labelSize.height);
        labelSize.width = ceil(labelSize.width);
    } else {
        labelSize = [string sizeWithFont:font constrainedToSize:CGSizeMake((width ? width : MAXFLOAT), (height ? height : MAXFLOAT)) lineBreakMode:NSLineBreakByCharWrapping];
    }
    return labelSize;
}

@end
