//
//  SJTTrafficIndexModel.h
//  EChartDemo
//
//  Created by 陈云 on 2019/4/15.
//  Copyright © 2019 陈云. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJTTrafficIndexModel : NSObject
@property (nonatomic,copy)NSString *avgspeed;
@property (nonatomic,copy)NSString *conindex;
@property (nonatomic,copy)NSString *constatus;
@property (nonatomic,copy)NSString *createTime;
@property (nonatomic,copy)NSString *sectname;
@property (nonatomic,assign)int conclass;
@property (nonatomic,assign)int oid;

@end

NS_ASSUME_NONNULL_END
