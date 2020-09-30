//
//  TMTaskDetailVM.h
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "BaseVM.h"
#import "TMTask.h"
NS_ASSUME_NONNULL_BEGIN

@interface TMTaskDetailVM : BaseVM
- (void) createInstance;
- (void) addData: (NSDictionary *) task;
- (void) updateData: (NSDictionary *) task with: (NSString *) identifier;
@end

NS_ASSUME_NONNULL_END
