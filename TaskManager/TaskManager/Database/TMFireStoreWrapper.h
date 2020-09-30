//
//  TMFireStoreWrapper.h
//  TaskManager
//
//  Created by admin on 9/30/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Firebase;

NS_ASSUME_NONNULL_BEGIN
typedef void (^snapshotCallback)(FIRQuerySnapshot * _Nullable snapshot, NSError * error);

@interface TMFireStoreWrapper : NSObject
@property (strong, nonatomic) FIRFirestore * db;

+(instancetype) shared;
#pragma mark - CRUD Project
- (void) createProjectWithName: (NSString *) name
                       andData: (NSDictionary *) dict;

- (void) getProjects: (snapshotCallback) completion;

- (void) updateProject: (NSString *) identifier
              withData: (NSDictionary *) dict;

- (void) removeProject: (NSString *) identifier;

#pragma mark - CRUD Task
- (void) createTaskWithName: (NSString *) name
                fromProject: (NSString *) projectId
                    andData: (NSDictionary *) dict;

- (void) getTasksByProject: (NSString *) projectId
                completion: (snapshotCallback) completion;

- (void) updateTask: (NSString *) identifier
        fromProject: (NSString *) projectId
           withData: (NSDictionary *) dict;

- (void) removeTask: (NSString *) identifier fromProject: (NSString *) projectId;
@end

NS_ASSUME_NONNULL_END
