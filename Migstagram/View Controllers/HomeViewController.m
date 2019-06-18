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

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>
// MARK: Outlets
@property (weak, nonatomic) IBOutlet UITableView *tableView;
// MARK: Properties
@property (nonatomic, strong) NSMutableArray *posts;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Logged in as %@", PFUser.currentUser);
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 160.0;
    
    // Get posts
    // bind action to refresh control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    self.posts = [[NSMutableArray alloc] init];
    
    [self fetchPosts:@20];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

-( UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    Post *post = self.posts[indexPath.row];
    cell.post = post;
    return cell;
}

// MARK: Methods
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
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (void) fetchPosts:(NSNumber *) postCount {
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
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

// MARK: IBActions
- (IBAction)didTapLogOut:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    OpeningViewController *openingViewController = [storyboard instantiateViewControllerWithIdentifier:@"OpeningViewController"];
    appDelegate.window.rootViewController = openingViewController;
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        NSLog(@"Logged out!");
    }];
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
