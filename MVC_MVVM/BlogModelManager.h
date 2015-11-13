//
//  BlogModelManager.h
//  MVC_MVVM
//
//  Created by sh219 on 15/11/10.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <AFNetworking.h>
#import <ASIHTTPRequest.h>
#import <MJExtension.h>
#import <SVProgressHUD.h>
#import <ASIDownloadCache.h>
#import "categroies.h"

#define NOTIFICATION_OF_CATEGROY(INDEX) [NSString stringWithFormat:@"%ld BLOG DID FINISH",INDEX]
#define NOTIFICATION_OF_DETAIL @"NotificationOfBlogDetail"
#define NO_MORE_BLOGDATA(INDEX) [NSString stringWithFormat:@"No More %ld Blog Data",INDEX]
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

@class BlogDetail;
@interface BlogModel : NSObject{
    BlogDetail *blogDetail;
}

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) BlogCategroyName categroy;
@property (nonatomic, strong) BlogDetail *blogDetail;
@end

@interface BlogDetail : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
