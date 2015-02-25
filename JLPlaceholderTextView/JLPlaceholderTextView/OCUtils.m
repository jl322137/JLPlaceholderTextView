//
//  OCUtils.m
//  JLPlaceholderTextView
//
//  Created by Aimy on 15/2/25.
//  Copyright (c) 2015年 Aimy. All rights reserved.
//

#import "OCUtils.h"

@implementation OCUtils

+ (NSStringDrawingOptions)stringDrawingOptions
{
    return NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
}

@end
