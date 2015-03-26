//
//  ViewController.m
//  Argo Nom
//
//  Created by Kevin Nguy on 3/25/15.
//  Copyright (c) 2015 Kevin Nguy. All rights reserved.
//

#import "ViewController.h"
#import "ARGSnackViewController.h"

#import "ARGSnackTableViewCell.h"
#import "ARGSnack.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *snackDataSourceArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDataSource];
    [self setupTableView];
}

- (void)setupDataSource
{
    self.snackDataSourceArray = [NSMutableArray new];
    [self.snackDataSourceArray addObject:[[ARGSnack alloc] initWithName:@"Yogurt Covered Pretzels" amount:38]];
    [self.snackDataSourceArray addObject:[[ARGSnack alloc] initWithName:@"Beef Jerky" amount:25]];
    [self.snackDataSourceArray addObject:[[ARGSnack alloc] initWithName:@"Trail Mix" amount:65]];
    [self.snackDataSourceArray addObject:[[ARGSnack alloc] initWithName:@"Peanut M&M'S" amount:23]];
    [self.snackDataSourceArray addObject:[[ARGSnack alloc] initWithName:@"Coke Bottle" amount:212]];
    [self.snackDataSourceArray addObject:[[ARGSnack alloc] initWithName:@"Kitty" amount:2]];
}

- (void)setupTableView
{
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 70;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ARGSnackTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:NSStringFromClass([ARGSnackTableViewCell class])];
    
    // Make table view pretty
    self.tableView.layer.cornerRadius = 10;
    self.tableView.layer.borderWidth = 4;
    self.tableView.layer.borderColor = [UIColor colorWithWhite:47.0f/255.0f alpha:1].CGColor;
    
    [self.tableView reloadData];
}

- (IBAction)gimmeButtonPressed:(id)sender
{
    [self performSegueWithIdentifier:@"Snack" sender:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.snackDataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ARGSnackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ARGSnackTableViewCell class])];
    ARGSnack *snack = self.snackDataSourceArray[indexPath.row];
    
    cell.snackLabel.text = snack.name;
    cell.snackImageView.image = [UIImage imageNamed:snack.name];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Snack"]) {
        ARGSnackViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.snack = self.snackDataSourceArray[arc4random_uniform((int)self.snackDataSourceArray.count)];
    }
}

@end
