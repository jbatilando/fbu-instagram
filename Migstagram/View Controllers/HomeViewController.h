//
//  HomeViewController.h
//  Migstagram
//
//  Created by Miguel Batilando on 6/15/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

// MARK: Properties
@property (nonatomic, strong) Post *post;

// MARK: Methods

@end

NS_ASSUME_NONNULL_END
