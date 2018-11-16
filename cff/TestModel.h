//
//  TestModel.h
//  cff
//
//  Created by powerful on 2018/11/16.
//  Copyrigiht © 2018年 cff. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject<NSCopying,NSCoding>

@property (copy, nonatomic) NSString *str;

@property (assign, nonatomic) NSInteger num;

- (NSInteger)numWithStr;

@end


@interface TestModel (FFHelper)

- (NSInteger)numHelperWithStr;

@end

NS_ASSUME_NONNULL_END
