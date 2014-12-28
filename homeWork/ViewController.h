//
//  ViewController.h
//  homeWork
//
//  Created by tirostiros on 14-12-10.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonArray;

//虚函数
-(Deck *)createCardDeck;

@end
