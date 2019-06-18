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
    self.postContentImageView.file = self.post.image;
    self.usernameAbovePostLabel.text = self.post.author.username;
    self.usernameBelowPostLabel.text = self.post.author.username;
    self.captionLabel.text = self.post.caption;
}

@end
