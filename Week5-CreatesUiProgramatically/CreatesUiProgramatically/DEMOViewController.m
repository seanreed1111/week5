//
//  DEMOViewController.m
//  CreatesUiProgramatically
//
//  Created by Aditya on 13/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOViewController.h"

@interface DEMOViewController ()

@end

@implementation DEMOViewController

@synthesize headerLabel,sampleBt;
@synthesize sgctrl, imgView, scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createLabel];
    [self createButton];
    [self createsegment];
    [self createImageView];
    [self createScrollView];
}

-(void)createLabel
{
    headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 25, 320, 44)];
    headerLabel.font = [UIFont fontWithName:@"Futura" size:18];
    headerLabel.text = @"Created at 1:40PM";
    headerLabel.textColor = [UIColor blackColor];
    [self.view addSubview:headerLabel];
}

-(void)createButton
{
    sampleBt = [[UIButton alloc] initWithFrame:CGRectMake(5, 110, 150, 30)];
    [sampleBt setBackgroundColor:[UIColor blackColor]];
    [sampleBt setTitle:@"Dynamic Button" forState:UIControlStateNormal];
    [sampleBt addTarget:self action:@selector(sampleBtAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sampleBt];
}


-(void)createsegment
{
    sgctrl = [[[UISegmentedControl alloc] initWithFrame:CGRectMake(15, 350, 320, 60) ] initWithItems:[NSArray arrayWithObjects:@"TurnToTech",@"Qcd", nil]];
    [sgctrl setBackgroundColor:[UIColor blackColor]];
    
    [sgctrl addTarget:self action:@selector(pushcgctrl:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sgctrl];
}


-(void)createImageView
{
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(400, 70, 107, 65) ];
    [self.view addSubview:imgView];
    
}

-(void)createScrollView
{
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 450, 500, 300)];
    scrollView.backgroundColor = [UIColor blueColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 400, 1000)];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    
    NSMutableString *txt = [[NSMutableString alloc]init];
    
    for(int i=0;i<200;i++)[txt appendString:@"The quick brown fox jumps upon a lazy dog.\n "];
    
    [label setText:txt];
    [label setTextColor:[UIColor blackColor]];
    
    [scrollView addSubview:label];
    [scrollView setContentSize: label.frame.size ];
    
    [[self view] addSubview:scrollView];
}

-(IBAction)pushcgctrl:(id)sender
{
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:

            //Label Change
            headerLabel.text = @"You click the TurnToTech Button";
            headerLabel.backgroundColor = [UIColor redColor];
            headerLabel.textColor = [UIColor blackColor];
            
            //Image Display
            imgView.image = [UIImage imageNamed:@"logo.png"];
            
            break;
            
        case 1:
            
            headerLabel.text = @"You click the Qcd Button";
            headerLabel.backgroundColor = [UIColor whiteColor];
            
            imgView.image = [UIImage imageNamed:@"qcd.jpg"];
            
             
            break;
            
        default:
            break;
    }
}

-(void)sampleBtAction
{
    headerLabel.text = @"User Click on dynamic Button";
    [imgView setImage:nil];
}

@end
