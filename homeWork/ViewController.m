//
//  ViewController.m
//  homeWork
//
//  Created by tirostiros on 14-12-10.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property(nonatomic) int clickCount;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property(nonatomic,strong) PlayingCardDeck* playDeck;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (nil  == _playDeck) {
        _playDeck = [[PlayingCardDeck alloc] init];
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} 

-(void)setClickCount:(int)clickCount
{
    _clickCount = clickCount;
    [self.showLabel setText:[NSString stringWithFormat:@"ClickCount:%d",clickCount]];
}

- (IBAction)pressCard:(id)sender {
    UIButton *myButton = (UIButton*)sender;
    
    if ([myButton.currentTitle length] == 0) {
        Card * card = [_playDeck drawRandomCard];
        [myButton setBackgroundImage:nil forState:UIControlStateNormal];

        if (card) {
            [myButton setTitle:[card content] forState:UIControlStateNormal];
        }
        else
        {
            [myButton setTitle:@"A♥️" forState:UIControlStateNormal];
        }
    }
    else
    {
        [myButton setBackgroundImage:[UIImage imageNamed:@"front.ong"] forState:UIControlStateNormal];

        [myButton setTitle:@"" forState:UIControlStateNormal];

    }
    self.clickCount++;
}
@end
