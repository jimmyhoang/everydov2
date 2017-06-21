//
//  TaskViewController.m
//  EveryDoV2
//
//  Created by Jimmy Hoang on 2017-06-21.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "TaskViewController.h"

@interface TaskViewController ()
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextView;

@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults* defaults    = [NSUserDefaults standardUserDefaults];
    
    self.descriptionTextView.text   = [defaults objectForKey:@"description"];
    self.titleTextView.text         = [defaults objectForKey:@"title"];
    self.priorityTextView.text      = [(NSNumber *)[defaults objectForKey:@"priority"] stringValue];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions
- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)saveButtonPressed:(id)sender {
    NSUserDefaults* defaults    = [NSUserDefaults standardUserDefaults];
    NSString* title             = self.titleTextView.text;
    NSString* description       = self.descriptionTextView.text;
    NSNumber* priority          = [NSNumber numberWithInteger:[self.priorityTextView.text integerValue]];
    
    [defaults setObject:title forKey:@"title"];
    [defaults setObject:description forKey:@"description"];
    [defaults setObject:priority forKey:@"priority"];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
