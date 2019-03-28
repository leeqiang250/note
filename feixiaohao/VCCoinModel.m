//
//  VCCOIN.m
//  Kcash
//
//  Created by liqiang on 2019/3/27.
//  Copyright © 2019年 Kcash. All rights reserved.
//

#import "VCCoinModel.h"

@implementation VCCoinModel

- (instancetype)init {
    self = [super init];
    
    return self;
}

+ (NSArray *)propertyKeys {
    NSMutableArray *keys = [[NSMutableArray alloc] init];
    Class aClass = self;
    
    while (YES) {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(aClass, &outCount);
        
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            [keys addObject:propertyName];
        }
        
        free(properties);
        
        if (aClass == VCDBModel.class) {
            break;
        }
        aClass = [aClass superclass];
    }
    
    return keys;
}

- (NSArray *)propertyKeys {
    return [self.class propertyKeys];
}


- (void)ddd:(NSDictionary *)dic {
    self.当前价 = [dic objectForKey:@"current_price_usd"];
    self.中文 = [dic objectForKey:@"fullname"];
    self.名字 = [dic objectForKey:@"name"];
    self.最低价 = [dic objectForKey:@"low_price"];
    self.最低价时间 = [dic objectForKey:@"low_time"];
    self.最高价 = [dic objectForKey:@"high_price"];
    self.最高价时间 = [dic objectForKey:@"high_time"];
    self.流通市值 = [dic objectForKey:@"market_value_usd"];
    self.成交量24 = [dic objectForKey:@"vol_usd"];
    self.流通量 = [dic objectForKey:@"supply"];
    self.涨跌幅24 = [dic objectForKey:@"change_percent"];
    
    
    
}

@end
