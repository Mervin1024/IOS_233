//
//  BlogDetailViewController.m
//  MVC_MVVM
//
//  Created by sh219 on 15/11/11.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import "BlogDetailViewController.h"

@interface BlogDetailViewController ()

@end

@implementation BlogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self backNavigationBarItemWithText:nil font:nil images:@[[UIImage imageNamed:@"btn_back_normal"],[UIImage imageNamed:@"btn_back_pressed"]] target:self action:@selector(gotoBack:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gotoBack:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
