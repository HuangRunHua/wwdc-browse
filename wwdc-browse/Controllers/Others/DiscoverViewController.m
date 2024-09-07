//
//  DiscoverViewController.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/6.
//

#import "DiscoverViewController.h"

@implementation DiscoverViewController

- (void)loadView
{
    self.title = @"Discover";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
