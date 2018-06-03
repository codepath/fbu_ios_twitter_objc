//
//  User.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@interface User()

@property (strong, nonatomic) NSDictionary *dictionary;

@end

@implementation User

static User * _current = nil;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.dictionary = dictionary;
        self.name = dictionary[@"name"];
        self.username = dictionary[@"screen_name"];
        self.imageURL = [NSURL URLWithString:dictionary[@"profile_image_url_https"]];
    }
    return self;
}

+ (User *)current {
    if (_current == nil) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSData *userData = [userDefaults dataForKey:@"currentUserData"];
        if (userData) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
            if (dictionary) {
                _current = [[User alloc] initWithDictionary:dictionary];
            }
        }
    }
    return _current;
}

+ (void)setCurrent:(User *)current {
    _current = current;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (current && current.dictionary) {
        NSData *userData = [NSJSONSerialization dataWithJSONObject:current.dictionary options:0 error:nil];
        if (userData) {
            [userDefaults setObject:userData forKey:@"currentUserData"];
        }
    } else {
        [userDefaults removeObjectForKey:@"currentUserData"];
    }
}

@end
