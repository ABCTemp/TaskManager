//
//  TMFireStoreWrapper.m
//  TaskManager
//
//  Created by admin on 9/30/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "TMFireStoreWrapper.h"

NSString * const kProject = @"Project";
NSString * const kTask = @"Task";

@interface TMFireStoreWrapper()
@end

@implementation TMFireStoreWrapper

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static TMFireStoreWrapper * _sharedObject = nil;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc] init];
        _sharedObject.db = [FIRFirestore firestore];
    });
    return _sharedObject;
}

- (FIRCollectionReference *) queryCollectionPath: (NSString *) path {
    return [self.db collectionWithPath:path];
}

- (void)createProjectWithName:(NSString *)name andData:(NSDictionary *)dict {
    FIRDocumentReference * projectRef = [[self.db collectionWithPath:kProject]
                                         documentWithAutoID];
    [projectRef setData:dict];
}

- (void)getProjects:(snapshotCallback)completion {
    [[self.db collectionWithPath:kProject] getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        completion(snapshot, error);
    }];
}

- (void)updateProject:(NSString *)identifier withData:(NSDictionary *)dict {
    FIRDocumentReference *updateProject = [[self.db collectionWithPath:kProject]
                                           documentWithPath: identifier];
    [updateProject updateData: dict completion:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"ERROR ADD FILE %@", error.localizedDescription);
        } else {
            NSLog(@"Document Updated");
        }
    }];
}

- (void)removeProject:(NSString *)identifier {
    [[[self.db collectionWithPath:kProject]
      documentWithPath:identifier]
     deleteDocumentWithCompletion:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error removing document: %@", error);
        } else {
            NSLog(@"Document successfully removed!");
        }
    }];
}

- (void)createTaskWithName:(NSString *)name
               fromProject:(NSString *)projectId
                   andData:(NSDictionary *)dict {
    FIRDocumentReference * taskRef = [[[[self.db collectionWithPath:kProject]
                                        documentWithPath:projectId]
                                       collectionWithPath:kTask]
                                      documentWithAutoID];
    [taskRef setData:dict];
}

- (void)getTasksByProject:(NSString *) projectId
               completion:(snapshotCallback)completion {
    [[[[self.db collectionWithPath:kProject]
       documentWithPath:projectId]
      collectionWithPath:kTask]
     getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        completion(snapshot, error);
    }];
}

- (void)updateTask:(NSString *)identifier
       fromProject: (NSString *) projectId
          withData:(NSDictionary *)dict {
    FIRDocumentReference *updateTask = [[[[self.db collectionWithPath:kProject]
                                          documentWithPath: projectId]
                                         collectionWithPath:kTask]
                                        documentWithPath:identifier];
    [updateTask updateData: dict completion:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"ERROR ADD FILE %@", error.localizedDescription);
        } else {
            NSLog(@"Document Updated");
        }
    }];
}

- (void)removeTask:(NSString *)identifier fromProject:(nonnull NSString *)projectId {
    [[[[[self.db collectionWithPath:kProject]
        documentWithPath:projectId] collectionWithPath:kTask]
      documentWithPath:identifier]
     deleteDocumentWithCompletion:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error removing document: %@", error);
        } else {
            NSLog(@"Document successfully removed!");
        }
    }];
}
@end
