//
//  WWDCCategory.m
//  wwdc-browse
//
//  Created by huangrunhua on 2024/9/8.
//

#import "WWDCCategory.h"

@implementation WWDCCategory

- (instancetype)initWithIconURL:(NSString *)iconURL title:(NSString *)title
{
    self = [super init];
    if (self) {
        _iconURL = iconURL;
        _title = title;
    }
    return self;
}
@end
