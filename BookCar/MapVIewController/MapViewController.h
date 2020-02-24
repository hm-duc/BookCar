//
//  MapViewController.h
//  BookCar
//
//  Created by nw on 2/24/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController <CLLocationManagerDelegate>
@property CLLocationManager *locationManager;
@end

NS_ASSUME_NONNULL_END
