//
//  IdeaTableViewCell.h
//  Idea Muscle
//
//  Created by Alex Cevallos on 8/13/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IdeaPost;

@interface IdeaTableViewCell : UITableViewCell

-(void)configureCellForEntry:(IdeaPost *)post;

@end
