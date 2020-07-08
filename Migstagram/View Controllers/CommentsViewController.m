//
//  CommentsViewController.m
//  Migstagram
//
//  Created by Miguel Batilando on 7/7/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "CommentsViewController.h"
#import "PostCommentViewController.h"

@interface CommentsViewController () <UITableViewDelegate, UITableViewDataSource, PostCommentViewControllerDelegate>
// MARK: Properties
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation CommentsViewController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchComments];
}

#pragma mark - Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.comments[indexPath.row];
    
    return cell;
}

#pragma mark - Methods
- (void) fetchComments {
    self.comments = [self.post objectForKey:@"commentArray"];
    [self.tableView reloadData];
}

- (void)didComment:(NSString *)comment {
    [self.tableView reloadData];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"toPostComment"]){
        PostCommentViewController *postCommentViewController = [segue destinationViewController];
        postCommentViewController.post = self.post;
        postCommentViewController.delegate = self;
    }
}


@end
