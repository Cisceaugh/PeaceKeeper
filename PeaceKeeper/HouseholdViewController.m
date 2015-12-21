//
//  HouseholdViewController.m
//  PeaceKeeper
//
//  Created by Work on 12/16/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import "HouseholdViewController.h"
#import "Household.h"
#import "Person.h"

@interface HouseholdViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<Person *> *people;

@end

@implementation HouseholdViewController

- (NSArray<Person *> *)people {
    if (!_people) {
        Household *household = [Household fetchHousehold];
        if (household) {
            _people = [household.people allObjects];
        } else {
            _people = @[];
        }
    }
    return _people;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Person" forIndexPath:indexPath];
    Person *person = self.people[indexPath.row];

    NSString *contactString = @"";
    if (person.email && person.phoneNumber) {
        contactString = [NSString stringWithFormat:@"%@, %@", person.email, person.phoneNumber];
    } else if (person.email) {
        contactString = person.email;
    } else if (person.phoneNumber) {
        contactString = person.phoneNumber;
    }
    cell.textLabel.text = [person fullName];
    cell.detailTextLabel.text = contactString;
    return cell;
}

#pragma mark - UITableViewDelegate

@end
