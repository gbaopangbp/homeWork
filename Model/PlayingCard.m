//
//  PlayingCard.m
//  homeWork
//
//  Created by tirostiros on 14-12-11.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

-(NSString*)content
{
    NSArray *array = [PlayingCard allRank];
    return [[array objectAtIndex:self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)validSuits
{
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}

+(NSArray*)allRank
{
    return @[@"?",@"A",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(int)maxRank
{
    return [[self allRank] count];
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString*)suit
{
    return _suit?_suit:@"?";
}

@end
