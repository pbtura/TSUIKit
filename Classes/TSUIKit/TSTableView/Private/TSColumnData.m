//
//  TSColumnData.m
//  TSUIKit
//
//  Created by Patrick Buchheit on 9/18/14.
//  Copyright (c) 2014 Viacheslav Radchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSColumnData.h"
@implementation TSColumnData

-(instancetype)initFromTable:(TSTableView *)table atIndex:(NSInteger)index
{
    self = [super init];
    if(self)
    {
        _index = index;
        _maxWidth = [table maximalWidthForColumnAtIndex:index];
        _currentWidth = [table widthForColumnAtIndex:index];
        _totalAdjustment = 0.0;
    }
    return self;
}

-(CGFloat) availableWidth
{
    return self.maxWidth - self.currentWidth - self.totalAdjustment;
}

-(CGFloat)adjustWidth:(CGFloat) adjustment
{
    if(self.availableWidth > adjustment)
    {
        self.totalAdjustment += adjustment;
        return adjustment;
    }
    else
    {
        CGFloat actualAdjustment = adjustment - self.availableWidth;
        self.totalAdjustment += actualAdjustment;
        return actualAdjustment;
    }
}

@end
