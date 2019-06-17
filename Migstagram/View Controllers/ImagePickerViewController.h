//
//  ImagePickerViewController.h
//  Migstagram
//
//  Created by Miguel Batilando on 6/16/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImagePickerViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
// MARK: Properties
@property (nonatomic, strong) Post *post;
@end

NS_ASSUME_NONNULL_END
