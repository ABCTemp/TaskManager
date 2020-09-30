//
//  TMTask.m
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "TMTask.h"

@implementation TMTask
- (instancetype)initWithFirDocument:(FIRDocumentSnapshot *)firDoc
                         withMember: (NSArray *) firMembers {
    self = [super init];
    if (self) {
        self.identifier = firDoc.documentID;
        NSDictionary * dataDict = firDoc.data;
        self.name = dataDict[@"name"];
        self.done = dataDict[@"done"];
        self.createDate = dataDict[@"createDate"];
        self.dueDate = dataDict[@"dueDate"];
//        [self parseMemberData:firMembers];
    }
    return self;
}

- (void) parseMemberData: (NSArray *) firMembers {
    if (firMembers.count == 0) {
         return;
    }
        NSMutableArray * listTask = [[NSMutableArray alloc] init];
        for (FIRDocumentSnapshot * memberSnapshot in firMembers) {
            
        }
//        self.tasks = [listTask copy];
}

- (NSDictionary *)convertToDic {
    NSDictionary * dic = @{
        @"createDate": self.createDate,
        @"dueDate": self.dueDate
    };
    return dic;
}
@end
