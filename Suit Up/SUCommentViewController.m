//
//  SUCommentViewController.m
//  Suit Up
//
//  Created by Josh Pearlstein on 12/9/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SUCommentViewController.h"
#import "Suit.h"
#import "SUAppDelegate.h"
#import "CorePlotHeaders/CPTGraph.h"
#import "CorePlotHeaders/CPTPieChart.h"
#import "CorePlotHeaders/CPTGraphHostingView.h"
#import "CorePlotHeaders/CPTXYGraph.h"
#import "CorePlotHeaders/CPTMutableTextStyle.h"
#import "CorePlotHeaders/CPTColor.h"
#import "CorePlotHeaders/CPTTheme.h"
#import "CorePlotHeaders/CPTGradient.h"
#import "CorePlotHeaders/CPTFill.h"
#import <QuartzCore/QuartzCore.h>
#define DEGREES_RADIANS(angle) ((angle) / 180.0 * M_PI)
@interface SUCommentViewController ()

@end

@implementation SUCommentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *title = (UILabel*)[self.view viewWithTag:1];
    UILabel *comment1 = (UILabel*)[self.view viewWithTag:2];
    UILabel *comment2 = (UILabel*)[self.view viewWithTag:3];
    UILabel *comment3 = (UILabel*)[self.view viewWithTag:4];
    title.text = [NSString stringWithFormat:@"%@",_total];
    comment1.text = _comment1;
    comment2.text = _comment2;
    comment3.text = _comment3;
    
    SUAppDelegate *appDelegate  = (SUAppDelegate *)[[UIApplication sharedApplication]delegate];
    _managedObjectContext = [appDelegate managedObjectContext];
    // The plot is initialized here, since the view bounds have not transformed for landscape until now
    [self initPlot];
    
}
-(void)viewDidAppear:(BOOL)animated{

}
- (IBAction)saveSuit:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Name Your Suit!" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        [self save:[alertView textFieldAtIndex:0].text];
    }
}
-(void)save:(NSString*)title{
    NSLog(@"%@",title);
    NSManagedObjectContext *context = [self managedObjectContext];
    Suit *suit = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Suit"
                      inManagedObjectContext:context];
    suit.name = title;
    suit.suit_color = _suitColor;
    suit.shirt_color = _shirtColor;
    suit.tie_color = _tieColor;
    suit.shoes_color = _shoeColor;
    
    suit.suit_texture = _suitTexture;
    suit.shirt_texture = _shirtTexture;
    suit.tie_texture = _tieTexture;
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Suit Saved!" message:@"Your Suit has been saved!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Sweet!", nil];
    [alert show];
}
-(void)setUpWithTitle:(NSNumber*)total com1:(NSString*)com1 com2:(NSString*)com2 com3:(NSString*)com3{
    _total = total;
    _comment1 = com1;
    _comment2 = com2;
    _comment3 = com3;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setColorSelection:(NSString*)suitColor andShirt:(NSString*)shirtColor andTie:(NSString*)tieColor andShoes:(NSString*)shoeColor{
    _suitColor = suitColor;
    _shirtColor = shirtColor;
    _tieColor = tieColor;
    _shoeColor = shoeColor;
}
-(void)setTextureSelection:(NSString*)suitTexture andShirt:(NSString*)shirtTexture andTie:(NSString*)tieTexture{
    _suitTexture = suitTexture;
    _shirtTexture = shirtTexture;
    _tieTexture = tieTexture;
}
- (IBAction)tryAgainPushed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - CPTPlotDataSource methods
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return 2;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
    
    if(index == 0){
        return [NSNumber numberWithFloat:([_total floatValue]/100)];
    }
    else{
        return [NSNumber numberWithFloat:1-([_total floatValue]/100)];
    }
}

-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)index {
    return nil;
}

-(NSString *)legendTitleForPieChart:(CPTPieChart *)pieChart recordIndex:(NSUInteger)index {
    return @"";
}
-(CPTFill *)sliceFillForPieChart:(CPTPieChart *)pieChart recordIndex:(NSUInteger)index{
    CPTColor *color2 = [CPTColor clearColor];
    CPTColor *color1 = [CPTColor darkGrayColor];

    if(index ==0){
        return [CPTFill fillWithColor:color1];
    }
    else{
        return [CPTFill fillWithColor:color2];
    }
}
#pragma mark - UIActionSheetDelegate methods
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
}
#pragma mark - Chart behavior


-(void)initPlot {
    [self configureHost];
    [self configureGraph];
    [self configureChart];
    [self configureLegend];
}

-(void)configureHost {
    // 1 - Set up view frame
    
    CGRect parentRect = self.plotView.frame;
    // 2 - Create host view
    self.hostView = [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame:parentRect];
    self.hostView.allowPinchScaling = NO;
    [self.view addSubview:self.hostView];
}

-(void)configureGraph {
    // 1 - Create and initialize graph
    CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.hostView.bounds];
    self.hostView.hostedGraph = graph;
    graph.paddingLeft = 0.0f;
    graph.paddingTop = 0.0f;
    graph.paddingRight = 0.0f;
    graph.paddingBottom = 0.0f;
    graph.axisSet = nil;
    // 2 - Set up text style
    CPTMutableTextStyle *textStyle = [CPTMutableTextStyle textStyle];
    textStyle.color = [CPTColor grayColor];
    textStyle.fontName = @"Helvetica-Bold";
    textStyle.fontSize = 16.0f;
    // 3 - Configure title
    NSString *title = @"";
    graph.title = title;
    graph.titleTextStyle = textStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(0.0f, -12.0f);
    // 4 - Set theme
    self.selectedTheme = [CPTTheme themeNamed:kCPTSlateTheme];
    [graph applyTheme:nil];

}

-(void)configureChart {
    // 1 - Get reference to graph
    CPTGraph *graph = self.hostView.hostedGraph;
    // 2 - Create chart
    CPTPieChart *pieChart = [[CPTPieChart alloc] init];
    pieChart.dataSource = self;
    pieChart.delegate = self;
    pieChart.pieRadius = (self.hostView.bounds.size.height * 0.7) / 2;
    pieChart.identifier = graph.title;
    pieChart.startAngle = M_PI_4;
    pieChart.sliceDirection = CPTPieDirectionClockwise;
    
    // 3 - Create gradient
    CPTGradient *overlayGradient = [[CPTGradient alloc] init];
    overlayGradient.gradientType = CPTGradientTypeRadial;
    overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.0] atPosition:0.9];
    overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.4] atPosition:1.0];
    pieChart.overlayFill = [CPTFill fillWithGradient:overlayGradient];
    // 4 - Add chart to graph
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D transform = CATransform3DMakeRotation(DEGREES_RADIANS(360), 0, 0, 1);
    rotation.toValue = [NSValue valueWithCATransform3D:transform];
    rotation.duration = 10.0f;
    [pieChart addAnimation:rotation forKey:@"rotation"];
    [graph addPlot:pieChart];
}

-(void)configureLegend {
}
@end
