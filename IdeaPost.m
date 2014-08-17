//
//  IdeaPost.m
//  Idea Muscle
//
//  Created by Alex Cevallos on 8/13/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import "IdeaPost.h"


@implementation IdeaPost

@dynamic intNumberOfIdeas;
@dynamic stringListOfIdeas;
@dynamic date;

-(NSString *)sectionName{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    
    NSDateFormatter *instanceDateFormatter = [[NSDateFormatter alloc] init];
    [instanceDateFormatter setDateFormat:@"MMM YYYY"];
    
    return [instanceDateFormatter stringFromDate:date];
    
}

@end
