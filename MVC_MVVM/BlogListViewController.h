//
//  ViewController.h
//  MVC_MVVM
//
//  Created by sh219 on 15/11/10.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogModelManager.h"

@interface BlogListViewCell : UITableViewCell

@end

@interface BlogListViewController : UIViewController

@property (nonatomic, assign) BlogCategroyName blogCategroy;
@end

