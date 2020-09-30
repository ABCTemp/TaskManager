//
//  TMDbWrapper.m
//  TaskManager
//
//  Created by admin on 9/28/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "TMDbWrapper.h"
#import <CouchbaseLite/CouchbaseLite.h>

@interface TMDbWrapper()
@property (strong, nonatomic) CBLDatabase * db;
@end

@implementation TMDbWrapper
+ (instancetype)shared {
    static dispatch_once_t pred = 0;
    static TMDbWrapper * _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
        [_sharedObject initializedDb];
    });
    
    return _sharedObject;
}

- (void) initializedDb {
    NSError * error;
    @try {
        self.db = [[CBLDatabase alloc] initWithName:@"TMDataBase" error:&error];
    } @catch (NSException *exception) {
        NSLog(@"Can't create DB");
    } @finally {
        
    }
}
- (void)createProjectWithName:(NSString *)name andData:(NSDictionary *)dict {
    
}

- (void)getProjects {
    
}

- (void)updateProject:(NSString *)identifier withData:(NSDictionary *)dict {
    
}

- (void)removeProject:(NSString *)identifier {
    
}

- (void)createTaskWithName:(NSString *)name
               fromProject:(NSString *)projectId
                   andData:(nonnull NSDictionary *)dict{
    NSError * error;
    CBLDocument *document = [self.db documentWithID:projectId];
    CBLMutableDocument *mutableDocument = [document toMutable];
    
    for (NSString * key in dict.allKeys) {
        if([dict[key] isKindOfClass:[NSArray class]]) {
            CBLArray * items = dict[key];
//            [[CBLArray alloc] initWithData:dict[key]];
            [mutableDocument setArray:items forKey:key];
        } else {
             [mutableDocument setString:dict[key] forKey:key];
        }
    }
    
    [self.db saveDocument:mutableDocument error:&error];
}

- (void)getTasksByProject:(NSString *)identifier {
    
}

- (void)updateTask:(NSString *)identifier fromProject:(NSString *)projectId withData:(NSDictionary *)dict {
    
}

- (void)removeTask:(NSString *)identifier {
    
}

@end
