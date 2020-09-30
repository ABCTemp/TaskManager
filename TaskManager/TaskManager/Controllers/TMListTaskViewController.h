//
//  TMListTaskViewController.h
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "BaseVC.h"
#import "TMListTaskVM.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TMListTaskViewController : BaseVC
@property (strong, nonatomic) TMListTaskVM * listTaskVM;

- (id)initWithViewModel:(TMListTaskVM *)viewModel;

- (id)initWithViewModel:(TMListTaskVM *)viewModel nibName:(nullable NSString *)nibName bundle:(nullable NSBundle *)bundle;

+ (BOOL) isVertical;
+ (BOOL) isUpdateData;
@end

NS_ASSUME_NONNULL_END
