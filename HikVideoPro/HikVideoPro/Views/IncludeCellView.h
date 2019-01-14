//
//  IncludeCellView.h
//  HospitalData
//
//  Created by JSG on 2018/11/30.
//  Copyright © 2018 JSG. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef enum : NSUInteger {
//    WJZ_SICK,//危机值患者
//    WJZ_Detail_XM,//危机值项目
//    WJZ_LXTJ,//危机值类型统计
//    WJZ_Detail_CLJD,//危机值处理节点
//    BLSJ_SICK,//不良事件患者
//    BLSJ_SBLXTJ,//不良事件上报类型统计
//    WZBRQJ_BZTJ,//危重抢救病种统计
//    KSS_ZLTJ,//抗生素使用种类统计
//} WJZ_DETAIL_TYPE;

NS_ASSUME_NONNULL_BEGIN

@interface IncludeCellView : UIView
@property (nonatomic,strong)NSArray *dataSource;
//@property (nonatomic,assign)WJZ_DETAIL_TYPE type;
@property (nonatomic,copy)void (^cellDidselectBlock)(NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
