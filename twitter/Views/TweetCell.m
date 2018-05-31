//
//  TweetCell.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "Tweet.h"
#import "User.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "APIManager.h"

@interface TweetCell()

@property (strong, nonatomic) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UIButton *btnFavorite;
@property (weak, nonatomic) IBOutlet UIButton *btnRetweet;

@end

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithTweet:(Tweet *)tweet {
    self.tweet = tweet;
    [self refreshData];
}

- (void)refreshData {
    self.tweetTextLabel.text = self.tweet.text;
    self.nameLabel.text = self.tweet.user.name;
    self.usernameLabel.text = [NSString stringWithFormat:@"@%@·%@", self.tweet.user.username, self.tweet.createdAtString];
    [self.userImageView setImageWithURL:self.tweet.user.imageURL];
    self.btnFavorite.selected = self.tweet.favorited;
    self.btnRetweet.selected = self.tweet.retweeted;
    [self.btnFavorite setTitle:[NSString stringWithFormat:@"%lu", (unsigned long)self.tweet.favoriteCount] forState:UIControlStateNormal];
    [self.btnRetweet setTitle:[NSString stringWithFormat:@"%lu", (unsigned long)self.tweet.retweetCount] forState:UIControlStateNormal];
}

- (IBAction)didTapFavorite:(id)sender {
    // Update the local tweet model
    if (self.tweet.favorited) {
        self.tweet.favorited = false;
        self.tweet.favoriteCount -= 1;
    } else {
        self.tweet.favorited = true;
        self.tweet.favoriteCount += 1;
    }
    
    // Update cell UI
    [self refreshData];
    
    // Send a POST request to the POST favorites/create endpoint
    if (self.tweet.favorited) {
        [[APIManager shared] favoriteTweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if (error) {
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            } else if (tweet) {
                NSLog(@"Successfully favorited the following Tweet: \n%@", tweet.text);
            }
        }];
    } else {
        [[APIManager shared] unfavoriteTweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if (error) {
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            } else if (tweet) {
                NSLog(@"Successfully unfavorited the following Tweet: \n%@", tweet.text);
            }
        }];
    }
}

- (IBAction)didTapRetweet:(id)sender {
    // Update the local tweet model
    if (self.tweet.retweeted) {
        self.tweet.retweeted = false;
        self.tweet.retweetCount -= 1;
    } else {
        self.tweet.retweeted = true;
        self.tweet.retweetCount += 1;
    }
    
    // Update cell UI
    [self refreshData];
    
    // Send a POST request to the POST favorites/create endpoint
    if (self.tweet.retweeted) {
        [[APIManager shared] retweetTweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if (error) {
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            } else if (tweet) {
                NSLog(@"Successfully retweeted the following Tweet: \n%@", tweet.text);
            }
        }];
    } else {
        [[APIManager shared] unretweetTweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if (error) {
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            } else if (tweet) {
                NSLog(@"Successfully unretweeted the following Tweet: \n%@", tweet.text);
            }
        }];
    }
}


@end
