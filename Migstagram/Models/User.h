//
//  User.h
//  Migstagram
//
//  Created by Miguel Batilando on 6/15/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"
#import <Parse/PFObject+Subclass.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : PFUser<PFSubclassing>
// MARK: Properties
@property (nonatomic, strong) PFFileObject *profileImage;

// MARK: Methods
+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image;
@end

NS_ASSUME_NONNULL_END
