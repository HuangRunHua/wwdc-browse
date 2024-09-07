//
//  WWDCCategory.h
//  wwdc-browse
//
//  Created by huangrunhua on 2024/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WWDCCategory : NSObject
@property (nonatomic, strong) NSString *iconURL;
@property (nonatomic, strong) NSString *title;

- (instancetype)initWithIconURL:(NSString *)iconURL title:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
