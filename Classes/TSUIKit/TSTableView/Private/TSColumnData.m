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
        _minWidth = [table minimalWidthForColumnAtIndex:index];
        _currentWidth = [table widthForColumnAtIndex:index];
        _totalAdjustment = 0.0;
    }
    return self;
}

-(CGFloat) availableWidthIncrease
{
    return self.maxWidth - self.currentWidth - self.totalAdjustment;
}

-(CGFloat) availableWidthReduction
{
    return  self.currentWidth - self.minWidth - self.totalAdjustment;
}

-(CGFloat)increaseWidth:(CGFloat) adjustment
{
    if(self.availableWidthIncrease >= adjustment)
    {
        self.totalAdjustment += adjustment;
        return adjustment;
    }
    else
    {
        CGFloat actualAdjustment = adjustment - self.availableWidthIncrease;
        self.totalAdjustment += actualAdjustment;
        return actualAdjustment;
    }
}

-(CGFloat)reduceWidth:(CGFloat) adjustment
{
    if(self.availableWidthReduction >= adjustment)
    {
        self.totalAdjustment += adjustment;
        return adjustment;
    }
    else
    {
        CGFloat actualAdjustment = adjustment - self.availableWidthReduction;
        self.totalAdjustment += actualAdjustment;
        return actualAdjustment;
    }
}

@end
