//
//  TweetCell.m
//  twitter
//
//  Created by Amy Liu on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "Tweet.h"
#import "APIManager.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/* - (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
} */

- (void) setTweet:(Tweet *)tweet {
    _tweet = tweet;
    self.username.text = self.tweet.user.name;
    self.tweetContent.text = self.tweet.text;
    
    self.profile.image = nil;
    [self.profile setImageWithURL: self.tweet.profileURL];
    
    self.retweetCount.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.favoriteCount.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    
    self.timestamp.text = self.tweet.createdAtString;
    self.handle.text = self.tweet.user.screenName;
}

- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    // TODO: Update cell UI
    // TODO: Send a POST request to the POST favorites/create endpoint
    

    NSLog(@"hello");
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            [self refreshData];
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            self.tweet.favorited = YES;
            self.tweet.favoriteCount += 1;
            [self refreshData];
        }
    }];
}

- (IBAction)didTapRetweet:(id)sender {
    // TODO: Update the local tweet model
    // TODO: Update cell UI
    // TODO: Send a POST request to the POST favorites/create endpoint
    
    
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            [self refreshData];
        }
        else{
            NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            self.tweet.retweeted = YES;
            self.tweet.retweetCount += 1;
            [self refreshData];
        }
    }];
}

- (void) refreshData {
    //[NSString stringWithFormat:@"%d", self.retweetCount.text];
    if (self.tweet.retweeted) {
        self.retweetCount.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
        self.retweetButton.selected = YES;
    } else if(self.tweet.favorited){
     self.favoriteButton.selected = YES;
    self.favoriteCount.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    }
    
}
    
    @end
