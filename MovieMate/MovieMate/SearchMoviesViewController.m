//
//  SearchMoviesViewController.m
//  MovieMate
//
//  Created by Tadeusz Purtak on 12/10/2020.
//  Copyright © 2020 Litterae. All rights reserved.
//

#import "SearchMoviesViewController.h"
#import "UIStoryboardSegue+MovieDetails.h"
#import "ItemCell.h"
#import "SearchMoviesProvider.h"

@interface SearchMoviesViewController () {
    NSString *lastQuery;
}

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) SearchMoviesProvider *searchProvider;

@end

@implementation SearchMoviesViewController

@synthesize itemsProvider = _itemsProvider;

- (void)viewDidLoad {
    [self setSearchProvider:[[SearchMoviesProvider alloc] init]];
    _itemsProvider = [self searchProvider];
    [super viewDidLoad];
    [[self searchBar] setDelegate:self];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    lastQuery = @"";
    [[self searchProvider] setText:@""];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"%@", searchText);
    [self cancelAllTasks];
    if ([searchText length] >= [[self searchProvider] minCharacters]) {
        lastQuery = searchText;
        [self performSelector:@selector(pleaseSearch:) withObject:searchText afterDelay:[[self searchProvider] secondsDelay]];
    } else {
        [self performSelector:@selector(pleaseFlush) withObject:nil afterDelay:[[self searchProvider] secondsDelay]];
    }
}

- (void)cancelAllTasks {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(pleaseSearch:) object:lastQuery];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(pleaseFlush) object:nil];
}

- (void)pleaseSearch:(NSString *)text {
    NSLog(@"🔆 %@", text);
    [[self searchProvider] setText:text];
    [self setCurrentPage:0];
    [self flush];
    [self reload];
}

- (void)pleaseFlush {
    NSLog(@"♨️");
    [[self searchProvider] setText:@""];
    [self setCurrentPage:0];
    [self flush];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[ItemCell class]]) {
        [segue feedWithBy:kMovie withElement:sender andProvider:[self itemsProvider]];
    }
}

@end
