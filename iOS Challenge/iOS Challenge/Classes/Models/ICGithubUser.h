//
//  ICGithubUser.h
//  iOS Challenge
//
//  Created by Nikolai Annenkoff on 6/5/18.
//  Copyright © 2018 company. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface ICBadgeCounts : MTLModel <MTLJSONSerializing>

@property (nonatomic) NSInteger bronze;
@property (nonatomic) NSInteger silver;
@property (nonatomic) NSInteger gold;

+ (NSDictionary *)JSONKeyPathsByPropertyKey;

@end

@interface ICGithubUser : MTLModel <MTLJSONSerializing>

@property (nonatomic) NSInteger Id;
@property (nonatomic, strong) ICBadgeCounts *badgeCounts;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *profileImage;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *websiteUrl;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic) NSInteger reputationChangeYear;
@property (nonatomic) NSInteger reputationChangeQuarter;
@property (nonatomic) NSInteger reputationChangeMonth;
@property (nonatomic) NSInteger reputationChangeWeek;
@property (nonatomic) NSInteger reputationChangeDay;
@property (nonatomic) NSInteger lastAccessDate;
@property (nonatomic) NSInteger reputation;
@property (nonatomic) NSInteger acceptRate;
@property (nonatomic) BOOL isEmployee;

+ (NSDictionary *)JSONKeyPathsByPropertyKey;

@end
