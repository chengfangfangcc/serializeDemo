//
//  Person.h
//  cff
//
//  Created by powerful on 2017/9/24.
//  Copyright © 2017年 cff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;

@end
