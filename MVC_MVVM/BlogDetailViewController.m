//
//  BlogDetailViewController.m
//  MVC_MVVM
//
//  Created by sh219 on 15/11/11.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import "BlogDetailViewController.h"

@interface BlogDetailViewController (){
    BOOL hide;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIWebView *bodyView;

@end

@implementation BlogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    hide = NO;
    [self backNavigationBarItemWithText:nil font:nil images:@[[UIImage imageNamed:@"btn_back_normal"],[UIImage imageNamed:@"btn_back_pressed"]] target:self action:@selector(gotoBack:)];
    [self rightNavigationBarItemWithText:@"hide" font:nil images:nil target:self action:@selector(hideBody:)];
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

- (void)hideBody:(UIButton *)sender{
    if (!hide) {
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.bodyView.frame;
            frame.size.height = 0;
            self.bodyView.frame = frame;
        } completion:^(BOOL finished) {
            if (finished) {
                hide = YES;
                [sender setTitle:@"show" forState:UIControlStateNormal];
            }
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.bodyView.frame;
            frame.size.height = [UIScreen mainScreen].bounds.size.height - 64 - 84;
            self.bodyView.frame = frame;
        } completion:^(BOOL finished) {
            if (finished) {
                hide = NO;
                [sender setTitle:@"hide" forState:UIControlStateNormal];
            }
        }];
    }
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
