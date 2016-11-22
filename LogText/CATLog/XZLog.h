
//
//  Created by zhuochunsheng on 16/6/30.
//  Copyright © 2016年 fenda. All rights reserved.

#import <Foundation/Foundation.h>

//#define FDLog(name,simple,detail) [XZLog logWrite:[NSString stringWithFormat:@"[%@:%d] %s",[NSString stringWithFormat:@"%s",__FILE__].lastPathComponent,__LINE__,__func__]  nameString:name simpleDescription:simple detailDescription:detail]

#define FDLog(name,simple,detail) [XZLog logFromWhom:name andSimpleLogDescription:simple andDetailLogDescription:detail andFileString:[NSString stringWithFormat:@"[%@:%d] %s",[NSString stringWithFormat:@"%s",__FILE__].lastPathComponent,__LINE__,__func__]]

#define FDColorLog(name,simple,detail,color) [XZLog logFromWhom:name andSimpleLogDescription:simple andDetailLogDescription:detail andFileString:[NSString stringWithFormat:@"[%@:%d] %s",[NSString stringWithFormat:@"%s",__FILE__].lastPathComponent,__LINE__,__func__] andColorString:color]

#define FDColor(r,g,b) [NSString stringWithFormat:@"%ld,%ld,%ld",(long)r,(long)g,(long)b]

@interface XZLog : NSObject

/**
 *  init log
 */
+(void)initLog;

/**
 *  log exception
 *
 *  @param exception
 */
+ (void)logCrash:(NSException *)exception;


/**
 *  设置文件夹保存几天的数据
 *
 *  @param number 多少天
 */
+(void)setNumberOfDaysToDelete:(NSInteger)number;

/**
 *  输入一个名称string和简单描述string、详细描述string
 *
 *  @param nameString      打印者的名称string
 *  @param simpleDescriptionString 简单描述string
 *  @param detailDescriptionString 详细描述string
 *  by xiaoZhuo   2016/06/29
 */
+ (void)logFromWhom:(NSString *)nameString andSimpleLogDescription:(NSString *)simpleDescriptionString andDetailLogDescription:(NSString *)detailDescriptionString andFileString:(NSString *)fileString;

/**
 *  输入一个名称string和简单描述string、详细描述string、字体颜色string
 *
 *  @param nameString      打印者的名称string
 *  @param simpleDescriptionString 简单描述string
 *  @param detailDescriptionString 详细描述string
 *  @param foreGroundColorString   字体颜色string
 *  by xiaoZhuo   2016/06/29
 */
+ (void)logFromWhom:(NSString *)nameString andSimpleLogDescription:(NSString *)simpleDescriptionString andDetailLogDescription:(NSString *)detailDescriptionString andFileString:(NSString *)fileString andColorString:(NSString *)foreGroundColorString;

@end