//
//  ViewController.m
//  iOS Challenge
//
//  Created by Nikolai Annenkoff on 6/5/18.
//  Copyright © 2018 company. All rights reserved.
//

#import "ViewController.h"
#import <Mantle/Mantle.h>
#import <AFNetworking/AFNetworking.h>
#import "ICAlert.h"
#import "ICGithubUser.h"
#import "ICGithubUserTableViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *users;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User Actions

- (IBAction)requestUserButtonPressed:(id)sender {
    [self.spinner startAnimating];
    [self.button setUserInteractionEnabled:NO];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"https://api.stackexchange.com/2.2/users?site=stackoverflow"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error){
        [self.spinner stopAnimating];
        [self.button setUserInteractionEnabled:YES];
        if (!error) {
            NSError *serialError;
            self.users = [MTLJSONAdapter modelsOfClass:[ICGithubUser class] fromJSONArray:responseObject[@"items"] error:&serialError];
            if (!serialError) {
                [self performSegueWithIdentifier:@"showUsers" sender:self];
            } else {
                [self showViewController:[ICAlert title:@"Error" message:serialError.localizedDescription] sender:self];
            }
        } else {
            [self showViewController:[ICAlert title:@"Error" message:error.localizedDescription] sender:self];
        }
    }];
    [dataTask resume];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ICGithubUserTableViewController class]]) {
        ICGithubUserTableViewController *vc = (ICGithubUserTableViewController *)segue.destinationViewController;
        [vc setItems:self.users];
    }
}

@end
