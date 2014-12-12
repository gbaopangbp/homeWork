//
//  Deck.h
//  homeWork
//
//  Created by tirostiros on 14-12-10.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card*)card;
-(void)addCardatTop:(Card*)card atTop:(BOOL)atTop;

-(Card*)drawRandomCard;


@end
