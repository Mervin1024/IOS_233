//
//  ViewController.m
//  MVC_MVVM
//
//  Created by sh219 on 15/11/10.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import "BlogListViewController.h"

@interface BlogListViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *tableData;
    BlogModelManager *manager;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BlogListViewController
@synthesize blogCategroy;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle];
    tableData = [NSMutableArray array];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateData];
}

- (void)updateData{
//    [tableData addObjectsFromArray:[manager arrayForCategroyName:blogCategroy page:0]];
    tableData = [NSMutableArray arrayWithArray:[manager arrayForCategroyName:blogCategroy page:0]];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlogListCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"BlogListCell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    BlogModel *blog = [tableData objectAtIndex:indexPath.row];
    cell.textLabel.text = blog.title;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.text = blog.desc;
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 69;
}

@end
