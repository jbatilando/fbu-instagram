//
//  ProfileViewController.h
//  Migstagram
//
//  Created by Miguel Batilando on 6/18/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController
// MARK: Properties
@property (nonatomic, strong) PFUser *user;
@end

NS_ASSUME_NONNULL_END
