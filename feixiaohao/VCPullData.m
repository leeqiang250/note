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

@property (nonatomic, assign) int currpage;
@property (nonatomic, assign) int maxpage;

@end

@implementation VCPullData

- (void)get_web_coinrank {
//    if (self.currpage >= self.maxpage && self.currpage != 0) {
        [self getCoininfo0];
//        return;
//    }
//
//    NSString *url = [NSString stringWithFormat:@"https://dncapi.bqiapp.com/api/coin/web-coinrank?page=%d&type=0&pagesize=100", self.currpage + 1];
//    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        VCCoinDao *dao = [[VCCoinDao alloc] init];
//        [dao open];
//        [dao create:VCCoinModel.class];
//
//        NSDictionary *dics = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSArray *arrs = [dics objectForKey:@"data"];
//
//        self.currpage = [NSString stringWithFormat:@"%@", [dics objectForKey:@"currpage"]].intValue;
//        self.maxpage = [NSString stringWithFormat:@"%@", [dics objectForKey:@"maxpage"]].intValue;
//
//        self.maxpage = 1;
//
//        for (NSDictionary *dic in arrs) {
//            VCCoinModel *coin = [[VCCoinModel alloc] initWithIdAndTime];
//            [coin ref:dic];
//            [dao save:coin];
//        }
//
//        [self get_web_coinrank];
//
//        NSLog(@"%d", self.currpage);
//    }];
//    [task resume];
}

- (void)getCoininfo0 {
    VCCoinDao *dao = [[VCCoinDao alloc] init];
    [dao open];
    NSArray *coins = [dao queryAll:VCCoinModel.class];
    for (VCCoinModel *coin in coins) {
        [self update_chicang:coin];
    }
}

- (void)update_chicang:(VCCoinModel *)model {
    VCCoinDao *dao = [[VCCoinDao alloc] init];
    [dao open];
    
    NSString *url = [NSString stringWithFormat:@"https://dncapi.bqiapp.com/api/coin/holders?code=%@", model.代码];
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dics = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *datas = [dics objectForKey:@"data"];
        NSString *code = [datas objectForKey:@"code"];
        NSString *percentage_top10 = [datas objectForKey:@"percentage_top10"];
        NSString *percentage_top20 = [datas objectForKey:@"percentage_top20"];
        NSString *percentage_top50 = [datas objectForKey:@"percentage_top50"];
        NSString *percentage_top100 = [datas objectForKey:@"percentage_top100"];
        if ([code isEqual:NSNull.null] || ![code isEqualToString:model.代码]) return;
        
        model.前10 = percentage_top10;
        model.前20 = percentage_top20;
        model.前50 = percentage_top50;
        model.前100 = percentage_top100;
        
        [dao update:model];
        
    }];
    [task resume];
}

@end
