//
//  VCPullData.m
//  Kcash
//
//  Created by liqiang on 2019/3/27.
//  Copyright © 2019年 Kcash. All rights reserved.
//

#import "VCPullData.h"
#import "VCCoinModel.h"
#import "VCCoinDao.h"

@interface VCPullData()

@end

@implementation VCPullData

- (void)get_web_coinrank {
    
    __block int currpage;
    __block int maxpage;
    
    if (self.currpage >= self.maxpage && self.currpage != 0) return;
    
    
    NSString *url = [NSString stringWithFormat:@"https://dncapi.bqiapp.com/api/coin/web-coinrank?page=%d&type=0&pagesize=100", self.currpage + 1];
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dd++;
        VCCoinDao *dao = [[VCCoinDao alloc] init];
        [dao open];
        [dao create:VCCoinModel.class];
        
        NSDictionary *dics = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *arrs = [dics objectForKey:@"data"];
        
        self.currpage = [NSString stringWithFormat:@"%@", [dics objectForKey:@"currpage"]].intValue;
        self.maxpage = [NSString stringWithFormat:@"%@", [dics objectForKey:@"maxpage"]].intValue;
        
        for (NSDictionary *dic in arrs) {
            VCCoinModel *coin = [VCCoinModel.class mj_objectWithKeyValues:dic];
            [dao save:coin];
        }
        
        [self get_web_coinrank];
        
        NSLog(@"%d", self.currpage);
    }];
    [task resume];
}

@end
