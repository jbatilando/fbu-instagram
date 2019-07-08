//
//  PostCell.m
//  Migstagram
//
//  Created by Miguel Batilando on 6/16/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
#import "PFImageView.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

// MARK: Methods
-(void)setPost:(Post *)post {
    _post = post;

    self.postContentImageView.image = [UIImage imageNamed:@"image_placeholder"];
    self.postContentImageView.file = post.image;
    [self.postContentImageView loadInBackground];
    
    self.postAvatarImageView.image = [UIImage imageNamed:@"image_placeholder"];
    self.postAvatarImageView.file = [post.author objectForKey:@"profileImage"];
    [self.postAvatarImageView loadInBackground];
    
    self.postAuthorLabel.text = post.author.username;
    self.postAuthorBeneathButton.text = post.author.username;
    self.postCaptionLabel.text = post.caption;
    self.postAvatarImageView.layer.cornerRadius = (self.postAvatarImageView.frame.size.height) / 2;
    
    NSDate *createdAt = [self.post createdAt];
    NSLog(@"%@", createdAt);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    [formatter setDateFormat:@"h:mm a"];
    self.createdAtLabel.text = [formatter stringFromDate:createdAt];
}

// MARK: IBActions
- (IBAction)didTapOptions:(id)sender {
}
- (IBAction)didTapComment:(id)sender {
}
- (IBAction)didTapSend:(id)sender {
}
- (IBAction)didTapSave:(id)sender {
}
- (IBAction)didTapLike:(id)sender {
    NSLog(@"Tapped Like Button on the Cell");
    NSNumber *currentLikeCount = self.post.likeCount;
    int value = [currentLikeCount intValue];
    currentLikeCount = [NSNumber numberWithInt:value + 1];
    
    [self.post setValue:currentLikeCount forKey:@"likeCount"];
    [self.post saveInBackground];
}

@end
