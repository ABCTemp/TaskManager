//
//  TMTaskCollection.h
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "TMTask.h"
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface TMProject : BaseModel
@property(strong, nonatomic) NSArray * tasks;
@property(strong, nonatomic) NSArray * members;
@property(strong, nonatomic) NSString * createDate;
@property(strong, nonatomic) NSString * dueDate;

- (instancetype) initWithFirDocument: (FIRQueryDocumentSnapshot * _Nullable) firProject;
- (NSDictionary *) convertToDic;

@end

NS_ASSUME_NONNULL_END
