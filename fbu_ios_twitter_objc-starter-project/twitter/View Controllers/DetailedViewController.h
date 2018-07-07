//
//  DetailedViewController.h
//  twitter
//
//  Created by Amy Liu on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "TweetCell.h"
#import "TimelineViewController.h"

@interface DetailedViewController : UIViewController

@property (nonatomic, weak) Tweet *tweet;

- (void)loadTweet;

@end
