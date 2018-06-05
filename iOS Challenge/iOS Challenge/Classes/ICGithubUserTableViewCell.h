//
//  ICGithubUserTableViewCell.h
//  iOS Challenge
//
//  Created by Nikolai Annenkoff on 6/5/18.
//  Copyright © 2018 company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICGithubUser.h"

@interface ICGithubUserTableViewCell : UITableViewCell

@property (nonatomic, strong) ICGithubUser *user;

+ (NSString *)identifier;

@end
