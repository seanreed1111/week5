//
//  MyMapViewController.m
//  MyMapDemo
//
//  Created by Sean Reed on 8/26/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "MyMapViewController.h"

@interface MyMapViewController ()

@end

@implementation MyMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(!self.locationManager)
    {
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    }
    
    if(!self.currentLocation)
    {
        self.currentLocation = [[CLLocation alloc]init];
    }
    self.mapView.mapType = MKMapTypeHybrid;
    
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)setMyMapType:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex)
    {
        case MKMapTypeStandard:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case MKMapTypeSatellite:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case MKMapTypeHybrid:
            self.mapView.mapType = MKMapTypeHybrid;
            break;

        default:
            break;
    }
}


#pragma mark CoreLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = [locations lastObject];
    NSLog(@"/nLatitude = %4.4f, longitude = %4.4f", self.currentLocation.coordinate.latitude, self.currentLocation.coordinate.longitude);
}

-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Sorry, could not find your location, error = %@",[error debugDescription]);
}

#pragma mark MKMapViewDelegate


- (IBAction)setMapType:(id)sender
{
}
@end
