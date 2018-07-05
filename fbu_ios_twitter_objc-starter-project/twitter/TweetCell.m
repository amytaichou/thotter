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
    self.username.text = tweet.user.name;
    self.tweetContent.text = tweet.text;
}

- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    // TODO: Update cell UI
    // TODO: Send a POST request to the POST favorites/create endpoint
    
    self.tweet.favorited = YES;
    self.tweet.favoriteCount += 1;
    
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
        }
    }];
    
}

- (void) refreshData {
    //[NSString stringWithFormat:@"%d", self.retweetCount.text];
    self.tweet.retweetCount = [self.retweetCount.text intValue];
    self.tweet.favoriteCount = [self.favoriteCount.text intValue];
}
    
    @end
