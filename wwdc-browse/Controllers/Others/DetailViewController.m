//
//  DetailViewController.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import "DetailViewController.h"
#import <Masonry/Masonry.h>

#define EDGE_DEFAULT_PADDING 14

@interface DetailViewController ()
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UILabel *noContentTitleLabel;
@property (nonatomic, strong) UILabel *noContentSubtitleLabel;
@end

@implementation DetailViewController

- (void)loadView
{
    [super loadView];
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadBackgroundView];
    [self loadNoContentTitleLabel];
    [self loadNoContentSubtitleLabel];
}

- (void)loadBackgroundView
{
    self.backgroundView = [[UIView alloc] init];
    [self.view addSubview:self.backgroundView];
    [_noContentTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(EDGE_DEFAULT_PADDING);
        make.right.equalTo(self.view).with.offset(-EDGE_DEFAULT_PADDING);
    }];
}

- (void)loadNoContentTitleLabel
{
    _noContentTitleLabel = [[UILabel alloc] init];
    _noContentTitleLabel.text = @"No Content";
    _noContentTitleLabel.font = [UIFont boldSystemFontOfSize:25];
    _noContentTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.backgroundView addSubview:_noContentTitleLabel];
    [_noContentTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backgroundView).with.offset(EDGE_DEFAULT_PADDING);
        make.left.equalTo(self.backgroundView).with.offset(EDGE_DEFAULT_PADDING);
        make.right.equalTo(self.backgroundView).with.offset(-EDGE_DEFAULT_PADDING);
    }];
}

- (void)loadNoContentSubtitleLabel
{
    _noContentSubtitleLabel = [[UILabel alloc] init];
    _noContentSubtitleLabel.text = @"Oops, this function has not been completed yet.";
    _noContentTitleLabel.textAlignment = NSTextAlignmentCenter;
    _noContentSubtitleLabel.font = [UIFont systemFontOfSize:17];
    _noContentSubtitleLabel.textColor = [UIColor grayColor];
    [self.backgroundView addSubview:_noContentSubtitleLabel];
    [_noContentSubtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.noContentTitleLabel.mas_bottom).with.offset(5);
        make.left.equalTo(self.backgroundView).with.offset(EDGE_DEFAULT_PADDING);
        make.right.equalTo(self.backgroundView).with.offset(-EDGE_DEFAULT_PADDING);
    }];
    
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.noContentSubtitleLabel.mas_bottom).with.offset(EDGE_DEFAULT_PADDING);
        make.center.equalTo(self.view);
    }];
}

@end
