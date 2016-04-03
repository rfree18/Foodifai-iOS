//
//  RFRestaurantViewController.m
//  Clarifai_Food
//
//  Created by Ross Freeman on 4/2/16.
//  Copyright © 2016 Ross Freeman. All rights reserved.
//

#import "RFRestaurantViewController.h"

static NSString *const kApiBaseUrl = @"https://api.foursquare.com/v2/venues/explore";

@interface RFRestaurantViewController ()

@end

@implementation RFRestaurantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.venues = [[NSMutableArray alloc] init];
    
    [self getRestaurants];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getRestaurants {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *tags = [self.keywords componentsJoinedByString:@","];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];
    params = [@{@"client_id":fourClientId, @"client_secret": fourClientSecret, @"v": @"20160402", @"ll": @"40.7, -74", @"section": @"food", @"query": tags} mutableCopy];
    
    [manager GET:kApiBaseUrl parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        //NSDictionary *info = responseObject[1];
        
        NSLog(@"%@", operation.request.URL.absoluteString);
        NSDictionary *info2 = [responseObject objectForKey:@"response"];
        NSDictionary *info3 = [info2 objectForKey:@"groups"][0];
        NSArray *info4 = [info3 objectForKey:@"items"];
        
        for (NSDictionary *restData in info4) {
            RFVenue *venue = [[RFVenue alloc] initWithData:restData];
            [self.venues addObject:venue];
        }
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.venues count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"restaurant"];
    
    RFVenue *venue = self.venues[indexPath.row];
    
    cell.textLabel.text = venue.name;
    
    return cell;
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
