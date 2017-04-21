//
//  HistoryDateModel.h
//  ZYIMC
//
//  Created by wyhaiapple on 2017/3/24.
//  Copyright © 2017年 钱李林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryDateModel : NSObject
/*{
    cos = 60;
    cosa = 25;
    cosb = 73;
    cosc = 17;
    devId = 8a3ae71e5ac56347015ac6520afd0002;
    fixTimeDate = 1490318100000;
    ia = 11;
    ib = 25;
    ic = 10;
    id = 6850D4BD6268485BB1F3F18FEF64112C;
    p = 198;
    pa = 118;
    pb = 137;
    pc = 177;
    q = 35;
    qa = 44;
    qb = 54;
    qc = 53;
    recTime = 1490317739000;
    s = 128;
    sa = 126;
    sb = 168;
    sc = 107;
    ua = 10116;
    ub = 10118;
    uc = 10687;
}*/

/** id */
@property(strong,nonatomic) NSString *id;
/** 设备ID */
@property(strong,nonatomic) NSString *devId;
/** 时间 */
@property(assign,nonatomic) long long fixTimeDate;

/** 记录时间 */
@property(assign,nonatomic) long long recTime;

/** 无功功率总 */
@property(strong,nonatomic) NSString *q;
/** 无功功率A */
@property(strong,nonatomic) NSString *qa;
/** 无功功率B */
@property(strong,nonatomic) NSString *qb;
/** 无功功率C */
@property(strong,nonatomic) NSString *qc;

/** 电流A */
@property(strong,nonatomic) NSString *ia;
/** 电流B */
@property(strong,nonatomic) NSString *ib;
/**  电流C */
@property(strong,nonatomic) NSString *ic;

/** 电压A */
@property(strong,nonatomic) NSString *ua;
/** 电压B */
@property(strong,nonatomic) NSString *ub;
/** 电压C */
@property(strong,nonatomic) NSString *uc;


/** 视在功率总 */
@property(strong,nonatomic) NSString *s;
/** 视在功率A */
@property(strong,nonatomic) NSString *sa;
/** 视在功率B */
@property(strong,nonatomic) NSString *sb;
/** 视在功率C */
@property(strong,nonatomic) NSString *sc;

/** 有功功率总 */
@property(strong,nonatomic) NSString *p;
/** 有功功率A */
@property(strong,nonatomic) NSString *pa;
/** 有功功率B */
@property(strong,nonatomic) NSString *pb;
/** 有功功率C */
@property(strong,nonatomic) NSString *pc;

/** 功率因数总 */
@property(strong,nonatomic) NSString *cos;
/** 功率因数A */
@property(strong,nonatomic) NSString *cosa;
/** 功率因数B */
@property(strong,nonatomic) NSString *cosb;
/** 功率因数C */
@property(strong,nonatomic) NSString *cosc;
@end
