//
//  CommonOrderData.m
//  Joypet
//
//  Created by Gino on 14-12-11.
//  Copyright (c) 2014年 yocava. All rights reserved.
//

#import "CommonCellData.h"

@implementation CommonCellData

-(id)init
{
    self = [super init];
    
    if (self) {
        _leftTitle = @"";
        _rightTitle = @"";
        
        _leftTitle2 = @"";
        _rightTitle2 = @"";
        
        _TAG = 0;
        _checkState = NO;
    }
    
    return self;
}



@end
