//
//  BlogModelManager.h
//  MVC_MVVM
//
//  Created by sh219 on 15/11/10.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <MBProgressHUD.h>
#import <MJExtension.h>

#define NOTIFICATION_OF_CATEGROY(INDEX) [NSString stringWithFormat:@"%ld BLOG DID FINISH",INDEX]

typedef NS_ENUM(NSInteger, BlogCategroyName) {
    BlogCategroyNameUi = 0,
    BlogCategroyNameNetWork,
    BlogCategroyNameTool,
    BlogCategroyNameAutolayout,
    BlogCategroyNameAll
};
@class BlogModel;
@interface BlogModelManager : NSObject
+ (instancetype)shareManager;

@property (nonatomic, copy) NSMutableArray *blogs;

- (NSArray *)arrayForCategroyName:(BlogCategroyName)blogCategroy page:(NSInteger)pages;
- (BlogModel *)blogForBlogId:(NSString *)blogId;
@end

@interface BlogModel : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) BlogCategroyName categroy;
@end
