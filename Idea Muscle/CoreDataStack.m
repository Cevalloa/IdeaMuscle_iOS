//
//  CoreDataStack.m
//  Idea Muscle
//
//  Created by Alex Cevallos on 8/6/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import "CoreDataStack.h"

@implementation CoreDataStack

//makes these readonly public, but manipulative in private
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

//Creates Singleton class
+(instancetype)defaultStack{
    static CoreDataStack *defaultStack;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultStack = [[self alloc] init];
    });
    
    return defaultStack;
    
}

//Saves The managed object context
-(void)saveContext{
    
    NSError *error = nil;
    //Grabs managedObjectContext
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if(managedObjectContext != nil){
        if([managedObjectContext hasChanges] && ![managedObjectContext save:&error]){
            //if the managed object context fails, print out the error
            NSLog(@"Unresolved error %@ %@", error, [error userInfo]);
            abort();
        }
    }
    
}

#pragma mark - Core Data Stack

//returns the managed object contextin use for this application
//if context doesn't exist, it is created & bound to the persistent store coordinator for the application
-(NSManagedObjectContext *)managedObjectContext
{
    if(_managedObjectContext != nil){
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if(coordinator != nil){
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return  _managedObjectContext;
}

//Returns the managed object model for the application
//If the model doesn't already exist, it is created from the application's model
-(NSManagedObjectModel *)managedObjectModel{
    if(_managedObjectModel != nil){
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Idea_Muscle" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return _managedObjectModel;
}

//returns the persist store coordinator in this application
//if coordinator doesn't exist, it is created and application's store is added to it
-(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if(_persistentStoreCoordinator != nil){
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Idea_Muscle.sqlite"];
    
    NSError *error = nil;
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]){
        NSLog(@"Unresolved error %@ %@", error, [error userInfo]);
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents Directory

//Returns URL to the application's documents directory

-(NSURL *)applicationDocumentsDirectory

{
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSLog(@"%@", url.absoluteString);
    
    return  url;
}










@end
