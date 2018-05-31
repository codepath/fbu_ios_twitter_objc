//
//  Tweet.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface Tweet : NSObject

@property (strong, nonatomic) NSString *uid; // For favoriting, retweeting & replying
@property (strong, nonatomic) NSString *text; // Text content of tweet
@property (nonatomic) NSUInteger favoriteCount; // Update favorite count label
@property (nonatomic) BOOL favorited; // Configure favorite button
@property (nonatomic) NSUInteger retweetCount; // Update favorite count label
@property (nonatomic) BOOL retweeted; // Configure retweet button
@property (strong, nonatomic) User *user; // Contains name, screenname, etc. of tweet author
@property (strong, nonatomic) NSString *createdAtString; // Display date

@property (strong, nonatomic) User *retweetedByUser; // User who retweeted if tweet is retweet

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
