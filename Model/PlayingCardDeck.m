//
//  PlayingCardDeck.m
//  homeWork
//
//  Created by tirostiros on 14-12-11.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype)init
{
    self = [super init];
    if (self) {
        for (NSString * suit in [PlayingCard validSuits])
        {
            for (int rank = 1; rank <= [PlayingCard maxRank]; rank++)
            {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return  self;
}

@end
