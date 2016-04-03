//
//  RFVenue.m
//  Clarifai_Food
//
//  Created by Ross Freeman on 4/2/16.
//  Copyright © 2016 Ross Freeman. All rights reserved.
//

#import "RFVenue.h"

@implementation RFVenue

-(id)initWithData:(NSDictionary *)data {
    self = [super init];
    
    if (self) {
        NSDictionary *venueInfo = [data objectForKey:@"venue"];
        
        self.name = [venueInfo objectForKey:@"name"];
    }
    
    return self;
}

@end
