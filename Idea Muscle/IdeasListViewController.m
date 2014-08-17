//
//  IdeasListViewController.m
//  Idea Muscle
//
//  Created by Alex Cevallos on 8/12/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import "IdeasListViewController.h"
#import "CoreDataStack.h"
#import "IdeaTableViewCell.h"
#import "IdeaPost.h"

@interface IdeasListViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation IdeasListViewController

#pragma mark - View Controller Lifecycle

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //Sets up fetchedResultsController's fetch
    [self.fetchedResultsController performFetch:nil];
}

#pragma mark - Segue Transfer



#pragma mark - Table View Methods

//Returns # of rows in given section of tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    
    return [sectionInfo numberOfObjects];
}

//What to show in every tableview cell?
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    IdeaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    IdeaPost *post = [self.fetchedResultsController objectAtIndexPath:indexPath];
    

    [cell configureCellForEntry:post];
    
    return cell;
    
}

//What should each section be titled ?
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    
    return [sectionInfo name];
}

#pragma mark - Fetched Results Methods

//Override fetchedResultsController
-(NSFetchedResultsController *)fetchedResultsController{
    if(_fetchedResultsController != nil){
        return _fetchedResultsController;
    }
    
    CoreDataStack *coreDataStackSingleton = [CoreDataStack defaultStack];
    NSFetchRequest *fetchRequestCustom = [self entryListFetchRequest];
 
    //Actually creates fetched results controller
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequestCustom managedObjectContext:coreDataStackSingleton.managedObjectContext sectionNameKeyPath:@"sectionName" cacheName:nil];
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
}

//Create custom fetchedRequest
-(NSFetchRequest *)entryListFetchRequest{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"IdeaPost"];
    
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO]];
    return fetchRequest;
}

#pragma  mark - Fetched Results Delegate
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView reloadData];
}

@end
