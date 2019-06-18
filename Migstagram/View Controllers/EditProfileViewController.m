//
//  EditProfileViewController.m
//  Migstagram
//
//  Created by Miguel Batilando on 6/18/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "EditProfileViewController.h"
#import "PFImageView.h"

@interface EditProfileViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIButton *changeProfilePhotoButton;

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// MARK: IBActions
- (IBAction)didTapCancel:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)didTapDone:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
