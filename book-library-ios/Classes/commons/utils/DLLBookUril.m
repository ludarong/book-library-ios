//
//  DLLBookUril.m
//  book-library-ios
//
//  Created by dll on 15/11/29.
//  Copyright © 2015年 dll. All rights reserved.
//

#import "DLLBookUril.h"
#import "TTHttpTool.h"
#import "DLLBook.h"
#import <MJExtension.h>

@implementation DLLBookUril

+(void)getWithIsbn:(NSString *)isbn success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSString *url = [@"http://bl.itfengzi.com/api/v1/book?isbn=" stringByAppendingString:isbn];
    [TTHttpTool getWithoutStorageWithURL:url parameters:nil success:^(id responseData) {
        int code = [responseData[@"code"] intValue];
        if (code == 200) {
            DLLBook *book = [DLLBook objectWithKeyValues:responseData[@"data"]];
            return success(book);
        }
        return failure(@"err");
    } failure:^(NSError *error) {
        return failure(error);
    }];
}


@end
