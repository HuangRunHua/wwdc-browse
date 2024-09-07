//
//  BrowseViewController.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import "BrowseViewController.h"
#import "WWDCCategory.h"

@interface BrowseViewController ()

@end

@implementation BrowseViewController

- (void)loadView
{
    self.title = @"Browse";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
