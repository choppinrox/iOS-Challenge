//
//  ICGithubUser.m
//  iOS Challenge
//
//  Created by Nikolai Annenkoff on 6/5/18.
//  Copyright © 2018 company. All rights reserved.
//

#import "ICGithubUser.h"

@implementation ICBadgeCounts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"bronze" : @"bronze",
             @"silver" : @"silver",
             @"gold" : @"gold"
             };
}

@end

@implementation ICGithubUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"Id" : @"user_id",
             @"reputationChangeDay" : @"reputation_change_day",
             @"badgeCounts" : @"badge_counts",
             @"location" : @"location",
             @"profileImage" : @"profile_image",
             @"lastAccessDate" : @"last_access_date",
             @"acceptRate" : @"accept_rate",
             @"link" : @"link",
             @"reputationChangeWeek" : @"reputation_change_week",
             @"isEmployee" : @"is_employee",
             @"websiteUrl" : @"website_url",
             @"reputationChangeYear" : @"reputation_change_year",
             @"reputation" : @"reputation",
             @"reputationChangeQuarter" : @"reputation_change_quarter",
             @"userType" : @"user_type",
             @"displayName" : @"display_name",
             @"reputationChangeMonth" : @"reputation_change_month"
             };
}

@end
