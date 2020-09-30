//
//  TMMember.m
//  TaskManager
//
//  Created by admin on 9/30/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "TMMember.h"

@implementation TMMember
- (instancetype) initWithFirDocument: (FIRDocumentSnapshot *) firDoc {
    self = [super init];
    if (self) {
        self.identifier = firDoc.documentID;
        NSDictionary * dataDict = firDoc.data;
        self.name = dataDict[@"name"];
//        self.done = dataDict[@"done"];
//        self.createDate = dataDict[@"createDate"];
//        self.dueDate = dataDict[@"dueDate"];
    }
    return self;
}
@end
