//
//  PostCommentViewController.m
//  Migstagram
//
//  Created by Miguel Batilando on 7/7/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "PostCommentViewController.h"

@interface PostCommentViewController ()
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;

@end

@implementation PostCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)didTapPost:(id)sender {
    // NSString *commentText = self.commentTextView.text;
    
    
}

- (IBAction)didTapCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
