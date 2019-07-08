//
//  CommentsViewController.m
//  Migstagram
//
//  Created by Miguel Batilando on 7/7/19.
//  Copyright © 2019 Acme. All rights reserved.
//

#import "CommentsViewController.h"

@interface CommentsViewController () <UITableViewDelegate, UITableViewDataSource>
// MARK: Properties
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fetchComments];
}

// MARK: Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.text = @"comment";
    
    return cell;
}

// MARK: Methods
- (void) fetchComments {
    // Construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"author"];
    [query orderByDescending:@"createdAt"];
    query.limit = 20;
    
    // Fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable comments, NSError * _Nullable error) {
        if (comments) {
            [self.comments removeAllObjects];
            for (NSString *comment in comments) {
                [self.comments addObject:comment];
            }
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
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
