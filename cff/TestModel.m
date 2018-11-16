//
//  TestModel.m
//  cff
//
//  Created by powerful on 2018/11/16.
//  Copyright © 2018年 cff. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

#pragma mark - NSCopying
//深拷贝   让自定义模型有深拷贝能力。NSArray有深拷贝能力，直接调用copy方法就可以，系统会自动调用copyWithZone。自定义模型要有深拷贝能力，必须重写copyWithZone，然后调用copy方法，可以深拷贝模型
- (id)copyWithZone:(nullable NSZone *)zone {
    TestModel *model = [[[self class] alloc] init];
    model.str = self.str;
    model.num = self.num;
    return model;
}

#pragma mark - NSCoding
//序列化   将模型数据序列化，方便NSKeyedArchiver保存本地，NSKeyedArchiver保存本地时会调用该方法
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeConditionalObject:_str forKey:@"kStr"];
    [aCoder encodeInteger:_num forKey:@"kNum"];
}
//反序列化     NSKeyedArchiver获取本地数据时会调用该方法
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _str = [aDecoder decodeObjectForKey:@"kStr"];
        _num = [aDecoder decodeIntegerForKey:@"kNum"];
    }
    return self;
}


//模型数据序列化是方便保存本地，这里是从变量取值，可以不用序列化模型数据
- (NSInteger)numWithStr {
    if ([self.str isEqualToString:@"cff"]) {
        return 1;
    } else {
        return 2;
    }
}

@end

@implementation TestModel (FFHelper)

- (NSInteger)numHelperWithStr {
    if ([self.str isEqualToString:@"cff"]) {
        return 11;
    } else {
        return 22;
    }
}

@end
