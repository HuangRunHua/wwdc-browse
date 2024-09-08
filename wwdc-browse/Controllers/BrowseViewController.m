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
#import "VideoTableViewCell.h"
#import "WWDCCategory.h"
#import "WWDCVideo.h"

#define browseKingKongCellReuseIdentifier @"browseKingKongCell"
#define CONTNUE_WATCH_VIDEO_REUSE_IDENTIFIER @"continueWatchVideoCellReuseIdentifier"

@interface BrowseViewController ()
@property (nonatomic, strong) NSArray<WWDCCategory *> *kingkongCategory;
@property (nonatomic, strong) NSArray<WWDCCategory *> *topicsCategory;
@property (nonatomic, strong) NSArray<WWDCCategory *> *eventsCategory;
@property (nonatomic, strong) NSArray<WWDCVideo *> *continueWatchingVideos;

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
        
        self.continueWatchingVideos = @[
            [[WWDCVideo alloc] initWithVideoFrameImageURL:@"demystify-swiftui-containers"
                                               videoTitle:@"Demystify SwiftUI containers"
                                                 videoTag:@"WWDC24"
                                              publishYear:2024
                                          userWatchStatus:@"9m left"],
            [[WWDCVideo alloc] initWithVideoFrameImageURL:@"meet-financeKit"
                                               videoTitle:@"Meet FinanceKit"
                                                 videoTag:@"WWDC24"
                                              publishYear:2024
                                          userWatchStatus:@"1m left"],
            [[WWDCVideo alloc] initWithVideoFrameImageURL:@"a-swift-tour-explore-swifts-features-and-design"
                                               videoTitle:@"A Swift Tour: Explore Swift’s features and design"
                                                 videoTag:@"WWDC24"
                                              publishYear:2024
                                          userWatchStatus:@"26m left"],
        ];
    }
    return self;
}

- (void)loadView
{
    self.title = @"Browse";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadTableView];
}

- (void)loadTableView
{
    self.browseTableView = [[UITableView alloc] init];
    self.browseTableView.delegate = self;
    self.browseTableView.dataSource = self;
    self.browseTableView.estimatedRowHeight = 100;
    self.browseTableView.rowHeight = UITableViewAutomaticDimension;
    self.browseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.browseTableView registerClass:[BrowseCategoryTableViewCell class] forCellReuseIdentifier:browseKingKongCellReuseIdentifier];
    [self.browseTableView registerClass:[VideoTableViewCell class] forCellReuseIdentifier:CONTNUE_WATCH_VIDEO_REUSE_IDENTIFIER];
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
        VideoTableViewCell *cell = [
            tableView dequeueReusableCellWithIdentifier:CONTNUE_WATCH_VIDEO_REUSE_IDENTIFIER
                                           forIndexPath:indexPath];
        cell.wwdcVideo = self.continueWatchingVideos[indexPath.item];
        return cell;
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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.kingkongCategory.count;
    } else if (section == 1) {
        return self.continueWatchingVideos.count;
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
    if (section == 2 || section == 3) {
        return 10.f;
    }
    if (section == 1) {
        return self.continueWatchingVideos.count > 0 ? 10.f : 0.f;
    }
    return 0.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    if (indexPath.section == 0) {
        detailVC.title = self.kingkongCategory[indexPath.item].title;
    } else if (indexPath.section == 1) {
        detailVC.title = self.continueWatchingVideos[indexPath.item].videoTitle;
    } else if (indexPath.section == 2) {
        detailVC.title = self.topicsCategory[indexPath.item].title;
    } else {
        detailVC.title = self.eventsCategory[indexPath.item].title;
    }
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)seeAllButtonTapped:(UIButton *)button
{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.title = @"Continue Watching";
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (UIView *)createHeaderViewWithTitle:(NSString *)title
{
    UIView *headrView = [[UIView alloc] init];
    headrView.backgroundColor = [UIColor whiteColor];
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
    headrView.backgroundColor = [UIColor whiteColor];
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
