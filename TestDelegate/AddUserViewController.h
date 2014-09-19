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

@protocol AddUserViewControllerDelegate <NSObject>
- (void)addUserViewController:(AddUserViewController *)controller addUser:(UserProfile *)user;
@end

@interface AddUserViewController : UIViewController
@property (nonatomic, weak) id<AddUserViewControllerDelegate> delegate;
@end
