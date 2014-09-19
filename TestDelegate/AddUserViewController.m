//
//  AddUserViewController.m
//  TestDelegate
//
//  Created by Aliaksei Smuhaliou on 9/19/14.
//  Copyright (c) 2014 Aliaksei Smuhaliou. All rights reserved.
//

#import "AddUserViewController.h"

const NSString *AUNameRequired = @"AUNameRequired";
const NSString *AUEmailRequired = @"AUEmailRequired";
const NSString *AUAgeRequired = @"AUAgeRequired";

@interface AddUserViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *ageFiled;

@end

@implementation AddUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addUser:(id)sender {
  
  if (! [self isRequiredFieldsFilled]) {
    [[[UIAlertView alloc] initWithTitle:@"No required field"
                                message:nil
                               delegate:nil
                      cancelButtonTitle:@"Ok"
                      otherButtonTitles:nil]
     show];
    return;
  }
  
  UserProfile *user = [[UserProfile alloc] init];
  user.name = self.nameField.text;
  user.email = self.emailField.text;
  NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
  user.age = [formatter numberFromString:self.ageFiled.text];
  [self.delegate addUserViewController:self addUser:user];
}

- (BOOL)isRequiredFieldsFilled {
  NSArray *requiredFields;
  // optional method. So ask does delegate have implementation.
  if ([self.delegate respondsToSelector:@selector(addUserViewControllerRequiredFields:)]) {
    requiredFields = [self.delegate addUserViewControllerRequiredFields:self];
  }
  
  if (requiredFields) {
    BOOL result = YES;
    if ([requiredFields containsObject:AUNameRequired]) {
      // if self.nameField.text empty set result to NO. (ANY VALUE) & NO = NO
      BOOL isEmpty = [self.nameField.text length] != 0;
      result = result & isEmpty;
    }
    if ([requiredFields containsObject:AUEmailRequired]) {
      // the same but less code
      BOOL isEmpty = [self.emailField.text length] != 0;
      result &= isEmpty;
    }
    if ([requiredFields containsObject:AUAgeRequired]) {
      // the same but less code
      result &= [self.ageFiled.text length] != 0;
    }
    // So even if one of check is negative(NO) we return NO;
    return result;
  } else { // requiredFields is nil. It means no restrictions
    return YES;
  }
}


@end
