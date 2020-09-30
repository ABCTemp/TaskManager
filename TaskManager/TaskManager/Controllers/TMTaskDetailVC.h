//
//  TMTaskDetailVC.h
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "BaseVC.h"
#import "XLFormViewController.h"
#import "TMProject.h"
#import "TMTaskDetailVM.h"
NS_ASSUME_NONNULL_BEGIN

@interface TMTaskDetailVC : XLFormViewController
@property (assign, nonatomic) BOOL isEdit;
@property (strong, nonatomic) TMTaskDetailVM * taskDetailVM;
@property (strong, nonatomic) TMProject * taskCollection;
@end

NS_ASSUME_NONNULL_END
