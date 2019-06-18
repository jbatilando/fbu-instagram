//
//  DetailsPostViewController.h
//  Migstagram
//
//  Created by Miguel Batilando on 6/17/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsPostViewController : UIViewController
// MARK: Outlets
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameAbovePostLabel;
@property (weak, nonatomic) IBOutlet PFImageView *postContentImageView;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *usernameBelowPostLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;

// MARK: Properties
@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
