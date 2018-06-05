//
//  ICGithubUserTableViewController.m
//  iOS Challenge
//
//  Created by Nikolai Annenkoff on 6/5/18.
//  Copyright © 2018 company. All rights reserved.
//

#import "ICGithubUserTableViewController.h"
#import "ICGithubUserTableViewCell.h"

@interface ICGithubUserTableViewController ()

@end

@implementation ICGithubUserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ICGithubUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ICGithubUserTableViewCell identifier] forIndexPath:indexPath];
    [cell setUser:self.items[indexPath.row]];
    
    return cell;
}

- (void)setItems:(NSArray *)items {
    _items = items;
    
    [self.tableView reloadData];
}

@end
