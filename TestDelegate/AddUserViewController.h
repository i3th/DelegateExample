//
//  AddUserViewController.h
//  TestDelegate
//
//  Created by Aliaksei Smuhaliou on 9/19/14.
//  Copyright (c) 2014 Aliaksei Smuhaliou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"

@class AddUserViewController;

extern const NSString *AUNameRequired;
extern const NSString *AUEmailRequired;
extern const NSString *AUAgeRequired;

@protocol AddUserViewControllerDelegate <NSObject>
- (void)addUserViewController:(AddUserViewController *)controller addUser:(UserProfile *)user;
@optional
- (NSArray *)addUserViewControllerRequiredFields:(AddUserViewController *)controller;
@end

@interface AddUserViewController : UIViewController
@property (nonatomic, weak) id<AddUserViewControllerDelegate> delegate;
@end
