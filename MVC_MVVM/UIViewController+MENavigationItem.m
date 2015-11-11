//
//  UIViewController+MENavigationItem.m
//  MVC_MVVM
//
//  Created by sh219 on 15/11/11.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import "UIViewController+MENavigationItem.h"

@implementation UIViewController (MENavigationItem)

- (UIButton *)backNavigationBarItemWithText:(NSString *)text font:(UIFont *)font images:(NSArray *)images target:(id)target action:(SEL)selector{
    UIButton *buttonLeftBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonLeftBarItem.backgroundColor = [UIColor clearColor];
    if (text && ![text isEqualToString:@""]) {
        [buttonLeftBarItem setTitle:text forState:UIControlStateNormal];
        CGFloat yOffset = 0.0f;
        if (font) {
            buttonLeftBarItem.titleLabel.font = font;
            yOffset = 0.0f;
        }else{
            buttonLeftBarItem.titleLabel.font = [UIFont systemFontOfSize:15];
            yOffset = 3.0f;
        }
        buttonLeftBarItem.titleLabel.textAlignment = NSTextAlignmentLeft;
        [buttonLeftBarItem setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        CGSize sizeText = [self sizeOfString:text font:buttonLeftBarItem.titleLabel.font sizeConstrained:CGSizeMake(80, 30)];
        buttonLeftBarItem.frame = CGRectMake(0, yOffset, sizeText.width+10, 40);
    }
    if ([images isKindOfClass:[NSArray class]]) {
        UIImage *imageNormal = images.count > 0 ? [images objectAtIndex:0] : nil;
        UIImage *imageHighLight = images.count > 1 ? [images objectAtIndex:1] : nil;
        [buttonLeftBarItem setImage:imageNormal forState:UIControlStateNormal];
        [buttonLeftBarItem setImage:imageHighLight forState:UIControlStateHighlighted];
        [buttonLeftBarItem setImage:imageHighLight forState:UIControlStateSelected];
        buttonLeftBarItem.frame = CGRectMake(0, 0, 40, 40);
        buttonLeftBarItem.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    }
    [buttonLeftBarItem addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:buttonLeftBarItem];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    return buttonLeftBarItem;
}

- (UIButton *)rightNavigationBarItemWithText:(NSString *)text font:(UIFont *)font images:(NSArray *)images target:(id)target action:(SEL)selector{
    UIButton *buttonrightBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonrightBarItem.backgroundColor = [UIColor clearColor];
    if (text && ![text isEqualToString:@""]) {
        [buttonrightBarItem setTitle:text forState:UIControlStateNormal];
        CGFloat yOffset = 0.0f;
        if (font) {
            buttonrightBarItem.titleLabel.font = font;
            yOffset = 0.0f;
        }else{
            buttonrightBarItem.titleLabel.font = [UIFont systemFontOfSize:15];
            yOffset = 3.0f;
        }
        buttonrightBarItem.titleLabel.textAlignment = NSTextAlignmentRight;
        [buttonrightBarItem setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        CGSize sizeText = [self sizeOfString:text font:buttonrightBarItem.titleLabel.font sizeConstrained:CGSizeMake(80, 30)];
        buttonrightBarItem.frame = CGRectMake(0, yOffset, sizeText.width+10, 40);
    }
    if ([images isKindOfClass:[NSArray class]]) {
        UIImage *imageNormal = images.count > 0 ? [images objectAtIndex:0] : nil;
        UIImage *imageHighLight = images.count > 1 ? [images objectAtIndex:1] : nil;
        [buttonrightBarItem setImage:imageNormal forState:UIControlStateNormal];
        [buttonrightBarItem setImage:imageHighLight forState:UIControlStateHighlighted];
        [buttonrightBarItem setImage:imageHighLight forState:UIControlStateSelected];
        buttonrightBarItem.frame = CGRectMake(0, 0, 40, 40);
        buttonrightBarItem.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    }
    [buttonrightBarItem addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:buttonrightBarItem];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    return buttonrightBarItem;
}

- (CGSize)sizeOfString:(NSString *)string font:(UIFont *)font sizeConstrained:(CGSize)size{
//    if (!string) {
//        string = @"";
//    }
    CGSize sizeOfString = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
    return sizeOfString;
    
}

@end
