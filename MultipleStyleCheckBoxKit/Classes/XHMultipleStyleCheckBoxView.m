//
//  XHMultipleStyleCheckBoxView.m
//  MultipleStyleCheckBoxKit
//
//  Created by qtone-1 on 14-5-6.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHMultipleStyleCheckBoxView.h"

#import "NSString+XHTextSize.h"

#define kXHDefaultCheckBoxPhotoItemSize 60
#define kXHDefaultCheckBoxTextInsets 5
#define kXHDefaultCheckBoxButtonHeight 40

@interface XHMultipleStyleCheckBoxView ()

@property (nonatomic, weak) UIButton *checkBoxButton;

@property (nonatomic, weak) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation XHMultipleStyleCheckBoxView

#pragma mark - Action

- (void)checkBoxButtonClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
}

#pragma mark - Propertys

- (void)setCheckedNormalImage:(UIImage *)checkedNormalImage {
    _checkedNormalImage = checkedNormalImage;
    [self.checkBoxButton setImage:checkedNormalImage forState:UIControlStateNormal];
}

- (void)setCheckedSelectedImage:(UIImage *)checkedSelectedImage {
    _checkedSelectedImage = checkedSelectedImage;
    [self.checkBoxButton setImage:checkedSelectedImage forState:UIControlStateSelected];
}

#pragma mark - Lefy cycle

- (void)setup {
    // Default setup
    self.checkedNormalImage = [UIImage imageNamed:@"unchecked_checkbox"];
    self.checkedSelectedImage = [UIImage imageNamed:@"checked_checkbox"];
    
    
    if (!_checkBoxButton) {
        UIButton *checkBoxButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [checkBoxButton setTitleColor:[UIColor colorWithWhite:0.341 alpha:1.000] forState:UIControlStateNormal];
        checkBoxButton.titleLabel.numberOfLines = 0;
        checkBoxButton.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [checkBoxButton addTarget:self action:@selector(checkBoxButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:checkBoxButton];
        self.checkBoxButton = checkBoxButton;
    }
    
    if (!_activityIndicatorView) {
        UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        activityIndicatorView.hidesWhenStopped = YES;
        [self addSubview:activityIndicatorView];
        self.activityIndicatorView = activityIndicatorView;
    }
}

- (void)awakeFromNib {
    [self setup];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Public api

- (void)setCheckBox:(XHCheckBox *)checkBox {
    _checkBox = checkBox;
    [self layoutSubviews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    XHCheckBoxStyle currentStyle = self.checkBox.checkBoxStyle;
    UIEdgeInsets checkBoxButtonImageEdgeInsets;
    switch (currentStyle) {
        case kXHCheckBoxLocalPhotoStyle:
        case kXHCheckBoxNetworkPhotoStyle:{
            checkBoxButtonImageEdgeInsets = UIEdgeInsetsMake(kXHDefaultCheckBoxPhotoItemSize - self.checkedNormalImage.size.height - kXHDefaultCheckBoxTextInsets, kXHDefaultCheckBoxPhotoItemSize - self.checkedNormalImage.size.width - kXHDefaultCheckBoxTextInsets, 0, 0);
            
            self.checkBoxButton.frame = CGRectMake(0, 0, kXHDefaultCheckBoxPhotoItemSize, kXHDefaultCheckBoxPhotoItemSize);
            UIImage *backgroundImage = self.checkBox.localPhoto;
            if (currentStyle == kXHCheckBoxNetworkPhotoStyle) {
                self.activityIndicatorView.center = CGPointMake(kXHDefaultCheckBoxPhotoItemSize / 2.0, kXHDefaultCheckBoxPhotoItemSize / 2.0);
                [self.activityIndicatorView startAnimating];
                
                __weak typeof(self) weakSelf = self;
                NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.checkBox.photoUrlString]];
                [NSURLConnection sendAsynchronousRequest:request
                                                   queue:[NSOperationQueue mainQueue]
                                       completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                                           UIImage *networkImage = [UIImage imageWithData:data];
                                           [weakSelf.activityIndicatorView stopAnimating];
                                           [weakSelf.checkBoxButton setBackgroundImage:networkImage forState:UIControlStateNormal];
                                       }];
                backgroundImage = self.checkBox.placeholderImage;
            }
            [self.checkBoxButton setBackgroundImage:backgroundImage forState:UIControlStateNormal];
            
            break;
        }
        case kXHCheckBoxTextStyle: {
            checkBoxButtonImageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, self.checkedNormalImage.size.width + kXHDefaultCheckBoxTextInsets * 2);
            CGSize textSize = [NSString getSizeWithString:self.checkBox.text font:self.checkBoxButton.titleLabel.font contentWidth:CGRectGetWidth(self.bounds)  contentHight:0];
            self.checkBoxButton.frame = CGRectMake(0, 0, textSize.width + self.checkedNormalImage.size.width + kXHDefaultCheckBoxTextInsets * 3, (textSize.height > self.checkedNormalImage.size.height ? textSize.height : self.checkedNormalImage.size.height));
            [self.checkBoxButton setTitle:self.checkBox.text forState:UIControlStateNormal];
            break;
        }
        default:
            break;
    }
    [self.checkBoxButton setImageEdgeInsets:checkBoxButtonImageEdgeInsets];
    [self.checkBoxButton setImage:self.checkedNormalImage forState:UIControlStateNormal];
    [self.checkBoxButton setImage:self.checkedSelectedImage forState:UIControlStateSelected];
    CGRect frame = self.frame;
    frame.size = self.checkBoxButton.frame.size;
    self.frame = frame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
