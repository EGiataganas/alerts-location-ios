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

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(checkStatus)
                                                userInfo:nil repeats:YES];
}

-(void)requestAlwaysAuth{

    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];

    if (status==kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusDenied) {

        NSString*title;

        title=(status == kCLAuthorizationStatusDenied) ? @"Location Services Are Off" : @"Background use is not enabled";

        NSString *message = @"Go to settings";

        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Settings", nil];

        [alert show];

    }else if (status==kCLAuthorizationStatusNotDetermined)

    {[self.locationManager requestAlwaysAuthorization];}

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 1) {

        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];

        [[UIApplication sharedApplication]openURL:settingsURL];

    }
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

- (IBAction)goToSettings:(id)sender {
    NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [[UIApplication sharedApplication]openURL:settingsURL];
}

@end
