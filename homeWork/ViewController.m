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


// 类内部的成员，可以通过重载getter方法进行初始化，
//这样做可以方便使用，保证调用时都经过初始化，而且不需要单独的初始化过程
//另外这么做也可以实现lazyinit，尽量晚的初始化
//注意事项，定义的setter函数后，其他地铁都不要使用_开头的变量，因为使用这个变量不会调用getter函数，所有都用self.的格式进行调用
-(PlayingCardDeck*)playDeck
{
    if (!_playDeck) {
        _playDeck = [self createCardDeck];
    }
    return _playDeck;
}

-(PlayingCardDeck *)createCardDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (void)viewDidLoad
{
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
        Card * card = [self.playDeck drawRandomCard];
        [myButton setBackgroundImage:nil forState:UIControlStateNormal];

        if (card) {
            [myButton setTitle:[card content] forState:UIControlStateNormal];
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
