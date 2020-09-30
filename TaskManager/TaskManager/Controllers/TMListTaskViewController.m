//
//  TMListTaskViewController.m
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

@import Firebase;
#import "TMListTaskViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "TMTaskCollectionNode.h"
#import "TMTaskDetailVC.h"

@interface TMListTaskViewController () <ASCollectionDataSource, ASCollectionDelegateFlowLayout>
@property (strong, nonatomic) ASCollectionNode * collectionNode;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@end

@implementation TMListTaskViewController
static BOOL isVerticalStyle;
CGFloat const verticalHeight = 400;
CGFloat const horizontalHeight = 120;

- (id)initWithViewModel:(TMListTaskVM *)viewModel {
    return [self initWithViewModel:viewModel nibName:nil bundle:nil];
}

- (id)initWithViewModel:(TMListTaskVM *)viewModel nibName:(NSString *)nibName bundle:(NSBundle *)bundle {
    self = [super initWithNibName:nibName bundle:bundle];
    if (self) {
        
    }
    return self;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style: UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonPressed)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Change Style" style: UIBarButtonItemStylePlain target:self action:@selector(changeStylePressed)];
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, horizontalHeight);
    self.collectionNode = [[ASCollectionNode alloc] initWithCollectionViewLayout:self.layout];
    [self.view addSubnode:self.collectionNode];
    
    self.collectionNode.frame = self.view.bounds;
    [self addDelegate];
    [self addObserverable];
}

- (void) addDelegate {
    self.collectionNode.delegate = self;
    self.collectionNode.dataSource = self;
}

- (void) addObserverable {
    self.listTaskVM = [[TMListTaskVM alloc] init];
    [self.listTaskVM createInstance];
    
    [[self.listTaskVM getData] subscribeNext:^(NSMutableArray * _Nullable items) {
        [self.collectionNode reloadData];
    }];
}

- (void) rightBarButtonPressed {
    TMTaskDetailVC * taskVC = [[TMTaskDetailVC alloc] init];
    taskVC.isEdit = false;
    [self.navigationController pushViewController:taskVC animated:true];
}

+ (BOOL) isVertical {
    return isVerticalStyle;
}

- (void) changeStylePressed {
    isVerticalStyle = !isVerticalStyle;
    if (isVerticalStyle) {
         self.layout.itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, verticalHeight);
    } else {
        self.layout.itemSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, horizontalHeight);
    }
    [self.collectionNode reloadData];
}

#pragma mark - CollectionNode DataSource
- (NSInteger)numberOfSectionsInCollectionNode:(ASCollectionNode *)collectionNode {
    return 1;
}

- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section {
    return self.listTaskVM.items.count;
}

- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
    TMProject * task = self.listTaskVM.items[indexPath.item];
    return ^{
        TMTaskCollectionNode * node = [[TMTaskCollectionNode alloc] initWithTask:task];
        node.debugName = [NSString stringWithFormat:@"cell %zd", indexPath.row];
        return node;
    };
}
@end
