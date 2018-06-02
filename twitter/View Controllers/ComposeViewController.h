//
//  ComposeViewController.h
//  twitter
//
//  Created by emersonmalca on 5/31/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tweet;

@protocol ComposeViewControllerDelegate

- (void)didPostTweet:(Tweet *)tweet;
- (void)didCancelCompose;

@end

@interface ComposeViewController : UIViewController

@property (weak, nonatomic) id<ComposeViewControllerDelegate> delegate;

@end
