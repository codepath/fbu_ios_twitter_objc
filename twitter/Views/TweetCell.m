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

@interface TweetCell()

@property (strong, nonatomic) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

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
    self.tweetTextLabel.text = tweet.text;
    self.nameLabel.text = tweet.user.name;
    self.usernameLabel.text = [NSString stringWithFormat:@"@%@·%@", tweet.user.username, tweet.createdAtString];
    [self.userImageView setImageWithURL:tweet.user.imageURL];
}

@end
