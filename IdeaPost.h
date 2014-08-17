//
//  IdeaPost.h
//  Idea Muscle
//
//  Created by Alex Cevallos on 8/13/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface IdeaPost : NSManagedObject

@property (nonatomic) int16_t intNumberOfIdeas;
@property (nonatomic, retain) NSString * stringListOfIdeas;
@property (nonatomic) NSTimeInterval date;

//Not in persistent store
@property (nonatomic, readonly) NSString *sectionName;

@end
