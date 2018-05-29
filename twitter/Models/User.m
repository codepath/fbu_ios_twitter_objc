//
//  User.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.username = dictionary[@"screen_name"];
        self.imageURL = [NSURL URLWithString:dictionary[@"profile_image_url_https"]];
    }
    return self;
}

@end
