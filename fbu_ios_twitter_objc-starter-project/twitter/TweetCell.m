//
//  TweetCell.m
//  twitter
//
//  Created by Amy Liu on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "Tweet.h"

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
    
    @end
