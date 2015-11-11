//
//  UIViewController+MENavigationItem.h
//  MVC_MVVM
//
//  Created by sh219 on 15/11/11.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MENavigationItem)

- (UIButton *)backNavigationBarItemWithText:(NSString *)text font:(UIFont *)font images:(NSArray *)images target:(id)target action:(SEL)selector;
- (UIButton *)rightNavigationBarItemWithText:(NSString *)text font:(UIFont *)font images:(NSArray *)images target:(id)target action:(SEL)selector;

@end
