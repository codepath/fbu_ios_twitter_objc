//
//  User.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSURL * imageURL;
@property (class, strong, nonatomic) User *current;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
