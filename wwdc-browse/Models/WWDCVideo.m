//
//  WWDCVideo.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import "WWDCVideo.h"

@implementation WWDCVideo
- (instancetype)initWithVideoFrameImageURL:(NSString *)videoFrameImageURL
                                videoTitle:(NSString *)videoTitle
                                  videoTag:(NSString *)videoTag
                               publishYear:(NSInteger)publishYear
                           userWatchStatus:(NSString *)userWatchStatus
{
    self = [super init];
    if (self) {
        _videoFrameImageURL = videoFrameImageURL;
        _videoTitle = videoTitle;
        _videoTag = videoTag;
        _publishYear = publishYear;
        _userWatchStatus = userWatchStatus;
    }
    return self;
}
@end
