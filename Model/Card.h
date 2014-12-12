//
//  Card.h
//  homeWork
//
//  Created by tirostiros on 14-12-10.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(nonatomic,strong)NSString *content;
@property(nonatomic,getter = isMatched)BOOL matched;
@property(nonatomic,getter = isChose)BOOL chose;

-(int)match:(NSArray*)otherCards;

@end
