//
//  Filters.m
//  filitario
//
//  Created by justin on 04/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Filters.h"

@implementation Filters{
    CIContext *filterContext;
}
-(Filters*)init
{
    [super init];
    filterContext = [CIContext contextWithOptions:nil];
}
-(CIContext*) context
{
    return filterContext;
}

-(CGImageRef) warmify   :(CIImage*)image
{
    CIImage *orginalImage = image;
}
-(CGImageRef) nostalgia :(CIImage*)image
{
    
}
-(CGImageRef) vintage   :(CIImage*)image
{
    
}
-(CGImageRef) vignette  :(CIImage*)image
{
    
}
-(CGImageRef) clear     :(CIImage*)image
{
    
}
@end
