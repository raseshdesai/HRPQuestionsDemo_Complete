//
//  HRPQuestionDetailViewController.m
//  HRPMobilityQuestionsApp_Demo_1
//
//  Created by Rasesh Desai on 6/24/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "HRPQuestionDetailViewController.h"

@interface HRPQuestionDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *controlIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *sequenceIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionTextLabel;

@end

@implementation HRPQuestionDetailViewController

# define controlKey @"TBD"
# define sequenceNoKey @"TBD"
# define questionNoKey @"TBD"
# define questionTextKey @"TBD"

-(void) viewDidLoad{
    [super viewDidLoad];
    [self loadLabels];
}

-(void) loadLabels{
    self.controlIdLabel.text = [@"Control Id: " stringByAppendingString:[self.question objectForKey:controlKey]];
    self.sequenceIdLabel.text = [@"Sequence Id: " stringByAppendingString:[self.question objectForKey:sequenceNoKey]];
    self.questionIdLabel.text = [@"Question Id: " stringByAppendingString:[self.question objectForKey:questionNoKey]];
    self.questionTextLabel.text = [@"Question: " stringByAppendingString:[self.question objectForKey:questionTextKey]];
}

@end
