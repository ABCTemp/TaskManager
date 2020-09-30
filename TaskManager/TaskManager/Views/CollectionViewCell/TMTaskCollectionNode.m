//
//  TMTaskCollectionNode.m
//  TaskManager
//
//  Created by admin on 9/25/20.
//  Copyright © 2020 Bach Van Hoang. All rights reserved.
//

#import "TMTaskCollectionNode.h"
#import "TMListTaskViewController.h"
@interface TMTaskCollectionNode()
@property (strong, nonatomic) ASImageNode * thumbNode;
@property (strong, nonatomic) ASButtonNode * aBtnNode;
@property (strong, nonatomic) ASTextNode * titleNode;
@property (strong, nonatomic) ASTextNode * subtitleNode;
@property (strong, nonatomic) ASTextNode * descriptionNode;
@end

@implementation TMTaskCollectionNode
- (id)initWithTask:(TMProject *) project {
    self = [super init];
    if (self) {
        [self configUI];
        [self configData:project];
        [self uiDebug];
        self.backgroundColor = [UIColor magentaColor];
    }
    return self;
}

- (void) configUI {
    self.titleNode = [[ASTextNode alloc] init];
    [self addSubnode:self.titleNode];
    
    self.subtitleNode = [[ASTextNode alloc] init];
    [self addSubnode:self.subtitleNode];
    
    self.descriptionNode = [[ASTextNode alloc] init];
    [self addSubnode:self.descriptionNode];
    
    self.thumbNode = [[ASImageNode alloc] init];
    self.thumbNode.image = [UIImage imageNamed:@"placeholder"];
    //self.thumbNode.frame = CGRectMake(0, 0, 100, 100);
    [self addSubnode:self.thumbNode];
    
    self.aBtnNode = [[ASButtonNode alloc] init];
    self.aBtnNode.imageNode.image = [UIImage systemImageNamed:@"book"];
    //self.aBtnNode.frame = CGRectMake(0, 0, 50, 50);
    [self addSubnode:self.aBtnNode];
}

- (void) configData: (TMProject *) project {
    self.titleNode.attributedText = [[NSAttributedString alloc] initWithString:project.name attributes:[self textAttributes]];
    self.subtitleNode.attributedText = [[NSAttributedString alloc] initWithString:project.name attributes:[self textAttributes]];
    self.descriptionNode.attributedText = [[NSAttributedString alloc] initWithString:project.name attributes:[self textAttributes]];
}

- (void) uiDebug {
    self.thumbNode.backgroundColor = [UIColor greenColor];
    self.aBtnNode.backgroundColor = [UIColor blueColor];
    self.titleNode.backgroundColor = [UIColor blackColor];
    self.subtitleNode.backgroundColor = [UIColor cyanColor];
    self.descriptionNode.backgroundColor = [UIColor brownColor];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec * titleVerticalStack = [ASStackLayoutSpec verticalStackLayoutSpec];
    titleVerticalStack.children = @[_titleNode, _subtitleNode, _descriptionNode];
    
    if ([TMListTaskViewController isVertical]) {
        _thumbNode.style.preferredSize = CGSizeMake(200, 200);
        _aBtnNode.style.preferredSize = CGSizeMake(300 , 50);
        
        ASStackLayoutSpec * verticalLayout = [ASStackLayoutSpec
                                              stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                              spacing:30.0f
                                              justifyContent:ASStackLayoutJustifyContentStart
                                              alignItems: ASStackLayoutAlignItemsCenter
                                              children:@[_thumbNode, titleVerticalStack, _aBtnNode]];
        return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 8, 8, 8) child: verticalLayout];
    } else {
        _thumbNode.style.preferredSize = CGSizeMake(100, 100);
        _aBtnNode.style.preferredSize = CGSizeMake(100, 100);
        
        ASStackLayoutSpec * horizontalStack = [ASStackLayoutSpec
                                               stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                               spacing:30.0f
                                               justifyContent:ASStackLayoutJustifyContentStart
                                               alignItems: ASStackLayoutAlignItemsCenter
                                               children:@[_thumbNode, titleVerticalStack, _aBtnNode]];
        
        return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 8, 8, 8) child: horizontalStack];
    }
}

- (NSDictionary *)textAttributes
{
    return @{
        NSFontAttributeName: [UIFont systemFontOfSize:18.0],
        NSForegroundColorAttributeName: [UIColor whiteColor],
    };
}
@end
