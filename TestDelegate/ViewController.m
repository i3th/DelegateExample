//
//  ViewController.m
//  TestDelegate
//
//  Created by Aliaksei Smuhaliou on 9/18/14.
//  Copyright (c) 2014 Aliaksei Smuhaliou. All rights reserved.
//

#import "ViewController.h"
#import "UserProfile.h"
#import "AddUserViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, AddUserViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *users;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.users = [[NSMutableArray alloc] init];
}

- (IBAction)cancel:(UIStoryboardSegue *)segue {
  // do nothing
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"Add User"]) {
    AddUserViewController *dst = (AddUserViewController *)segue.destinationViewController;
    dst.delegate = self;
  }
}

#pragma mark - TableView
#pragma mark DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  UserProfile *user = self.users[indexPath.row];
  cell.textLabel.text = user.name;
  cell.detailTextLabel.text = user.email;
  return cell;
}

#pragma mark Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UserProfile *user = self.users[indexPath.row];
  NSString *message = [user.age stringValue];
  [[[UIAlertView alloc] initWithTitle:@"User age" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]
   show];
}

#pragma - mark AddUserViewControllerDelegate
-(void)addUserViewController:(AddUserViewController *)controller addUser:(UserProfile *)user {
  [self dismissViewControllerAnimated:YES completion:nil];
  [self.users addObject:user];
  [self.tableView reloadData];
}

@end
