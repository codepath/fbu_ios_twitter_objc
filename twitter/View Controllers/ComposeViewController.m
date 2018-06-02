//
//  ComposeViewController.m
//  twitter
//
//  Created by emersonmalca on 5/31/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "Tweet.h"

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didTapPost:(id)sender {
    [[APIManager shared] composeTweetWithText:self.textView.text completion:^(Tweet *tweet, NSError *error) {
        if (error) {
            NSLog(@"Error composing tweet: %@", error.localizedDescription);
        } else if (tweet) {
            NSLog(@"Successfully composed the following Tweet: \n%@", tweet.text);
            [self.delegate didPostTweet:tweet];
        }
    }];
}

- (IBAction)didTapClose:(id)sender {
    [self.delegate didCancelCompose];
}

@end
