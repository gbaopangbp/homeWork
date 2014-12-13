//
//  ViewController.m
//  homeWork
//
//  Created by tirostiros on 14-12-10.
//  Copyright (c) 2014年 cn.com.tiros. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property(nonatomic)int score;
@property (nonatomic,strong)CardMatchingGame *game;


@end

@implementation ViewController

-(CardMatchingGame*)game
{
    if (!_game)
    {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.buttonArray count] andDeck:[self createCardDeck]];
    }
    return _game;
}

//import注释1
// 类内部的成员，可以通过重载getter方法进行初始化，
//这样做可以方便使用，保证调用时都经过初始化，而且不需要单独的初始化过程
//另外这么做也可以实现lazyinit，尽量晚的初始化
//注意事项，定义的setter函数后，其他地铁都不要使用_开头的变量，因为使用这个变量不会调用getter函数，所有都用self.的格式进行调用
//-(PlayingCardDeck*)playDeck
//{
//    if (!_playDeck) {
//        _playDeck = [self createCardDeck];
//    }
//    return _playDeck;
//}

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


//MVC设计模式，所有的数据都放到model中
//本例子中，Card通用牌，PlayCard，特殊指定扑克牌，Deck通用牌堆，PlayDeck特定52张纸牌堆，和PlayCard相关
//CardMatchGame为本游戏的游戏模型，游戏的逻辑都应该放在这里面处理
//本controler只包含game游戏数据逻辑，buttonArray界面显示的view
//同国view的- (IBAction)pressCard:(id)sender接受view事件传给model game，game自动处理完成
//controller根据game的数据updateUI
//这样结构会比较清晰

- (IBAction)pressCard:(id)sender
{
    int index = [self.buttonArray indexOfObject:sender];
    [self.game choseCardAtIndex:index];
    [self updateUI];
}

-(NSString*)geButtonTitle:(Card*)card
{
    return (card.chose)?[card content]:@"";
}

-(UIImage*)getButtonBackground:(Card*)card
{
    return (card.chose)?nil:[UIImage imageNamed:@"front"];
}

-(void)updateUI
{
    for (UIButton *button in self.buttonArray) {
        int index = [self.buttonArray indexOfObject:button];
        Card *card = [self.game cardAtIndex:index];
        [button setTitle:[self geButtonTitle:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self getButtonBackground:card] forState:UIControlStateNormal];
        button.enabled = !card.matched;
        
        [self.scoreLabel setText:[NSString stringWithFormat:@"Score:%d",[self.game score]]];
    }
}
@end
