//
//  main.m
//  wwdc-browse
//
//  Created by huangrunhua on 2024/9/7.
//

#import <UIKit/UIKit.h>
#import "WWDCBrowseAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([WWDCBrowseAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
