//
//  ViewController.m
//  TouchID
//
//  Created by Spider on 8/4/15.
//  Copyright (c) 2015 Spider. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CIContext *context = [[CIContext alloc] init];
    
    NSError *error = nil;
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        // Auth User
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle@"Error"
                              message:@"Your device cannot"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
    localizedReason:@"Are you the device owner?"
     
                      reply:^(BOOL success, NSError *error) {
                          if (error) {
                              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                              message:@"There was a problem verifying your identity."
                                                                             delegate:nil
                                                                    cancelButtonTitle:@"Ok"
                                                                    otherButtonTitles:nil];
                              
                              [alert show];
                              
                              return;
                              
                          }
                          
                          if (success) {
                              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                              message:@"You are the device owner!"
                                                                             delegate:nil
                                                                    cancelButtonTitle:@"Ok"
                                                                    otherButtonTitles:nil];
                              
                              [alert show];
                              
                          } else {
                              
                              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                              message:@"You are not the device owner."
                                                                             delegate:nil
                                                                    cancelButtonTitle:@"Ok"
                                                                    otherButtonTitles:nil];
                              
                              [alert show];
                              
                          }
                          
                      }];
    
}

   
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
