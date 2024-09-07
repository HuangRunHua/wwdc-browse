//
//  BrowseCategoryTableViewCell.h
//  wwdc-browse
//
//  Created by huangrunhua on 2024/9/8.
//

#import <UIKit/UIKit.h>
#import "WWDCCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface BrowseCategoryTableViewCell : UITableViewCell
@property (nonatomic, strong) WWDCCategory *wwdcCategory;
@end

NS_ASSUME_NONNULL_END
