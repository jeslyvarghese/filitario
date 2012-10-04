//
//  SLAppDelegate.h
//  filitario
//
//  Created by justin on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PreviewPane;
@interface SLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic)PreviewPane *myViewController;
@end
