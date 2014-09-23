//
//  TSColumnData.h
//  TSUIKit
//
//  Created by Patrick Buchheit on 9/18/14.
//  Copyright (c) 2014 Viacheslav Radchenko. All rights reserved.
//
#import "TSTableView.h"
@interface TSColumnData : NSObject

@property (nonatomic) NSInteger index;
@property (nonatomic) CGFloat maxWidth;
@property (nonatomic) CGFloat currentWidth;
@property (nonatomic) CGFloat totalAdjustment;

-(instancetype) initFromTable:(TSTableView *) table atIndex:(NSInteger) index;
-(CGFloat) availableWidth;
-(CGFloat)adjustWidth:(CGFloat) adjustment;

@end
