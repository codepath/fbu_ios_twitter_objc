//
//  APIManager.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "BDBOAuth1SessionManager.h"
#import "BDBOAuth1SessionManager+SFAuthenticationSession.h"
@class Tweet;

@interface APIManager : BDBOAuth1SessionManager

+ (instancetype)shared;

- (void)getHomeTimelineWithCompletion:(void(^)(NSArray *tweets, NSError *error))completion;
- (void)favoriteTweet:(Tweet *)tweet completion:(void(^)(Tweet *tweet, NSError *error))completion;
- (void)unfavoriteTweet:(Tweet *)tweet completion:(void(^)(Tweet *tweet, NSError *error))completion;
- (void)retweetTweet:(Tweet *)tweet completion:(void(^)(Tweet *tweet, NSError *error))completion;
- (void)unretweetTweet:(Tweet *)tweet completion:(void(^)(Tweet *tweet, NSError *error))completion;
- (void)composeTweetWithText:(NSString *)text completion:(void(^)(Tweet *tweet, NSError *error))completion;

@end
