//
//  ViewController.m
//  cff
//
//  Created by powerful on 2017/9/24.
//  Copyright © 2017年 cff. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)save:(id)sender {
    
    Person *p = [[Person alloc] init];
    p.name = @"abc";
    p.age = 18;
    
    NSString *path = NSTemporaryDirectory();
    NSString *file = [path stringByAppendingString:@"Person.data"];
    
    //归档
    [NSKeyedArchiver archiveRootObject:p toFile:file];
    
    
}

- (IBAction)read:(id)sender {
    
    NSString *path = NSTemporaryDirectory();
    NSString *file = [path stringByAppendingString:@"Person.data"];
    
    //解档
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    NSLog(@"%@  %d",p.name,p.age);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
