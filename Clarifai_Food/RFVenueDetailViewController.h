//
//  RFVenueDetailViewController.h
//  Clarifai_Food
//
//  Created by Ross Freeman on 4/3/16.
//  Copyright © 2016 Ross Freeman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

#import "RFVenue.h"

@interface RFVenueDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@property (strong, nonatomic) RFVenue *venue;

@end
