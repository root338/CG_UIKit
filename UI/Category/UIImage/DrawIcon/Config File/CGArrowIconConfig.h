//
//  CGArrowIconConfig.h
//  TestCG_CGKit
//
//  Created by DY on 16/10/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGIconConfig.h"
#import "CGOrientationTypeHeader.h"

//箭头配置
@interface CGArrowIconConfig : CGIconConfig

/** 箭头的方向，默认CGOrientationTypeLeft */
//@property (nonatomic, assign) CGOrientationType arrowVertexOrientation;

/** 
 *  箭头顶点坐标，默认CGPointZero，表示方向位置边的中点
 *  @warning    会向内偏移一个点的距离，防锯齿
 */
@property (nonatomic, assign) CGPoint arrowVertex;

/** 箭头角度(1, 180)，默认为0，表示三点都在边的中点上 */
@property (nonatomic, assign) CGFloat angle;

/** 
 *  箭头偏移的的值，默认为0
 *  @warning    为了防止箭头的箭头没有全部绘制，而出现平箭头现象
 */
@property (nonatomic, assign) CGFloat arrowVertexOffset;

//-----自定义设置相对于箭头的左右坐标
@property (nonatomic, assign) CGPoint LeftVertex;
@property (nonatomic, assign) CGPoint rightVertex;

+ (instancetype)defaultArrowConfig;
@end