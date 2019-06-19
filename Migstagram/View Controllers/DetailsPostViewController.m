//
//  DetailsPostViewController.m
//  Migstagram
//
//  Created by Miguel Batilando on 6/17/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "DetailsPostViewController.h"
#import <Parse/Parse.h>
#import "PFImageView.h"

@interface DetailsPostViewController ()

@end

@implementation DetailsPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.postContentImageView.file = self.post[@"image"];
    self.usernameAbovePostLabel.text = self.post.author.username;
    self.usernameBelowPostLabel.text = self.post.author.username;
    self.captionLabel.text = self.post.caption;
    self.avatarImageView.layer.cornerRadius = (self.avatarImageView.frame.size.height) / 2;
    
    // Format createdAt date string
    NSDate *createdAt = [self.post createdAt];
    NSLog(@"%@", createdAt);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    [formatter setDateFormat:@"h:mm a"];
    self.createdAtLabel.text = [formatter stringFromDate:createdAt];
}

@end
