//
//  CardMatchingGame.h
//  homeWork
//
//  Created by tirostiros on 14-12-12.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(int)count andDeck:(Deck*) deck;
-(void)choseCardAtIndex:(NSInteger)index;
-(Card*)cardAtIndex:(NSInteger)index;

@property(nonatomic,readonly)NSInteger score;

@end
