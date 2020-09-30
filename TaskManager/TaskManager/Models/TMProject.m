//
//  TMTaskCollection.m
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "TMProject.h"

@implementation TMProject
- (instancetype)initWithFirDocument:(FIRQueryDocumentSnapshot *) firProject{
    self = [super init];
       if (self) {
           NSDictionary * dataDict = firProject.data;
           self.identifier = firProject.documentID;
           self.name = dataDict[@"name"];
           self.createDate = dataDict[@"createDate"];
           self.dueDate = dataDict[@"dueDate"];
       }
       return self;
}

- (void) parseTaskData: (NSArray *) firTasks {
    if (firTasks.count == 0) {
        return;
    }
//    NSMutableArray * listTask = [[NSMutableArray alloc] init];
//    for (FIRDocumentSnapshot * taskSnapshot in firTasks) {
//        TMTask * task = [[TMTask alloc] initWithFirDocument:taskSnapshot];
//        [listTask addObject:task];
//    }
//    self.tasks = [listTask copy];
}

- (NSDictionary *)convertToDic {
    NSDictionary * dic = @{
        @"createDate": self.createDate,
        @"dueDate": self.dueDate
    };
    return dic;
}
@end
