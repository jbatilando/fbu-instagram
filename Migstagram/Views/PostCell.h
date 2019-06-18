//
//  PostCell.h
//  Migstagram
//
//  Created by Miguel Batilando on 6/16/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <Parse/Parse.h>
#import "PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
// MARK: Properties
@property (nonatomic, strong) Post *post;

// MARK: Outlets
@property (weak, nonatomic) IBOutlet PFImageView *postContentImageView;
@property (weak, nonatomic) IBOutlet UIImageView *postAvatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *postAuthorLabel;
@property (weak, nonatomic) IBOutlet UIButton *postOptionsButton;
@property (weak, nonatomic) IBOutlet UIButton *postCommentButton;
@property (weak, nonatomic) IBOutlet UIButton *postSendButton;
@property (weak, nonatomic) IBOutlet UIButton *postSaveButton;
@property (weak, nonatomic) IBOutlet UIButton *postLikeButton;
@property (weak, nonatomic) IBOutlet UILabel *postAuthorBeneathButton;
@property (weak, nonatomic) IBOutlet UILabel *postCaptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;

// MARK: Methods
-(void)setPost:(Post *)post;

@end

NS_ASSUME_NONNULL_END
