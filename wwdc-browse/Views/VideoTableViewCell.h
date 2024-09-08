//
//  VideoTableViewCell.h
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import <UIKit/UIKit.h>
#import "WWDCVideo.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoTableViewCell : UITableViewCell
@property (nonatomic, strong) WWDCVideo *wwdcVideo;
@end

NS_ASSUME_NONNULL_END
