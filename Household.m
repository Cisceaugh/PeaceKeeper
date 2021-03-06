//
//  Household.m
//  PeaceKeeper
//
//  Created by Work on 12/14/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import "Household.h"
#import "Chore.h"
#import "Person.h"
#import "NSManagedObjectContext+Category.h"

@implementation Household

+ (NSString *)name {
    return @"Household";
}

+ (instancetype)fetchHousehold {
    NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[Household name]];
    NSError *error;
    NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"Error fetching %@ objects: %@", [Household name], error.localizedDescription);
    } else {
        NSLog(@"Successfully fetched %@ objects", [Household name]);
    }
    if (results.count > 0) {
        return results.firstObject;
    }
    return nil;
}

+ (instancetype)householdWithName:(NSString * _Nonnull)name {
    Household *household = [NSEntityDescription insertNewObjectForEntityForName:[self name] inManagedObjectContext:[NSManagedObjectContext managedObjectContext]];
    household.name = name;
    household.chores = [NSSet set];
    household.people = [NSSet set];
    household.archive = [NSSet set];
    [NSManagedObjectContext saveManagedObjectContext];
    return household;
}

@end
