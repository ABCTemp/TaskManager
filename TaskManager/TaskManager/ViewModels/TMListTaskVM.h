//
//  TMListTaskVM.h
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "BaseVM.h"
#import "TMProject.h"
#import "TMTask.h"
@import Firebase;
@import ReactiveObjC;

NS_ASSUME_NONNULL_BEGIN

@interface TMListTaskVM : BaseVM
@property (strong, nonatomic) NSMutableArray * items;
- (RACSignal *) getData;
- (void) createInstance;
@end

NS_ASSUME_NONNULL_END
