//
//  CommentsViewController.h
//  Migstagram
//
//  Created by Miguel Batilando on 7/7/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentsViewController : UIViewController
// MARK: Properties
@property (strong, nonatomic) Post *post;
@property (nonatomic, strong) NSMutableArray *comments;
// MARK: Outlets
@end

NS_ASSUME_NONNULL_END
