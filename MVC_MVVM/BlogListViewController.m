//
//  ViewController.m
//  MVC_MVVM
//
//  Created by sh219 on 15/11/10.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import "BlogListViewController.h"
#import "BlogDetailViewController.h"
#import <MJRefresh.h>

@implementation BlogListViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIView *backView = [[UIView alloc] initWithFrame:self.contentView.frame];
        backView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.2];
        [self setSelectedBackgroundView:backView];
    }
    return self;
}

- (instancetype)init{
    self = [self initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"BlogListCell"];
    if (self) {
        
    }
    return self;
}

@end

@interface BlogListViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *tableData;
    BlogModelManager *manager;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) NSInteger page;

@end

@implementation BlogListViewController
@synthesize blogCategroy, page;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle];
    [self setTableViewRefresh];
    tableData = [NSMutableArray array];
    page = 0;
    manager = [BlogModelManager shareManager];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateData) name:NOTIFICATION_OF_CATEGROY(blogCategroy) object:nil];
}

- (void)setTitle{
    switch (blogCategroy) {
        case BlogCategroyNameUi:
            self.title = @"ui";
            break;
        case BlogCategroyNameAutolayout:
            self.title = @"autolayout";
            break;
        case BlogCategroyNameNetWork:
            self.title = @"netWork";
            break;
        case BlogCategroyNameTool:
            self.title = @"tool";
            break;
        default:
            break;
    }
}

- (void)setTableViewRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"refreshing");
        [self.tableView.mj_header performSelector:@selector(endRefreshing) withObject:nil afterDelay:2];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [SVProgressHUD dismiss];
    [self updateData];
}

- (void)updateData{
//    [tableData addObjectsFromArray:[manager arrayForCategroyName:blogCategroy page:0]];
    tableData = [NSMutableArray arrayWithArray:[manager arrayForCategroyName:blogCategroy page:page]];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BlogListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlogListCell"];
    if (cell == nil) {
        cell = [[BlogListViewCell alloc] init];
    }
    BlogModel *blog = [tableData objectAtIndex:indexPath.row];
    cell.textLabel.text = blog.title;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.text = blog.desc;
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
    BlogDetailViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([BlogDetailViewController class])];
    controller.hidesBottomBarWhenPushed = YES;
    controller.blog = [tableData objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
