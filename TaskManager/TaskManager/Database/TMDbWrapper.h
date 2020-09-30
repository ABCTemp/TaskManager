//
//  TMDbWrapper.h
//  TaskManager
//
//  Created by admin on 9/28/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TMDbWrapper : NSObject

+ (instancetype) shared;

#pragma mark - CRUD Project
- (void) createProjectWithName: (NSString *) name
                       andData: (NSDictionary *) dict;

- (void) getProjects;

- (void) updateProject: (NSString *) identifier
              withData: (NSDictionary *) dict;

- (void) removeProject: (NSString *) identifier;

#pragma mark - CRUD Task
- (void) createTaskWithName: (NSString *) name
                fromProject: (NSString *) projectId
                    andData: (NSDictionary *) dict;

- (void) getTasksByProject: (NSString *) identifier;

- (void) updateTask: (NSString *) identifier
        fromProject: (NSString *) projectId
           withData: (NSDictionary *) dict;

- (void) removeTask: (NSString *) identifier;
@end

NS_ASSUME_NONNULL_END
