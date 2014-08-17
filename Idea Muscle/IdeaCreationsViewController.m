//
//  IdeaCreationsViewController.m
//  Idea Muscle
//
//  Created by Alex Cevallos on 8/12/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import "IdeaCreationsViewController.h"
#import "CoreDataStack.h"
#import "IdeaPost.h"

@interface IdeaCreationsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textViewSingleIdea;
@property (weak, nonatomic) IBOutlet UIButton *buttonAddPost;

@end

@implementation IdeaCreationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Gets ride of the whitespace in scrollviews
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addNewIdea{
    CoreDataStack *coreDataStackSingleton = [CoreDataStack defaultStack];
    IdeaPost *entryPost = [NSEntityDescription insertNewObjectForEntityForName:@"IdeaPost" inManagedObjectContext:coreDataStackSingleton.managedObjectContext];
    
    entryPost.stringListOfIdeas = self.textViewSingleIdea.text;
    entryPost.date = [[NSDate date] timeIntervalSince1970];
    
    [coreDataStackSingleton saveContext];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
