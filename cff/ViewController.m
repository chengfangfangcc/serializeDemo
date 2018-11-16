//
//  ViewController.m
//  cff
//
//  Created by powerful on 2017/9/24.
//  Copyright © 2017年 cff. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "TestModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TestModel *model = [[TestModel alloc] init];
    model.str = @"cff";
    NSLog(@"%ld",(long)[model numWithStr]);
    NSLog(@"%ld",(long)[model numHelperWithStr]);
    
    TestModel *model2 = [[TestModel alloc] init];
    model2 = model.copy;  //深拷贝,使用copy方法，copyWithZone会自动调用。这里TestModel必须重写copyWithZone（TestModel如果不重写copyWithZone，这里会崩溃）
//    model2 = model;       //浅拷贝，copyWithZone不会调用。
    NSLog(@"model=%@,model2=%@,%@",model,model2,model2.str);
    
    // Do any additional setup after loading the view, typically from a nib.
}


/*面向对象的程序在运行的时候会创建一个复杂的对象图，经常要以二进制的方法序列化这个对象图，这个过程叫做Archiving. 二进制流可以通过网络或写入文件中（来源于某教材的一段话）
理解是当你于写数据需要本地存储时，即将你的数据写到硬盘上的时候，你就必须对他进行序列化，转换成二进制文件，从而便于在磁盘上的读写，同理在取出的时候必须将其在反序列化，这样才能将数据读出来，就好比加密和揭秘的过程。*/
- (IBAction)save:(id)sender {
    
    Person *p = [[Person alloc] init];
    p.name = @"abc";
    p.age = 18;
    
    NSString *path = NSTemporaryDirectory();
    NSString *file = [path stringByAppendingString:@"Person.data"];
    
    //归档：存储数据到本地（先将数据序列化，再保存到本地）。如果不序列化数据，用NSKeyedArchiver直接保存数据到本地，会崩溃
    [NSKeyedArchiver archiveRootObject:p toFile:file];
    
    
}

- (IBAction)read:(id)sender {
    
    NSString *path = NSTemporaryDirectory();
    NSString *file = [path stringByAppendingString:@"Person.data"];
    
    //解档
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    NSLog(@"%@  %ld",p.name,(long)p.age);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
