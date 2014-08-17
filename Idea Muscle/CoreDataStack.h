//
//  CoreDataStack.h
//  Idea Muscle
//
//  Created by Alex Cevallos on 8/6/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataStack : NSObject

+(instancetype)defaultStack;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(void)saveContext;
-(NSURL *)applicationDocumentsDirectory;

@end
