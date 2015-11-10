//
//  MainViewController.h
//  MVC_MVVM
//
//  Created by sh219 on 15/11/10.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TabBarIndex) {
    TabBarIndexUi = 0,
    TabBarIndexNetwork,
    TabBarIndexTool,
    TabBarIndexAutolayout,
    TabBarIndexAll
};

@interface MainViewController : UITabBarController

@end
