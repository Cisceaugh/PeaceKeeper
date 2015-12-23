//
//  MakeChoreViewControllerDelegate.h
//  PeaceKeeper
//
//  Created by Work on 12/22/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EditAlertViewControllerDelegate <NSObject>

- (void)editAlertViewControllerDidSelectStartDate:(NSDate * _Nonnull)startDate repeatIntervalValue:(NSNumber * _Nonnull)repeatIntervalValue repeatIntervalUnit:(NSString * _Nonnull)repeatIntervalUnit;
- (void)editAlertViewControllerDidCancel;

@end
