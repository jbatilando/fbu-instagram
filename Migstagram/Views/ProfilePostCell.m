//
//  ProfilePostCell.m
//  Migstagram
//
//  Created by Miguel Batilando on 6/18/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "ProfilePostCell.h"
#import "Post.h"
#import "PFImageView.h"

@implementation ProfilePostCell
// MARK: Methods
- (void) setPost:(Post *) post {
    _post = post;
    self.postImageView.file = post.image;
    [self.postImageView loadInBackground];
}
@end
