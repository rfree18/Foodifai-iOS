//
//  RFVenueDetailViewController.m
//  Clarifai_Food
//
//  Created by Ross Freeman on 4/3/16.
//  Copyright © 2016 Ross Freeman. All rights reserved.
//

#import "RFVenueDetailViewController.h"

@interface RFVenueDetailViewController ()

@end

@implementation RFVenueDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    double x = [_venue.coordinates[1] doubleValue];
    double y = [_venue.coordinates[0] doubleValue];
    
    // Do any additional setup after loading the view.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:x
                                                            longitude:y
                                                                 zoom:16];
    
    _mapView.frame = CGRectZero;
    _mapView.camera = camera;
    
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(x, y);
    marker.title = self.venue.name;
    marker.snippet = self.venue.address;
    marker.map = _mapView;
    
    _mapView.selectedMarker = marker;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
