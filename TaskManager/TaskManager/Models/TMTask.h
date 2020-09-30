//
//  TMTask.h
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface TMTask : BaseModel
@property(strong, nonatomic) NSString * createDate;
@property(strong, nonatomic) NSString * dueDate;
@property(assign, nonatomic) BOOL done;

- (instancetype) initWithFirDocument: (FIRDocumentSnapshot *) firDoc
                          withMember: (NSArray *) firMembers;
- (NSDictionary *) convertToDic;
@end

NS_ASSUME_NONNULL_END
