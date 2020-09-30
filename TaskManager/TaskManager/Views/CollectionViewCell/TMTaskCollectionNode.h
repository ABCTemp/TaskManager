//
//  TMTaskCollectionNode.h
//  TaskManager
//
//  Created by admin on 9/25/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "TMProject.h"
NS_ASSUME_NONNULL_BEGIN

@interface TMTaskCollectionNode : ASCellNode
@property (assign, nonatomic) BOOL isVeritcalLayout;
- (id) initWithTask: (TMProject *) task;
@end

NS_ASSUME_NONNULL_END
