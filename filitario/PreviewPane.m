//
//  PreviewPane.m
//  filitario
//
//  Created by rajasekhar  reddy on 04/10/12.
//  Copyright (c) 2012 sourcebits. All rights reserved.
//

#import "PreviewPane.h"

@implementation PreviewPane

@synthesize customFilter;
@synthesize myImageViewOutlet;
@synthesize myScrollView;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    myScrollView.pagingEnabled=YES;
    myScrollView.scrollEnabled=YES;
    customFilter=[[Filters alloc]init];
 
   //yScrollView.backgroundColor=[UIColor blackColor];
    
//    UIButton *warmifyButton=[[UIButton alloc]initWithFrame:CGRectMake(0,310, 40, 40)];
//    [warmifyButton setTitle:@"Warmify" forState:UIControlStateNormal];
//    [warmifyButton addTarget:self action:@selector(warmify:) forControlEvents:UIControlEventTouchUpInside];
//    [myScrollView addSubview:warmifyButton];
//    
//    [warmifyButton release];
   
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMyImageViewOutlet:nil];
    [self setMyScrollView:nil];
    [self setCustomFilter:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [myImageViewOutlet release];
    [myScrollView release];
    [customFilter release];
    [super dealloc];
}
- (IBAction)warmifyAction:(id)sender {
    
    CGImageRef result=[customFilter warmify:[CIImage imageWithCGImage:myImageViewOutlet.image.CGImage]];
    UIImage *img=[UIImage imageWithCGImage:result];
    myImageViewOutlet.image=img;
}

- (IBAction)nostolgiaAction:(id)sender {
    CGImageRef result=[customFilter nostalgia:[CIImage imageWithCGImage:myImageViewOutlet.image.CGImage]];
    UIImage *img=[UIImage imageWithCGImage:result];
    myImageViewOutlet.image=img;
}
@end
