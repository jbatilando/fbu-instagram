//
//  ProfilePostCell.h
//  Migstagram
//
//  Created by Miguel Batilando on 6/18/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfilePostCell : UICollectionViewCell
// MARK: Properties
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet PFImageView *postImageView;
@end

// MARK: Methods

NS_ASSUME_NONNULL_END
