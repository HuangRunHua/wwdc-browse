//
//  WWDCVideo.h
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WWDCVideo : NSObject
@property (nonatomic, strong) NSString *videoFrameImageURL;
@property (nonatomic, strong) NSString *videoTitle;
@property (nonatomic, strong) NSString *videoTag;
@property (nonatomic, assign) NSInteger publishYear;
@property (nonatomic, strong) NSString *userWatchStatus;

- (instancetype)initWithVideoFrameImageURL:(NSString *)videoFrameImageURL
                                videoTitle:(NSString *)videoTitle
                                  videoTag:(NSString *)videoTag
                               publishYear:(NSInteger)publishYear
                           userWatchStatus:(NSString *)userWatchStatus;
@end

NS_ASSUME_NONNULL_END
