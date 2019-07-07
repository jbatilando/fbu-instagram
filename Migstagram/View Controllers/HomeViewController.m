//
//  HomeViewController.m
//  Migstagram
//
//  Created by Miguel Batilando on 6/15/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "HomeViewController.h"
#import "OpeningViewController.h"
#import "AppDelegate.h"
#import <Parse.h>
#import <UIKit/UIKit.h>
#import "PostCell.h"
#import "DetailsPostViewController.h"
#import "ProfileViewController.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
// MARK: Outlets
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// MARK: Properties
@property (nonatomic, strong) NSMutableArray *posts;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic) NSInteger index;
@property (nonatomic) BOOL isMoreDataLoading; // Configure retweet button
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Logged in as %@", PFUser.currentUser);
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Get posts, bind action to refresh control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    self.posts = [[NSMutableArray alloc] init];
    
    [self fetchPosts];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    Post *post = self.posts[indexPath.row];
    
    // Tap on image
    UITapGestureRecognizer *newTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapCellName:)];
    [cell.postAuthorLabel setUserInteractionEnabled:YES];
    [cell.postAuthorLabel addGestureRecognizer:newTap];
    
    // Set cell
    cell.post = post;
    cell.postContentImageView.file = post[@"image"];
    cell.postCaptionLabel.text = post[@"caption"];
    [cell.postContentImageView loadInBackground];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

// MARK: Methods
- (void)didTapCellName:(id)sender{
    NSLog(@"didTapCellName");
    CGPoint location = [sender locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    self.index = indexPath.row;
    [self performSegueWithIdentifier:@"profileSegue" sender:nil];
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    // [self getTimeline];
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}

- (void) fetchPosts {
    // Construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"author"];
    [query orderByDescending:@"createdAt"];
    query.limit = 20;
    
    // Fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            [self.posts removeAllObjects];
            for (Post *post in posts) {
                [self.posts addObject:post];
            }
            [self.refreshControl endRefreshing];
            self.isMoreDataLoading = NO;
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (void) fetchPosts:(NSNumber *) postCount {
    NSLog(@"Getting next 15 posts");
    // Construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"author"];
    [query orderByDescending:@"createdAt"];
    query.limit = 15;
    
    // Fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            [self.posts removeAllObjects];
            for (Post *post in posts) {
                [self.posts addObject:post];
            }
            [self.refreshControl endRefreshing];
            self.isMoreDataLoading = NO;
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

// Infinite scroll
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(!self.isMoreDataLoading){
        // Calculate the position of one screen length before the bottom of the results
        int scrollViewContentHeight = self.tableView.contentSize.height;
        int scrollOffsetThreshold = scrollViewContentHeight - self.tableView.bounds.size.height;
        
        // When the user has scrolled past the threshold, start requesting
        if(scrollView.contentOffset.y > scrollOffsetThreshold && self.tableView.isDragging) {
            self.isMoreDataLoading = YES;
            // Need to load more
            [self fetchPosts:@(1)];
        }
    }
}

// MARK: IBActions
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"detailsSegue"]){
        DetailsPostViewController *detailsPostViewController = [segue destinationViewController];
        UITableViewCell *tappedCell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
        Post *post = self.posts[indexPath.row];
        detailsPostViewController.post = post;
    }
    if ([segue.identifier isEqual:@"profileSegue"]){
        ProfileViewController *profileViewController = [segue destinationViewController];
        Post *post = self.posts[self.index];
        profileViewController.user = post.author;
    }
}

@end
