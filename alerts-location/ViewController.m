//
//  ViewController.m
//  alerts-location
//
//  Created by Evangelos Giataganas on 24/03/2016.
//  Copyright © 2016 Evangelos Giataganas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _locationManager =[[CLLocationManager alloc]init];

    // Use either one of these authorizations **The top one gets called first and the other gets ignored

    [self.locationManager requestWhenInUseAuthorization];

    //[self.locationManager requestAlwaysAuthorization];

    [self.locationManager startUpdatingLocation];
}

-(void)checkStatus{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];

    if (status==kCLAuthorizationStatusNotDetermined) {
        _status.text = @"Not Determined";
    }

    if (status==kCLAuthorizationStatusDenied) {
        _status.text = @"Denied";
    }

    if (status==kCLAuthorizationStatusRestricted) {
        _status.text = @"Restricted";
    }

    if (status==kCLAuthorizationStatusAuthorizedAlways) {
        _status.text = @"Always Allowed";
    }

    if (status==kCLAuthorizationStatusAuthorizedWhenInUse) {
        _status.text = @"When In Use Allowed";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
