//
//  PostCell.m
//  Migstagram
//
//  Created by Miguel Batilando on 6/16/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"

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
    
    // Set properties for post
    self.postContentImageView = post.image;
    // self.postAvatarImageView = ?
    self.postAuthorLabel.text = post.userID;
    self.postAuthorBeneathButton = post.userID;
    self.postCaptionLabel = post.caption;
    // [self.avatarImageView setImageWithURL: [tweet.user getAvatarURLString]];
    // self.avatarImageView.layer.cornerRadius = 28;
    // self.avatarImageView.layer.masksToBounds = YES;
    
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
}

@end
