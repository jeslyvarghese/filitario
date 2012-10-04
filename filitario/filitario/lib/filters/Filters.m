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
    CIImage     *orginalImage       = image;
    CIFilter    *temperatureFilter  = [CIFilter filterWithName:@"CITemperatureAndTint"];
    
    [temperatureFilter setValue:orginalImage forKey:kCIInputImageKey];
    [temperatureFilter setValue:[CIVector vectorWithX:6500 Y:500] forKey:@"inputNeutral"];
    [temperatureFilter setValue:[CIVector vectorWithX:2500 Y:600] forKey:@"inputTargetNeutral"];
    
    CIImage     *outputImage  = [temperatureFilter valueForKey:kCIOutputImageKey];
    
    return [filterContext createCGImage:outputImage fromRect:[outputImage extent] ];
    
}
-(CGImageRef) nostalgia :(CIImage*)image
{
    //Apply a monochrome filter to turn to greyscale and then a sepia filter over it
    
    CIImage     *orginalImage       =   image;
    CIFilter    *monochromeFilter   =   [CIFilter filterWithName:@"CIColorMonochrome"];
    
    [monochromeFilter setValue:orginalImage forKey:kCIInputImageKey];
    [monochromeFilter setValue:[CIColor colorWithRed:.3 green:.3 blue:.3 ]forKey:@"inputColor"];
    [monochromeFilter setValue:[NSNumber numberWithFloat:.65] forKey:@"inputIntensity"];
    
    CIImage    *monochromeFilterOutputImage = [monochromeFilter valueForKey:kCIOutputImageKey];
    
    CIFilter   *sepiaFilter        = [CIFilter filterWithName:@"CISepiaTone"];
    
    [sepiaFilter setValue:monochromeFilterOutputImage forKey:kCIInputImageKey];
    [sepiaFilter setValue:[NSNumber numberWithFloat:.4] forKey:@"inputIntensity"];
    
    CIImage    *outputImage        = [sepiaFilter valueForKey:kCIOutputImageKey];
    
    return [filterContext createCGImage:outputImage fromRect:[outputImage extent]];
    
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
