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
#import "CommentsViewController.h"

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
    
    self.avatarImageView.image = [UIImage imageNamed:@"image_placeholder"];
    self.avatarImageView.file = [self.post.author objectForKey:@"profileImage"];
    [self.avatarImageView loadInBackground];
    self.avatarImageView.layer.cornerRadius = (self.avatarImageView.frame.size.height) / 2;
    
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@",self.post.likeCount];
    
    // Tap on comments label
    UITapGestureRecognizer *newTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapViewCommentsLabel:)];
    [self.viewCommentsLabel setUserInteractionEnabled:YES];
    [self.viewCommentsLabel addGestureRecognizer:newTap];
    
    // Format createdAt date string
    NSDate *createdAt = [self.post createdAt];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    [formatter setDateFormat:@"h:mm a"];
    self.createdAtLabel.text = [formatter stringFromDate:createdAt];
    
    NSLog(@"Viewing object with ID: %@", self.post.objectId);
}

#pragma mark - IBActions
- (IBAction)didTapLikeButton:(id)sender {
    NSNumber *currentLikeCount = self.post.likeCount;
    int value = [currentLikeCount intValue];
    currentLikeCount = [NSNumber numberWithInt:value + 1];
    
    [self.post setValue:currentLikeCount forKey:@"likeCount"];
    [self.post saveInBackground];
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@",self.post.likeCount];
}

- (void)didTapViewCommentsLabel:(id)sender{
    NSLog(@"didTapCommentsLabel");
    [self performSegueWithIdentifier:@"commentsSegue" sender:nil];
}

- (IBAction)didTapCommentButton:(id)sender {
    NSLog(@"Tapped comment button");
    // Perform Segue to commentsVC
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"commentsSegue"]){
        CommentsViewController *commentsPostViewController = [segue destinationViewController];
        commentsPostViewController.post = self.post;
    }
}
@end
