//
//  OpeningViewController.m
//  Migstagram
//
//  Created by Miguel Batilando on 6/15/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "OpeningViewController.h"

@interface OpeningViewController ()
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation OpeningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = self.subView.bounds;
    gradient.colors = @[(id)[UIColor magentaColor].CGColor,
                        (id)[UIColor blueColor].CGColor];
    [self.subView.layer insertSublayer:gradient atIndex:0];
}

// MARK: IBActions
- (IBAction)didTapSignUp:(id)sender {
    [self performSegueWithIdentifier:@"signupSegue" sender:nil];
}

- (IBAction)didTapLogin:(id)sender {
    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
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
