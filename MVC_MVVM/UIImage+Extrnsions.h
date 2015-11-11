//
//  UIImage+Extrnsions.h
//  MVC_MVVM
//
//  Created by sh219 on 15/11/11.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extrnsions)
- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
@end
