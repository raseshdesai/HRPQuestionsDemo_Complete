//
//  HRPQuestionListTVCViewController.m
//  HRPMobilityQuestionsApp_Demo_1
//
//  Created by Rasesh Desai on 6/24/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "HRPQuestionListTVCViewController.h"

@interface HRPQuestionListTVCViewController ()

@end

@implementation HRPQuestionListTVCViewController

#define hrpQuestionnairesURL @"TBD"
# define jsonQuestionsDataId @"TBD"
# define sequenceNoKey @"TBD"
# define questionNoKey @"TBD"

-(void)viewDidLoad{
    [super viewDidLoad];
    [self loadQuestions];
}

-(void) loadQuestions{
    NSString * url = hrpQuestionnairesURL;
    NSData * questionData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSArray * allLanguageQuestions = [NSJSONSerialization JSONObjectWithData:questionData options:NSJSONReadingAllowFragments error:0];
    NSDictionary * englishQuestions = [allLanguageQuestions objectAtIndex:0];
    self.questions = [englishQuestions objectForKey:jsonQuestionsDataId];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.identifier isEqualToString:@"Show Question"]) {
            NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
            NSDictionary * question = [self.questions objectAtIndex:indexPath.row];
            if ([segue.destinationViewController respondsToSelector:@selector(setQuestion:)]) {
                [segue.destinationViewController performSelector:@selector(setQuestion:) withObject:question];
            }
        }
    }
}

-(void) setQuestions:(NSArray *)questions{
    _questions = questions;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Question Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary * question = [self.questions objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [question objectForKey:sequenceNoKey];
    cell.detailTextLabel.text = [question objectForKey:questionNoKey];
    
    return cell;
}

#pragma mark - Table view delegate


@end
