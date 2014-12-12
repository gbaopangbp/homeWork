//
//  Card.m
//  homeWork
//
//  Created by tirostiros on 14-12-10.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import "Card.h"

@implementation Card
@synthesize matched;
@synthesize chose;
@synthesize content;



-(int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards)
    {
        if ([self.content isEqualToString:card.content])
        {
            score = 1;
        }
    }
    
    return score;
}



@end
