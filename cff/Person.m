//
//  Person.m
//  cff
//
//  Created by powerful on 2017/9/24.
//  Copyright © 2017年 cff. All rights reserved.
//

#import "Person.h"

@implementation Person

//归档需要实现的方法
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
}

//解档需要实现的方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntegerForKey:@"age"];
    }
    
    return self;
}


@end
