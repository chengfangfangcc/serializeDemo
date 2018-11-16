//
//  Person.h
//  cff
//
//  Created by powerful on 2017/9/24.
//  Copyright © 2017年 cff. All rights reserved.
//

#import <Foundation/Foundation.h>

//遵循NSCoding协议，重写NSCoding里面的序列化和反序列化方法，序列化和反序列化方法重写之后会自动调用
@interface Person : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end
