//
//  MainViewController.m
//  MVC_MVVM
//
//  Created by sh219 on 15/11/10.
//  Copyright © 2015年 sh219. All rights reserved.
//

#import "MainViewController.h"
#import "BlogListViewController.h"
#import "categroies.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTabBarItems];
    [self setTabBarBackImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTabBarItems{
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.viewControllers];
    viewControllers = [NSMutableArray arrayWithCapacity:4];
    
    CGFloat scale = 7.5f;
    
    UITabBarItem *item0 = [[UITabBarItem alloc] initWithTitle:@"ui" image:nil tag:TabBarIndexUi];
    UIImage *image0 = [[UIImage imageWithCGImage:[UIImage imageNamed:@"66b173132145d879f919b82b"].CGImage scale:scale orientation:UIImageOrientationUp] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.image = image0;
    
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"network" image:nil tag:TabBarIndexNetwork];
    UIImage *image1 = [[UIImage imageWithCGImage:[UIImage imageNamed:@"41"].CGImage scale:scale orientation:UIImageOrientationUp] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = image1;
    
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"tool" image:nil tag:TabBarIndexTool];
    UIImage *image2 = [[UIImage imageWithCGImage:[UIImage imageNamed:@"e5a224dd7031d3155882dd7d"].CGImage scale:scale orientation:UIImageOrientationUp] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = image2;
    
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"autolayout" image:nil tag:TabBarIndexAutolayout];
    UIImage *image3 = [[UIImage imageWithCGImage:[UIImage imageNamed:@"101"].CGImage scale:scale orientation:UIImageOrientationUp] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = image3;
    
    NSArray *items = @[item0,item1,item2,item3];
    
    for (int i = 0; i < TabBarIndexAll; i++) {
        UINavigationController *navigationController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BlogViewNavigationController"];
        BlogListViewController *controller = (BlogListViewController *)navigationController.topViewController;
        controller.blogCategroy = i;
        navigationController.tabBarItem = [items objectAtIndex:i];
        [viewControllers addObject:navigationController];
        
        [[items objectAtIndex:i] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
        [[items objectAtIndex:i] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]} forState:UIControlStateSelected];
    }
    
    [self setViewControllers:viewControllers animated:YES];
}

- (void)setTabBarBackImage{
    UIImage *image = [UIImage imageNamed:@"38080519_p0"];
    CGFloat scale = self.tabBar.frame.origin.y/[UIScreen mainScreen].bounds.size.height;
    UIImage *scaleImage = [image imageAtRect:CGRectMake(0, scale * image.size.height, image.size.width, (1 - scale) * image.size.height)];
    UIImage *newImage = [scaleImage imageByScalingProportionallyToSize:self.tabBar.bounds.size];
    self.tabBar.backgroundImage = newImage;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.tabBar.bounds];
    imageView.image = [UIImage imageNamed:@"blank"];
    imageView.userInteractionEnabled = YES;
    [self.tabBar insertSubview:imageView atIndex:0];
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
