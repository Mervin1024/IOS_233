//
//  BlogDetailViewController.m
//  MVC_MVVM
//
//  Created by sh219 on 15/11/11.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import "BlogDetailViewController.h"

@interface BlogDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIWebView *bodyView;

@end

@implementation BlogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self backNavigationBarItemWithText:nil font:nil images:@[[UIImage imageNamed:@"btn_back_normal"],[UIImage imageNamed:@"btn_back_pressed"]] target:self action:@selector(gotoBack:)];
    self.bodyView.alpha = 0.8;
    self.bodyView.scalesPageToFit = NO;
    [self updateView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:NOTIFICATION_OF_DETAIL object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)gotoBack:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateView{
    self.title = self.blog.title;
    self.titleLable.text = self.blog.blogDetail.title;
    [self.bodyView loadHTMLString:self.blog.blogDetail.body baseURL:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
