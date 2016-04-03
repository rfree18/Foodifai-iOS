//
//  RFRestaurantViewController.h
//  Clarifai_Food
//
//  Created by Ross Freeman on 4/2/16.
//  Copyright © 2016 Ross Freeman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>

#import "RFCredentials.h"

@interface RFRestaurantViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSArray *keywords;

-(void)getRestaurants;

@end
