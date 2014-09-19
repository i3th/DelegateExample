//
//  AddUserViewController.m
//  TestDelegate
//
//  Created by Aliaksei Smuhaliou on 9/19/14.
//  Copyright (c) 2014 Aliaksei Smuhaliou. All rights reserved.
//

#import "AddUserViewController.h"

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
  UserProfile *user = [[UserProfile alloc] init];
  user.name = self.nameField.text;
  user.email = self.emailField.text;
  NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
  user.age = [formatter numberFromString:self.ageFiled.text];
  [self.delegate addUserViewController:self addUser:user];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
