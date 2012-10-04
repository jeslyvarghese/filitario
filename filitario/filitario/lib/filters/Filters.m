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
    return self;
}
-(CIContext*) context
{
    return filterContext;
}

-(CGImageRef) warmify   :(CIImage*)image
{
    CIContext *context=[CIContext contextWithOptions:nil];
    CIImage     *orginalImage       = image;
    CIFilter    *temperatureFilter  = [CIFilter filterWithName:@"CITemperatureAndTint"];
    
    [temperatureFilter setValue:orginalImage forKey:kCIInputImageKey];
    [temperatureFilter setValue:[CIVector vectorWithX:6500 Y:500] forKey:@"inputNeutral"];
    [temperatureFilter setValue:[CIVector vectorWithX:2500 Y:600] forKey:@"inputTargetNeutral"];
    
    CIImage     *outputImage  = [temperatureFilter valueForKey:kCIOutputImageKey];
   // NSLog(@"%@",filterContext);
    CGImageRef result=[context createCGImage:outputImage fromRect:[outputImage extent] ];
    
    return result;
}
-(CGImageRef) nostalgia :(CIImage*)image
{
    //Apply a monochrome filter to turn to greyscale and then a sepia filter over it
     CIContext *context=[CIContext contextWithOptions:nil];
    CIImage     *orginalImage       =   image;
    CIFilter    *monochromeFilter   =   [CIFilter filterWithName:@"CIColorMonochrome"];
    
    [monochromeFilter setValue:orginalImage forKey:kCIInputImageKey];
    [monochromeFilter setValue:[CIColor colorWithRed:.1 green:.1 blue:.1 ]forKey:@"inputColor"];
    [monochromeFilter setValue:[NSNumber numberWithFloat:.85] forKey:@"inputIntensity"];
    
    CIImage    *monochromeFilterOutputImage = [monochromeFilter valueForKey:kCIOutputImageKey];
    
    CIFilter   *sepiaFilter        = [CIFilter filterWithName:@"CISepiaTone"];
    
    [sepiaFilter setValue:monochromeFilterOutputImage forKey:kCIInputImageKey];
    [sepiaFilter setValue:[NSNumber numberWithFloat:.4] forKey:@"inputIntensity"];
    
    CIImage    *outputImage        = [sepiaFilter valueForKey:kCIOutputImageKey];
    
    return [context createCGImage:outputImage fromRect:[outputImage extent]];
    
}
-(CGImageRef) vintage   :(CIImage*)image
{
    //Apply a hue effect, luminosity and sepia
    
    CIImage     *originalImage      = image;
    CIFilter    *hueAdjustFilter    = [CIFilter filterWithName:@"CIHueAdjust"];
    [hueAdjustFilter setValue:originalImage forKey:kCIInputImageKey];
    [hueAdjustFilter setValue:[NSNumber numberWithFloat:0.5] forKey:@"inputAngle"];
    
    CIImage     *hueAdjustFilterOutput  =   [hueAdjustFilter valueForKey:kCIOutputImageKey];
    CIFilter    *sepiaFilter        = [CIFilter filterWithName:@"CISepiaTone"];
    
    [sepiaFilter setValue:hueAdjustFilterOutput forKey:kCIInputImageKey];
    [sepiaFilter setValue:[NSNumber numberWithFloat:.75] forKey:@"inputAngle"];
    
    CIImage     *sepiaFilterOutput  = [sepiaFilter valueForKey:kCIOutputImageKey];
    
    CIFilter    *exposureAdjustFilter   = [CIFilter filterWithName:@"CIExposureAdjust"];
    
    [exposureAdjustFilter setValue:sepiaFilterOutput forKey:kCIInputImageKey];
    [exposureAdjustFilter setValue:[NSNumber numberWithFloat:0.45] forKey:@"inputEV"];
    
    CIImage     *outputImage = [exposureAdjustFilter valueForKey:kCIOutputImageKey];
    
    return [filterContext createCGImage:outputImage fromRect:[outputImage extent]];

}
-(CGImageRef) vignette  :(CIImage*)image
{
    //Apply Vignette effect on it
    CIImage     *originalImage      = image;
    CIFilter    *vignetteFilter     = [CIFilter filterWithName:@"CIVignette"];
    
    [vignetteFilter setValue:originalImage forKey:kCIInputImageKey];
    [vignetteFilter setValue:[NSNumber numberWithFloat:.5] forKey:@"inputRadius"];
    [vignetteFilter setValue:[NSNumber numberWithFloat:.75] forKey:@"inputIntensity"];
    
    CIImage     *outputImage = [vignetteFilter valueForKey:kCIOutputImageKey];
    
    return [filterContext createCGImage:outputImage fromRect:[outputImage extent]];
    
}
-(CGImageRef) clear     :(CIImage*)image
{
    return NULL;
}

@end
