//
//  SUOpenView.m
//  Suit Up
//
//  Created by Josh Pearlstein on 11/7/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "SUOpenView.h"
#import <CoreData/CoreData.h>
#import "SUAppDelegate.h"
#import "Suit.h"
#import "SUViewController.h"
@implementation SUOpenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
-(void)setup:(SUViewController*)view{

    _suits = [[NSMutableArray alloc]init];
    SUAppDelegate *appDelegate = (SUAppDelegate *)[[UIApplication sharedApplication]delegate];
    _managedObjectContext = [appDelegate managedObjectContext];
    NSError *error;
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Suit" inManagedObjectContext:context];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    [fetchRequest setEntity:entity];
    [fetchRequest setSortDescriptors:@[sort]];
    _suits = [[context executeFetchRequest:fetchRequest error:&error] mutableCopy];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView reloadData];
    _controller = view;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_suits count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [self.suits[indexPath.row] name];
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    Suit *suit = _suits[indexPath.row];
    [_controller displaySuit:suit];
}
- (IBAction)startNew:(id)sender {
    [_controller initWithSelection:@"stripe" andshirt:@"gingham" andTie:@"large stripe" withColor:@"black" shirtColor:@"gray" tieColor:@"lavender" andShoeColor:@"brown"];
    [_controller hideMenu];
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
