//
//  BrowseViewController.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import <Masonry/Masonry.h>
#import "BrowseViewController.h"
#import "DetailViewController.h"
#import "BrowseCategoryTableViewCell.h"
#import "WWDCCategory.h"

#define browseKingKongCellReuseIdentifier @"browseKingKongCell"

@interface BrowseViewController ()
@property (nonatomic, strong) NSArray<WWDCCategory *> *kingkongCategory;
@property (nonatomic, strong) NSArray<WWDCCategory *> *topicsCategory;
@property (nonatomic, strong) NSArray<WWDCCategory *> *eventsCategory;

@property (nonatomic, strong) UITableView *browseTableView;
@end

@implementation BrowseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.kingkongCategory = @[
            [[WWDCCategory alloc] initWithIconURL:@"newspaper"
                                            title:@"News"],
            [[WWDCCategory alloc] initWithIconURL:@"bookmark"
                                            title:@"Bookmarks"],
            [[WWDCCategory alloc] initWithIconURL:@"arrow.down.circle" 
                                            title:@"Downloads"],
        ];
        
        self.topicsCategory = @[
            [[WWDCCategory alloc] initWithIconURL:@"person.2"
                                            title:@"Accessibility & Inclusion"],
            [[WWDCCategory alloc] initWithIconURL:@"gear"
                                            title:@"App Services"],
            [[WWDCCategory alloc] initWithIconURL:@"chart.bar.xaxis"
                                            title:@"App Store Distribution & Marketing"],
            [[WWDCCategory alloc] initWithIconURL:@"hifispeaker.fill"
                                            title:@"Audio & Video"],
            [[WWDCCategory alloc] initWithIconURL:@"bag"
                                            title:@"Business & Education"],
            [[WWDCCategory alloc] initWithIconURL:@"paintbrush"
                                            title:@"Design"],
            [[WWDCCategory alloc] initWithIconURL:@"hammer"
                                            title:@"Developer Tools"],
            [[WWDCCategory alloc] initWithIconURL:@"cube"
                                            title:@"Essentials"],
            [[WWDCCategory alloc] initWithIconURL:@"gamecontroller"
                                            title:@"Graphics & Games"],
            [[WWDCCategory alloc] initWithIconURL:@"heart"
                                            title:@"Health & Fitness"],
            [[WWDCCategory alloc] initWithIconURL:@"eye"
                                            title:@"Machine Learning & AI"],
            [[WWDCCategory alloc] initWithIconURL:@"map"
                                            title:@"Maps & Location"],
            [[WWDCCategory alloc] initWithIconURL:@"camera"
                                            title:@"Photos & Camera"],
            [[WWDCCategory alloc] initWithIconURL:@"hand.raised"
                                            title:@"Privacy & Security"],
            [[WWDCCategory alloc] initWithIconURL:@"safari"
                                            title:@"Safari & Web"],
            [[WWDCCategory alloc] initWithIconURL:@"eyeglasses"
                                            title:@"Spatial Computing"],
            [[WWDCCategory alloc] initWithIconURL:@"curlybraces.square"
                                            title:@"Swift"],
            [[WWDCCategory alloc] initWithIconURL:@"square.3.layers.3d.top.filled"
                                            title:@"SwiftUI & UI Frameworks"],
            [[WWDCCategory alloc] initWithIconURL:@"globe.asia.australia"
                                            title:@"System Services"],
        ];
        
        self.eventsCategory = @[
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC24"],
            [[WWDCCategory alloc] initWithIconURL:@"ellipsis.bubble"
                                            title:@"Tech Talks"],
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC23"],
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC22"],
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC21"],
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC20"],
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC19"],
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC18"],
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC17"],
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC16"],
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC15"],
            [[WWDCCategory alloc] initWithIconURL:@"doc.append"
                                            title:@"WWDC14"],
        ];
    }
    return self;
}

- (void)loadView
{
    self.title = @"Browse";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.browseTableView = [[UITableView alloc] init];
    self.browseTableView.delegate = self;
    self.browseTableView.dataSource = self;
    self.browseTableView.estimatedRowHeight = 100;
    self.browseTableView.rowHeight = UITableViewAutomaticDimension;
    self.browseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.browseTableView registerClass:[BrowseCategoryTableViewCell class] forCellReuseIdentifier:browseKingKongCellReuseIdentifier];
    [self.view addSubview:self.browseTableView];
    [self.browseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        BrowseCategoryTableViewCell *cell = [
            tableView dequeueReusableCellWithIdentifier:browseKingKongCellReuseIdentifier
                                           forIndexPath:indexPath];
        cell.wwdcCategory = self.kingkongCategory[indexPath.item];
        return cell;
    } else if (indexPath.section == 1) {
        
    } else if (indexPath.section == 2) {
        BrowseCategoryTableViewCell *cell = [
            tableView dequeueReusableCellWithIdentifier:browseKingKongCellReuseIdentifier
                                           forIndexPath:indexPath];
        cell.wwdcCategory = self.topicsCategory[indexPath.item];
        return cell;
    } else if (indexPath.section == 3) {
        BrowseCategoryTableViewCell *cell = [
            tableView dequeueReusableCellWithIdentifier:browseKingKongCellReuseIdentifier
                                           forIndexPath:indexPath];
        cell.wwdcCategory = self.eventsCategory[indexPath.item];
        return cell;
    } else {
        UITableViewCell *cell = [
            tableView dequeueReusableCellWithIdentifier:@"cell"
                                           forIndexPath:indexPath];
        return cell;
    }
    
    UITableViewCell *cell = [
        tableView dequeueReusableCellWithIdentifier:@"cell"
                                       forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.kingkongCategory.count;
    } else if (section == 1) {
        return 0;
    } else if (section == 2) {
        return self.topicsCategory.count;
    } else if (section == 3) {
        return self.eventsCategory.count;
    } else {
        return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *headerView = [self createHeaderViewWithTitle:@"Continue Watching"
                                                 actionTitle:@"See all"];
        return headerView;
    } else if (section == 2) {
        UIView *headrView = [self createHeaderViewWithTitle:@"Topics"];
        return headrView;
    } else if (section == 3) {
        UIView *headrView = [self createHeaderViewWithTitle:@"Events"];
        return headrView;
    } else {
        UIView *headerView = [[UIView alloc] init];
        headerView.backgroundColor = [UIColor clearColor];
        return headerView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    if (section == 1 || section == 2 || section == 3) {
        return 10.f;
    } else {
        return 0.f;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)seeAllButtonTapped:(UIButton *)button
{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

/// 设置TableView为Plain风格的时候Section header不悬停
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.browseTableView) {
        CGFloat sectionHeaderHeight = 40.f;
        if (scrollView.contentOffset.y <= sectionHeaderHeight &&
            scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

- (UIView *)createHeaderViewWithTitle:(NSString *)title
{
    UIView *headrView = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont boldSystemFontOfSize:20];
    [headrView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(20));
    }];
    return headrView;
}

- (UIView *)createHeaderViewWithTitle:(NSString *)title 
                          actionTitle:(NSString *)actionTitle
{
    UIView *headrView = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont boldSystemFontOfSize:20];
    [headrView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(20));
        make.centerY.equalTo(@(0));
    }];
    
    UIButton *seeAllButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [seeAllButton setTitle:actionTitle forState:UIControlStateNormal];
    [seeAllButton addTarget:self action:@selector(seeAllButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    seeAllButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [headrView addSubview:seeAllButton];
    [seeAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-20));
        make.centerY.equalTo(@(0));
    }];
    return headrView;
}

@end
