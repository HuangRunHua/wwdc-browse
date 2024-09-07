//
//  BrowseCategoryTableViewCell.m
//  wwdc-browse
//
//  Created by huangrunhua on 2024/9/8.
//

#import "BrowseCategoryTableViewCell.h"
#import <Masonry/Masonry.h>

#define CONTENT_DEFAULT_VERTICLE_PADDING 10
#define CONTENT_DEFAULT_HORIZON_PADDING 25
#define CHEVRON_RIGHT_WIDTH 10
#define ICON_IMAGE_VIEW_SIZE 25
#define PADDING_BETWEEN_CELL_VIEWS 20

#define cellRightArrorColor @"cellRightArrorColor"
#define cellDividerColor @"cellDividerColor"

@interface BrowseCategoryTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *categoryTitleLabel;
@property (nonatomic, strong) UIImageView *rightArrorImageView;
@property (nonatomic, strong) UIView *divider;
@end

@implementation BrowseCategoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)awakeFromNib 
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated 
{
    [super setSelected:selected animated:animated];
}

- (void)setWwdcCategory:(WWDCCategory *)wwdcCategory
{
    _wwdcCategory = wwdcCategory;
    self.iconImageView.image = [UIImage systemImageNamed:wwdcCategory.iconURL];
    self.categoryTitleLabel.text = wwdcCategory.title;
}

- (void)setupView
{
    [self loadIconImageView];
    [self loadRightArrorImageView];
    [self loadCategoryTitleLabel];
    [self loadDivider];
}

- (void)loadIconImageView
{
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.tintColor = [UIColor systemBlueColor];
    _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(ICON_IMAGE_VIEW_SIZE));
        make.width.equalTo(@(ICON_IMAGE_VIEW_SIZE));
        make.top.equalTo(@(CONTENT_DEFAULT_VERTICLE_PADDING));
        make.left.equalTo(@(CONTENT_DEFAULT_HORIZON_PADDING));
        make.bottom.lessThanOrEqualTo(@(-CONTENT_DEFAULT_VERTICLE_PADDING));
    }];
}

- (void)loadCategoryTitleLabel
{
    _categoryTitleLabel = [[UILabel alloc] init];
    _categoryTitleLabel.textAlignment = NSTextAlignmentLeft;
    _categoryTitleLabel.numberOfLines = 1;
    [self.contentView addSubview:_categoryTitleLabel];
    
    [_categoryTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(PADDING_BETWEEN_CELL_VIEWS);
        make.centerY.equalTo(self.iconImageView);
        make.right.equalTo(self.rightArrorImageView.mas_left).with.offset(-PADDING_BETWEEN_CELL_VIEWS);
    }];
}

- (void)loadRightArrorImageView
{
    _rightArrorImageView = [[UIImageView alloc] init];
    _rightArrorImageView.tintColor = [UIColor colorNamed:cellRightArrorColor];
    _rightArrorImageView.image = [UIImage systemImageNamed:@"chevron.right"];
    _rightArrorImageView.backgroundColor = [UIColor clearColor];
    _rightArrorImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_rightArrorImageView];
    [_rightArrorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(CHEVRON_RIGHT_WIDTH));
        make.width.equalTo(@(CHEVRON_RIGHT_WIDTH));
        make.right.equalTo(@(-CONTENT_DEFAULT_HORIZON_PADDING));
        make.centerY.equalTo(self.iconImageView.mas_centerY);
    }];
}

- (void)loadDivider
{
    _divider = [[UIView alloc] init];
    _divider.backgroundColor = [UIColor colorNamed:cellDividerColor];
    [self.contentView addSubview:_divider];
    
    [_divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(0.7));
        make.left.equalTo(self.categoryTitleLabel);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];
}



@end
