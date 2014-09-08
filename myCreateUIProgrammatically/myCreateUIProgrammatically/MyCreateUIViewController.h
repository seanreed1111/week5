//
//  MyCreateUIViewController.h
//  myCreateUIProgrammatically
//
//  Created by Sean Reed on 9/8/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCreateUIViewController : UIViewController

@property (strong, nonatomic) UILabel *headerLabel;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIScrollView *scrollView;

-(void)createLabel;
-(void)createButton;
-(void)createSegment;
-(void)createImageView;
-(void)createScrollView;
-(IBAction)buttonAction;
-(IBAction)pushSegmentedControl:(id)sender;

@end
