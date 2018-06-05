//
//  ICGithubUserTableViewCell.m
//  iOS Challenge
//
//  Created by Nikolai Annenkoff on 6/5/18.
//  Copyright © 2018 company. All rights reserved.
//

#import "ICGithubUserTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ICGithubUserTableViewCell ()

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *place;
@property (strong, nonatomic) IBOutlet UILabel *website;

@end

@implementation ICGithubUserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height / 2.0f;
    self.profileImageView.layer.masksToBounds = YES;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    [self.profileImageView cancelImageDownloadTask];
    [self.profileImageView setImage:nil];
}

- (void)setUser:(ICGithubUser *)user {
    _user = user;
    ICBadgeCounts *badges = user.badgeCounts;
    
    self.name.text = user.displayName;
    self.place.text = user.location;
    self.website.text = [NSString stringWithFormat:@"gold %ld, silver: %ld, bronze: %ld", badges.gold, badges.silver, badges.bronze];
    
    [self.spinner startAnimating];
    __weak ICGithubUserTableViewCell *self_ = self;
    [self.profileImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:user.profileImage]]
                                 placeholderImage:nil
                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image){
                                              [self_.spinner stopAnimating];
                                              [UIView transitionWithView:self_ duration:0.3f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                                                  [self_.profileImageView setImage:image];
                                              } completion:nil];
                                          }
                                          failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error){
                                              [self_.spinner stopAnimating];
                                          }];
}

+ (NSString *)identifier {
    return @"githubUser";
}

@end
