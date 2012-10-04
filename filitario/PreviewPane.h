//
//  PreviewPane.h
//  filitario
//
//  Created by rajasekhar  reddy on 04/10/12.
//  Copyright (c) 2012 sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Filters.h"

@interface PreviewPane : UIViewController

@property(nonatomic,retain)Filters *customFilter;

@property (retain, nonatomic) IBOutlet UIImageView *myImageViewOutlet;

@property (retain, nonatomic) IBOutlet UIScrollView *myScrollView;
- (IBAction)warmifyAction:(id)sender;
- (IBAction)nostolgiaAction:(id)sender;

@end
