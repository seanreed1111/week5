//
//  MyMapViewController.h
//  MyMapDemo
//
//  Created by Sean Reed on 8/26/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface MyMapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;



@property(strong, nonatomic)CLLocationManager *locationManager;
@property(strong, nonatomic)CLLocation *currentLocation;

@end
