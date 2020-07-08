//
//  PostCommentViewController.h
//  Migstagram
//
//  Created by Miguel Batilando on 7/7/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PostCommentViewControllerDelegate

- (void)didComment:(NSString *)comment;

@end

@interface PostCommentViewController : UIViewController
@property (strong, nonatomic) Post *post;
@property (nonatomic, weak) id<PostCommentViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
