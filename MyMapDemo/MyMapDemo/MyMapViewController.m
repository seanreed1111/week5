//
//  MyMapViewController.m
//  MyMapDemo
//
//  Created by Sean Reed on 8/26/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "MyMapViewController.h"

@interface MyMapViewController()
{

    
}
@end

@implementation MyMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(!self.locationManager)
    {
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    }
    
    if(!self.currentLocation)
    {
        self.currentLocation = [[CLLocation alloc]init];
    }
    self.mapView.mapType = MKMapTypeHybrid;
    self.mapView.showsUserLocation = YES;
    [self.mapView setZoomEnabled:YES];
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
    
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
            self.mapView.mapType = MKMapTypeStandard;
            break;
    }
}


#pragma mark CoreLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = [locations lastObject];
    
    if(self.currentLocation)
    {
        NSLog(@"\nLatitude = %4.4f, longitude = %4.4f", self.currentLocation.coordinate.latitude, self.currentLocation.coordinate.longitude);
    
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.currentLocation.coordinate,10000.0,10000.0);
        [self.mapView setRegion:region animated:YES];
    
    }


    
//    [self.mapView setCenterCoordinate:self.currentLocation.coordinate];

}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"\nlocationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error");
    NSLog(@"\nSorry, could not find your location, error = %@",[error debugDescription]);
}

#pragma mark MKMapViewDelegate



@end
