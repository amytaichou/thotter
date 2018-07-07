//
//  DetailedViewController.m
//  twitter
//
//  Created by Amy Liu on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "DetailedViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TweetCell.h"
#import "APIManager.h"
#import "TimelineViewController.h"
#import "Tweet.h"

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profile;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *handle;
@property (weak, nonatomic) IBOutlet UILabel *tweetContent;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadTweet];

    
}

- (void)loadTweet {
    
    self.username.text = self.tweet.user.name;
    self.tweetContent.text = self.tweet.text;
    
    self.profile.image = nil;
    [self.profile setImageWithURL: self.tweet.profileURL];
    
    self.timestamp.text = self.tweet.createdAtString;
    self.handle.text = self.tweet.user.screenName;
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

@end
