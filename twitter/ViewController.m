//
//  ViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ViewController.h"
#import "BDBOAuth1SessionManager+SFAuthenticationSession.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) BDBOAuth1SessionManager *sessionManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *baseURL = [NSURL URLWithString:@"https://api.twitter.com"];
    self.sessionManager = [[BDBOAuth1SessionManager alloc] initWithBaseURL:baseURL
                                                               consumerKey:@"QNPI0H6RYyx6AykIqoaVXpK6f"
                                                            consumerSecret:@"1dhfqDmM1XteQJc5K3nKQYaQAdjmGQX1lE0oaiPmHDBNxQCnSE"];
    
    [self updateStatus];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)login:(id)sender {
    
    // Authenticate with Twitter
    [self.sessionManager loginWithCompletion:^(BOOL success, NSError *error) {
        NSLog(@"Authentication %d, error: %@", success, error);
        [self updateStatus];
    }];
    
}

- (void)updateStatus {
    if ([self.sessionManager isAuthorized]) {
        self.statusLabel.text = @"Status: Authorized";
    } else {
        self.statusLabel.text = @"Status: Not authorized";
    }
}

@end
