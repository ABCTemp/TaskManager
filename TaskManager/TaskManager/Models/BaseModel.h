//
//  BaseModel.h
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject
@property(strong, nonatomic) NSString * identifier;
@property(strong, nonatomic) NSString * name;
@property(strong, nonatomic) NSString * descriptionObject;
@end

NS_ASSUME_NONNULL_END
