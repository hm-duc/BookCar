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

@implementation MapViewController{
    GMSAutocompleteFilter *filter;
    GMSAutocompleteResultsViewController *result;
    UISearchController *searchController;
    GMSAutocompleteTableDataSource *tableDataSource;
//    UISearchDisplayController *searchDislayController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self CustomTitleNavigationBar];
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
    [self CustomImageSearchItem];
    
}

- (void)ChangeNavigationBar{
    UIBarButtonItem *cancelSearchBar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelSearchBar)];
    self.navigationItem.rightBarButtonItem = cancelSearchBar;
    
    
//    UISearchBar *searchBar = [UISearchBar new];
    [self.navigationItem setHidesBackButton:YES animated:YES];
//    self.navigationItem.titleView = searchBar;
    
    
    result = [GMSAutocompleteResultsViewController new];
    result.delegate = self;
    searchController = [[UISearchController alloc]initWithSearchResultsController:result];
    [searchController.searchBar sizeToFit];
    searchController.searchBar.searchTextField.textColor = UIColor.whiteColor;
    self.navigationItem.titleView = searchController.searchBar;
    searchController.hidesNavigationBarDuringPresentation = NO;
    self.definesPresentationContext = YES;
    [searchController.searchBar setShowsCancelButton:NO];
//    [self autoCompleteClicked];
    
    tableDataSource = [GMSAutocompleteTableDataSource new];
    tableDataSource.delegate = self;
}

- (void)cancelSearchBar{
    self.navigationItem.titleView = nil;
    [self.navigationItem setHidesBackButton:NO animated:YES];
    self.navigationItem.title = @"Map View";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self CustomImageSearchItem];
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (void)CustomImageSearchItem{
    UIImage *searchImg = [UIImage imageNamed:@"search-6-24"];
    CGRect frameimg = CGRectMake(0, 0, searchImg.size.width, searchImg.size.height);
    UIButton *searchButton = [[UIButton alloc]initWithFrame:frameimg];
    [searchButton addTarget:self action:@selector(ChangeNavigationBar) forControlEvents:UIControlEventTouchUpInside];
    
    [searchButton setBackgroundImage:searchImg forState:UIControlStateNormal];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithCustomView:searchButton];
    self.navigationItem.rightBarButtonItem = searchItem;
}

- (void)CustomTitleNavigationBar{
    self.navigationItem.title = @"Map View";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)autoCompleteClicked{
    GMSAutocompleteViewController *autoCompleteController = [GMSAutocompleteViewController new];
    autoCompleteController.delegate = self;

    GMSPlaceField field = (GMSPlaceFieldName | GMSPlaceFieldPlaceID);
    autoCompleteController.placeFields = field;

    filter = [GMSAutocompleteFilter new];
    filter.type = kGMSPlacesAutocompleteTypeFilterAddress;
    autoCompleteController.autocompleteFilter = filter;
    
    [self presentViewController:autoCompleteController animated:YES completion:nil];
}

- (void)viewController:(GMSAutocompleteViewController *)viewController
didAutocompleteWithPlace:(GMSPlace *)place{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewController:(GMSAutocompleteViewController *)viewController
didFailAutocompleteWithError:(NSError *)error{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)wasCancelled:(GMSAutocompleteViewController *)viewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didUpdateAutocompletePredictions:(GMSAutocompleteViewController *)viewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableDataSource:(GMSAutocompleteTableDataSource *)tableDataSource
didAutocompleteWithPlace:(GMSPlace *)place{
    [searchController setActive:NO];
}

- (void)tableDataSource:(GMSAutocompleteTableDataSource *)tableDataSource
didFailAutocompleteWithError:(NSError *)error{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)resultsController:(GMSAutocompleteResultsViewController *)resultsController
 didAutocompleteWithPlace:(GMSPlace *)place{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)resultsController:(GMSAutocompleteResultsViewController *)resultsController
didFailAutocompleteWithError:(NSError *)error{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didUpdateAutocompletePredictionsForTableDataSource:(GMSAutocompleteTableDataSource *)tableDataSource{
    
}
@end
