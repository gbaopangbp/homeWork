//
//  Deck.m
//  homeWork
//
//  Created by tirostiros on 14-12-10.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property(nonatomic,strong)NSMutableArray* cards;
@end

@implementation Deck

-(NSMutableArray*)cards
{
    if (nil == _cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void)addCardatTop:(Card *)card atTop:(BOOL)atTop
{
    if (atTop)
    {
        [self.cards insertObject:card atIndex:0];
    }
    else
    {
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card
{
    [self addCardatTop:card atTop:NO];
}

-(Card*)drawRandomCard
{
    Card* card = nil;
    if ([self.cards count] > 0) {
        int index = arc4random()%[_cards count];
        card = [_cards objectAtIndex:index];
        [self.cards removeObject:card];
    }
    return  card;
}
@end
