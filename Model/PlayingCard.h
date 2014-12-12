//
//  PlayingCard.h
//  homeWork
//
//  Created by tirostiros on 14-12-11.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(nonatomic,strong)NSString *suit;
@property(nonatomic)NSInteger rank;

+(NSArray*)validSuits;
+(NSInteger)maxRank;

@end
