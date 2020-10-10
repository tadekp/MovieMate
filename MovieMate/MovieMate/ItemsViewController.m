//
//  ItemsViewController.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 10/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "ItemsViewController.h"
#import "TextProvider.h"
#import "ItemCell.h"

@interface ItemsViewController ()
@end

@implementation ItemsViewController

@synthesize currentItems;

- (void)viewDidLoad {
    self.currentItems = [[self itemsProvider] createEmpty];
    [super viewDidLoad];
    //[[self tableView] registerClass:[ItemCell class] forCellReuseIdentifier:[ItemCell identifier]];
    self.navigationItem.title = [[TextProvider shared] titleFor:[self itemType]];
    [[self itemsProvider] loadItemsForPage:0 result:^(id<Items> _Nullable const loadedItems) {
        self->currentItems = loadedItems;
        [[self tableView] reloadData];
    }];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (ItemType)itemType {
    return [[self itemsProvider] itemType];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self currentItems] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:[ItemCell identifier] forIndexPath:indexPath];
    //if ([cell item] == nil) {
    ItemCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ItemCell" owner:self options:nil] objectAtIndex:0];
    //}
    [cell setHasFavoriteMark:[self itemType] != kFavorite];
    [cell setItem:[self itemFor:indexPath]];
    return cell;
}

- (id<Item>)itemFor:(NSIndexPath *)indexPath {
    return [[self currentItems] itemAt:[indexPath row]];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
