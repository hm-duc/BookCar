//
//  MapViewController.m
//  BookCar
//
//  Created by nw on 2/24/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController (){
    CGFloat userLatitude;
    CGFloat userLongitude;
}
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Map View";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
//        self.locationManager.requestAlwaysAuthorization;
//        self.locationManager.startUpdatingLocation;
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [self.locationManager stopUpdatingHeading];
    userLatitude = self.locationManager.location.coordinate.latitude;
    userLongitude = self.locationManager.location.coordinate.longitude;
    
}

- (void)viewDidAppear:(BOOL)animated{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:userLatitude
                                                            longitude:userLongitude
                                                                zoom:16];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
}

@end
