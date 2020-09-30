//
//  TMTaskDetailVM.m
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "TMTaskDetailVM.h"
#import "TMFireStoreWrapper.h"

@interface TMTaskDetailVM()
@end

@implementation TMTaskDetailVM
- (void) createInstance {
}

/// create filestore collections
/// @param task <#task description#>
- (void)addData: (NSDictionary *) task {
    [[TMFireStoreWrapper shared] createProjectWithName:@"" andData:task];
}

/// <#Description#>
/// @param task <#task description#>
/// @param identifier <#identifier description#>
- (void)updateData: (NSDictionary *) task with: (NSString *) identifier {
    [[TMFireStoreWrapper shared] updateProject:identifier withData:task];
}
@end
