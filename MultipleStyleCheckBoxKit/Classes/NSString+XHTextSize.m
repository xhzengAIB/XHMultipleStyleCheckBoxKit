//
//  NSString+XHTextSize.m
//  MultipleStyleCheckBoxKit
//
//  Created by qtone-1 on 14-5-6.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
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
