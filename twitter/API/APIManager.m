//
//  APIManager.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "APIManager.h"
#import "Tweet.h"

static NSString * const baseURLString = @"https://api.twitter.com";
static NSString * const consumerKey = @"QNPI0H6RYyx6AykIqoaVXpK6f";
static NSString * const consumerSecret = @"1dhfqDmM1XteQJc5K3nKQYaQAdjmGQX1lE0oaiPmHDBNxQCnSE";

@interface APIManager()

@end

@implementation APIManager

+ (instancetype)shared {
    static APIManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (instancetype)init {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    self = [super initWithBaseURL:baseURL consumerKey:consumerKey consumerSecret:consumerSecret];
    if (self) {
        
    }
    return self;
}

- (void)getHomeTimelineWithCompletion:(void(^)(NSArray *tweets, NSError *error))completion {
    
    [self GET:@"1.1/statuses/home_timeline.json"
   parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable tweetDictionaries) {
       
       // Cache it
       NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tweetDictionaries];
       [[NSUserDefaults standardUserDefaults] setValue:data forKey:@"hometimeline_tweets"];
       
       // Create Tweets from dictionaries
       NSMutableArray *tweets = [NSMutableArray array];
       for (NSDictionary *dictionary in tweetDictionaries) {
           Tweet *tweet = [[Tweet alloc] initWithDictionary:dictionary];
           [tweets addObject:tweet];
       }
       if (completion) { completion(tweets, nil); }
       
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
       if (completion) { completion(nil, error); }
   }];
}

@end
