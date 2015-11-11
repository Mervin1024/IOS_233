//
//  BlogModelManager.m
//  MVC_MVVM
//
//  Created by sh219 on 15/11/10.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import "BlogModelManager.h"

@interface BlogModelManager (){
    
}

@end

static BlogModelManager *manager;
static ASIDownloadCache *myCache;
@implementation BlogModelManager
@synthesize blogs;
- (instancetype)init{
    if ((self = [super init])) {
        blogs = [NSMutableArray array];
        [self requestBlogs];
        ASIDownloadCache *cache = [[ASIDownloadCache alloc] init];
        myCache = cache;
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [paths objectAtIndex:0];
        [myCache setStoragePath:[documentDirectory stringByAppendingPathComponent:@"resource"]];
        [myCache setDefaultCachePolicy:ASIOnlyLoadIfNotCachedCachePolicy];
    }
    return self;
}

+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BlogModelManager alloc] init];
    });
    return manager;
}

- (void)requestBlogs{
//    [self requestBlogsWithCategroy:BlogCategroyNameUi];
//    [self requestBlogsWithCategroy:BlogCategroyNameNetWork];
//    [self requestBlogsWithCategroy:BlogCategroyNameTool];
//    [self requestBlogsWithCategroy:BlogCategroyNameAutolayout];
}

- (void)requestBlogsWithCategroy:(BlogCategroyName)categroy page:(NSInteger)pages{
    [SVProgressHUD show];
    NSString *urlStr = [NSString stringWithFormat:@"http://www.ios122.com/find_php/index.php?viewController=YFPostListViewController&model[category]=%@&model[page]=%d",[self categroyNameWithCategroy:categroy],pages];
    NSURL *url = [NSURL URLWithString:urlStr];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDownloadCache:myCache];
    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    __weak ASIHTTPRequest *temp = request;
    [request setCompletionBlock:^{
        if (temp.responseData) {
            [SVProgressHUD dismiss];
            NSArray *response = [NSJSONSerialization JSONObjectWithData:temp.responseData options:kNilOptions error:nil];
            NSArray *array = [BlogModel mj_objectArrayWithKeyValuesArray:response];
            [self addBlogsFromArray:array];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_OF_CATEGROY(categroy) object:nil];
        }
    }];
    [request setFailedBlock:^{
        if (temp.error) {
            if (temp.error.code == 1) {
                [SVProgressHUD showErrorWithStatus:@"网络异常"];
            }
        }
    }];
    [request startAsynchronous];
}

- (void)addBlogsFromArray:(NSArray *)array{
    [blogs addObjectsFromArray:array];
}

- (NSArray *)arrayForCategroyName:(BlogCategroyName)blogCategroy page:(NSInteger)pages{
    NSMutableArray *data = [NSMutableArray array];
    NSMutableArray *categroy = [NSMutableArray array];
    if (BlogCategroyNameAll == blogCategroy) {
        categroy = blogs;
    }else{
        for (BlogModel *model in blogs) {
            if (model.categroy == blogCategroy) {
                [categroy addObject:model];
            }
        }
    }
    if ([categroy count] <= pages * 20) {
        [self requestBlogsWithCategroy:blogCategroy page:pages];
    }
    if (pages == 0) {
        [data addObjectsFromArray:categroy];
    }
    
    return data;
}

- (BlogModel *)blogForBlogId:(NSString *)blogId{
    for (BlogModel *model in blogs) {
        if ([model.id isEqualToString:blogId]) {
            return model;
        }
    }
    return nil;
}

- (NSString *)categroyNameWithCategroy:(BlogCategroyName)categroy{
    switch (categroy) {
        case BlogCategroyNameUi:
            return @"ui";
            break;
        case BlogCategroyNameNetWork:
            return @"network";
            break;
        case BlogCategroyNameTool:
            return @"tool";
            break;
        case BlogCategroyNameAutolayout:
            return @"autolayout";
            break;
        default:
            return nil;
            break;
    }
}

@end

@implementation BlogModel

- (BlogCategroyName)categroy{
    NSString *a = [self.id substringToIndex:1];
    if ([a isEqualToString:@"u"]) {
        return BlogCategroyNameUi;
    }else if ([a isEqualToString:@"n"]){
        return BlogCategroyNameNetWork;
    }else if ([a isEqualToString:@"t"]){
        return BlogCategroyNameTool;
    }else if ([a isEqualToString:@"a"]){
        return BlogCategroyNameAutolayout;
    }else{
        NSLog(@"BlogCategroyName ERROR : %@",self.id);
        return nil;
    }
}

@end