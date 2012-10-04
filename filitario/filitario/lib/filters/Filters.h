//
//  Filters.h
//  filitario
//
//  Created by justin on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>
@interface Filters : CIFilter
-(CIContext*) context;

-(CGImageRef) warmify   :(CIImage*)image;
-(CGImageRef) nostalgia :(CIImage*)image;
//-(CGImageRef) vintage   :(CIImage*)image;
//-(CGImageRef) vignette  :(CIImage*)image;
//-(CGImageRef) clear     :(CIImage*)image;
@end
