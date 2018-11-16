//
//  Person.m
//  cff
//
//  Created by powerful on 2017/9/24.
//  Copyright © 2017年 cff. All rights reserved.
//

#import "Person.h"

@implementation Person

//序列化   读取实例变量，并把这些数据写到coder中去。序列化数据
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"kName"];
    [aCoder encodeInteger:_age forKey:@"kAge"];
}

//反序列化   从coder中读取数据，保存到相应的变量中，即反序列化数据
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"kName"];
        _age = [aDecoder decodeIntegerForKey:@"kAge"];
    }

    return self;
}


@end
