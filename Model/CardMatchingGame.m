//
//  CardMatchingGame.m
//  homeWork
//
//  Created by tirostiros on 14-12-12.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Deck.h"

@interface CardMatchingGame()
@property(nonatomic,readwrite)NSInteger score;
@property(nonatomic,strong)NSMutableArray *cards;
@end

#define NO_MATCH_SCORE 2
#define MATCH_SCORE_TIME 4
#define CHOSE_COST 1


@implementation CardMatchingGame

-(NSMutableArray*)cards
{
    if (!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}


-(instancetype)initWithCardCount:(int)count andDeck:(Deck*) deck
{
    self = [super init];
    if (self)
    {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card)
            {
                [self.cards addObject:card];
            }
            else
            {
                self.cards = nil;
                break;
            }
        }
    }
    return self;
}

-(void)choseCardAtIndex:(NSInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched)
    {
        if (card.isChose)
        {
            card.chose = NO;
        }
        else
        {
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isChose && !otherCard.isMatched)
                {
                    int score = [card match:@[otherCard]];
                    if (score)
                    {
                        self.score += score * MATCH_SCORE_TIME;
                        card.matched = YES;
                        otherCard.matched = YES;
                        break;
                    }
                    else
                    {
                        self.score -= NO_MATCH_SCORE;
                        otherCard.chose = false;
                    }
                }
            }
            self.score -= CHOSE_COST;
            card.chose = YES;
        }
        
        
    }
}

-(Card*)cardAtIndex:(NSInteger)index
{
    return ([self.cards count] > index)?self.cards[index]:nil;
}

@end
