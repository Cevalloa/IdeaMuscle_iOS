//
//  IdeaTableViewCell.m
//  Idea Muscle
//
//  Created by Alex Cevallos on 8/13/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import "IdeaTableViewCell.h"
#import "IdeaPost.h"

@interface IdeaTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *labelMonthDay;
@property (weak, nonatomic) IBOutlet UILabel *labelStartTime;
@property (weak, nonatomic) IBOutlet UILabel *labelNumberOfIdeas;


@end

@implementation IdeaTableViewCell

#pragma mark - Create Cell Customization
-(void)configureCellForEntry:(IdeaPost *)post{
    NSDate *dateForCell = [NSDate dateWithTimeIntervalSince1970:post.date];
    
    self.labelMonthDay.text = [self createCustomDate:true withDate:dateForCell];
    
    self.labelStartTime.text = [self createCustomDate:false withDate:dateForCell];
    
    self.labelNumberOfIdeas.text = @"No ideas yet!";
    
}

-(NSString *)createCustomDate:(BOOL)whichDateBOOL withDate:(NSDate *)passedInDate{
    NSDateFormatter *instanceDateFormatter = [[NSDateFormatter alloc] init];
    
    if(whichDateBOOL){
        [instanceDateFormatter setDateFormat:@"M / dd"];
    }else{
        [instanceDateFormatter setDateFormat:@"hh:mm a"];
    }
    
    return [instanceDateFormatter stringFromDate:passedInDate];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





















@end
