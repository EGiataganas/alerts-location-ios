//
//  ViewController.h
//  alerts-location
//
//  Created by Evangelos Giataganas on 24/03/2016.
//  Copyright © 2016 Evangelos Giataganas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>

- (IBAction)goToSettings:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *status;
@property(nonatomic)CLLocationManager *locationManager;
@property(nonatomic)NSTimer *timer;
- (IBAction)changAuth:(id)sender;

@end

