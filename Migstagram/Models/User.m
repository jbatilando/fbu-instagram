//
//  User.m
//  Migstagram
//
//  Created by Miguel Batilando on 6/15/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "User.h"
#import <Parse.h>

@implementation User
// Initialize
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.avatarImageURLString = dictionary[@"profile_image_url_https"];
        // Initialize any other properties
    }
    return self;
}
@end
