//
//  CDObject+Extension.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDObject+Extension.h"
#import "AppDelegate.h"

@implementation CDObject (Extension)
+ (NSArray *)fetchObjectsOfClass:(__unsafe_unretained Class)aClass
                        sortedBy:(NSArray *)sortDescriptors
                    filterString:(NSString *)filterString
{
    NSArray *fetchedObjects = nil;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass(aClass)];
    if ([sortDescriptors count] > 0)
    {
        fetchRequest.sortDescriptors = sortDescriptors;
    }
    if (filterString.length > 0)
    {
        fetchRequest.predicate = [NSPredicate predicateWithFormat:filterString];
    }
    NSError *error = nil;
    NSManagedObjectContext *context = [[AppDelegate sharedDelegate] managedObjectContext];
    fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSAssert(error == nil, @"Error while fetching object of class: %@ with error:%@", [aClass description], [error localizedDescription]);
    return fetchedObjects;
}

+ (id) createNewObject{
    Class class = [self class];
    NSManagedObjectContext *context = [[AppDelegate sharedDelegate] managedObjectContext];

    
    id obj = [NSEntityDescription
                       insertNewObjectForEntityForName:NSStringFromClass([self class])
                       inManagedObjectContext:context];
    return obj;
}

- (void) fillWithDictionary:(NSDictionary*) dictionary{
    
}
@end
