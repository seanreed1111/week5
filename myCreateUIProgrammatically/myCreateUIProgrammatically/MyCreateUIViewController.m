//
//  MyCreateUIViewController.m
//  myCreateUIProgrammatically
//
//  Created by Sean Reed on 9/8/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "MyCreateUIViewController.h"

@interface MyCreateUIViewController ()

@end

@implementation MyCreateUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createLabel];
    [self createButton];
    [self createSegment];
    [self createImageView];
    [self createScrollView];

}

-(void)createLabel
{
    self.headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(192, 25, 320, 44)];
    self.headerLabel.font = [UIFont fontWithName:@"Futura" size:18];
    self.headerLabel.text = @"HeaderLabel initialized";
    self.headerLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.headerLabel];
}
-(void)createButton
{
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(5, 110, 150, 30)];
    [self.button setBackgroundColor:[UIColor blueColor]];
    self.button.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.button setTitle:@"MyButton" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:self.button];
}
-(void)createSegment
{
    self.segmentedControl = [[[UISegmentedControl alloc]initWithFrame:CGRectMake(15, 350, 320, 60)] initWithItems:@[@"TurnToTech",@"QED"]];
    [self.segmentedControl setBackgroundColor:[UIColor blackColor]];
    [self.segmentedControl addTarget:self action:@selector(pushSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
}

-(void)createImageView
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(400, 70, 107, 65)];
    [self.view addSubview:self.imageView];
}

-(void)createScrollView
{
    self.scrollView  = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 450, 500, 300)];
    self.scrollView.backgroundColor = [UIColor blueColor];
    
    UILabel *scrollLabel = [[UILabel alloc ] initWithFrame:CGRectMake(5, 5, 400, 1000)];
    scrollLabel.lineBreakMode = NSLineBreakByWordWrapping;
    scrollLabel.numberOfLines = 0;
    [scrollLabel setFont:[UIFont fontWithName:@"Arial" size:12]];
    NSMutableString *text = [[NSMutableString alloc]init];
    
    for (int i=0; i<200; i++) {
        [text appendString:@"Ha Ha Ha! \n"];
    }
    
    [scrollLabel setText:text];
    [scrollLabel setTextColor:[UIColor blackColor]];
    
    [self.scrollView addSubview:scrollLabel];
    [self.scrollView setContentSize:scrollLabel.frame.size];
    [self.view addSubview:self.scrollView];
}

-(IBAction)buttonAction
{
    self.headerLabel.text = @"User clicked Button!";
    [self.imageView setImage:nil];
}

-(IBAction)pushSegmentedControl:(id)sender
{
    typedef NS_ENUM(NSInteger, MySegmentName)
    {
        TurnToTech,
        QED
    };

    switch (((UISegmentedControl *)sender).selectedSegmentIndex
    ){
        case TurnToTech:
            self.headerLabel.text = @"You clicked the TurnToTech segment";
            self.headerLabel.backgroundColor = [UIColor redColor];
            self.headerLabel.textColor = [UIColor blackColor];
            
            self.imageView.image = [UIImage imageNamed:@"logo.png"];
            break;
        case QED:
            self.headerLabel.text = @"You clicked the QED segment";
            self.headerLabel.backgroundColor = [UIColor whiteColor];
            self.headerLabel.textColor = [UIColor blackColor];
            
            self.imageView.image = [UIImage imageNamed:@"qcd.jpg"];
            break;
            
        default:
            break;
    }
}
@end
