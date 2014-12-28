//
//  PlayViewController.m
//  homeWork
//
//  Created by tirostiros on 14-12-28.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import "PlayViewController.h"
#import "PlayingCardDeck.h"

@interface PlayViewController ()

@end

@implementation PlayViewController



-(Deck *)createCardDeck
{
    Deck *deck = [[PlayingCardDeck alloc] init];
    return  deck;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
