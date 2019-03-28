//
//  VCCoinDao.m
//  Kcash
//
//  Created by liqiang on 2019/3/27.
//  Copyright © 2019年 Kcash. All rights reserved.
//

#import "VCCoinDao.h"

@implementation VCCoinDao

- (BOOL)open {
    return [self openWithKey:NSStringFromClass(self.class) andFlag:YES];
}

@end
