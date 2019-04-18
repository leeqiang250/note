//
//  VCCOIN.h
//  Kcash
//
//  Created by liqiang on 2019/3/27.
//  Copyright © 2019年 Kcash. All rights reserved.
//

#import "VCDBModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCCoinModel : VCDBModel

//@property (nonatomic, copy) NSString *code;
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *fullname;
//@property (nonatomic, copy) NSString *fullname_zh;
//@property (nonatomic, copy) NSString *logo;
//@property (nonatomic, copy) NSString *volumn;
//@property (nonatomic, copy) NSString *price;
//@property (nonatomic, copy) NSString *change_rate;
//@property (nonatomic, copy) NSString *circulate_amount;
//@property (nonatomic, copy) NSString *marketcap;
//@property (nonatomic, copy) NSString *line_data;
//@property (nonatomic, copy) NSString *totalsupply;
//
//@property (nonatomic, copy) NSString *current_price;
//@property (nonatomic, copy) NSString *current_price_usd;
//@property (nonatomic, copy) NSString *change_percent;
//@property (nonatomic, copy) NSString *market_value;
//@property (nonatomic, copy) NSString *vol;
//@property (nonatomic, copy) NSString *supply;
//@property (nonatomic, copy) NSString *rank;
//@property (nonatomic, copy) NSString *star_level;
//@property (nonatomic, copy) NSString *kline_data;
//@property (nonatomic, copy) NSString *market_value_usd;
//@property (nonatomic, copy) NSString *vol_usd;
//@property (nonatomic, copy) NSString *high_price;
//@property (nonatomic, copy) NSString *drop_ath;
//@property (nonatomic, copy) NSString *low_price;
//@property (nonatomic, copy) NSString *high_time;
//@property (nonatomic, copy) NSString *low_time;
//@property (nonatomic, copy) NSString *isifo;
//@property (nonatomic, copy) NSString *ismineable;

@property (nonatomic, copy) NSString *代码;
@property (nonatomic, copy) NSString *当前价;
@property (nonatomic, copy) NSString *中文;
@property (nonatomic, copy) NSString *名字;
@property (nonatomic, copy) NSString *最低价;
@property (nonatomic, copy) NSString *最低价时间;
@property (nonatomic, copy) NSString *最高价;
@property (nonatomic, copy) NSString *最高价时间;
@property (nonatomic, copy) NSString *流通市值;
@property (nonatomic, copy) NSString *成交量24;
@property (nonatomic, copy) NSString *流通量;
@property (nonatomic, copy) NSString *涨跌幅24;

@property (nonatomic, copy) NSString *前10;
@property (nonatomic, copy) NSString *前20;
@property (nonatomic, copy) NSString *前50;
@property (nonatomic, copy) NSString *前100;
//@property (nonatomic, copy) NSString *xxxxx;
//@property (nonatomic, copy) NSString *xxxxx;
//@property (nonatomic, copy) NSString *xxxxx;
//@property (nonatomic, copy) NSString *xxxxx;

- (void)ref:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
