//
//  BlogDetailViewController.h
//  MVC_MVVM
//
//  Created by sh219 on 15/11/11.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogModelManager.h"

@interface BlogDetailViewController : UIViewController

@property (nonatomic, strong) BlogModel *blog;
@end
