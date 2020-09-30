//
//  TMTaskDetailVC.m
//  TaskManager
//
//  Created by admin on 9/24/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "TMTaskDetailVC.h"
#import "XLForm.h"

@interface TMTaskDetailVC ()
@property (strong, nonatomic) UIBarButtonItem * createBtn;
@end

@implementation TMTaskDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.taskDetailVM = [[TMTaskDetailVM alloc] init];
    [self.taskDetailVM createInstance];
    if (!_isEdit) {
        self.createBtn = [[UIBarButtonItem alloc] initWithTitle:@"Create" style: UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonPressed)];
        self.navigationItem.rightBarButtonItem = self.createBtn;
    }
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (void)initializeForm {
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:_isEdit ? [NSString stringWithFormat:@"%@",_taskCollection.name] : @"New Task"];
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"name" rowType:XLFormRowDescriptorTypeText title:@"Name"];
    [section addFormRow:row];
    
    self.form = form;
}

- (void) rightBarButtonPressed {
    NSDictionary * dict = self.formValues;
    NSLog(@"FORM VALUE: %@", dict);
    [self.taskDetailVM addData:dict];
    [self.navigationController popViewControllerAnimated:true];
}

@end
