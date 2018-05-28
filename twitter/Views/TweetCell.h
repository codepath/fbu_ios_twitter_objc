//
//  TweetCell.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tweet;

@interface TweetCell : UITableViewCell

- (void)updateWithTweet:(Tweet *)tweet;

@end
