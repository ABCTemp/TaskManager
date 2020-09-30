//
//  TMListTaskVM.m
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "TMListTaskVM.h"
#import "TMFireStoreWrapper.h"

@interface TMListTaskVM()
@property (nonatomic, readwrite) FIRFirestore *db;
@property (strong, nonatomic) NSMutableArray * originalItems;
@end

@implementation TMListTaskVM

- (void) createInstance {
    self.db = [FIRFirestore firestore];
    self.items = [[NSMutableArray alloc] init];
}

- (RACSignal *) getData {
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
        [[TMFireStoreWrapper shared] getProjects:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nonnull error) {
            if (error != nil) {
                NSLog(@"ERROR GET FILE %@", error.localizedDescription);
                [subscriber sendError:error];
            } else {
                for (FIRQueryDocumentSnapshot * doc in snapshot.documents) {
                    TMProject * project = [[TMProject alloc] initWithFirDocument:doc];
                    [self.items addObject: project];
                }
                [subscriber sendNext: [self.items copy]];
                [subscriber sendCompleted];
            }
        }];
        return nil;
    }];
    
}
@end
