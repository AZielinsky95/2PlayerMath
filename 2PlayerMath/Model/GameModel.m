//
//  GameModel.m
//  2PlayerMath
//
//  Created by Alejandro Zielinsky on 2018-04-16.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _leftValue = 0;
        _rightValue = 0;
        _answer = 0;
        _question = [[NSString alloc] init];
        _player1 = [[Player alloc] init];
        _player2 = [[Player alloc] init];
        _currentPlayer = _player1;
        _player1.name = @"player1";
        _player2.name = @"player2";
    }
    return self;
}

-(void)restartGame
{
    self.currentPlayer = self.player1;
    self.player1.lives = 3;
    self.player2.lives = 3;
    self.player1.score = 0;
    self.player2.score = 0;
    
}

-(void)nextPlayer
{
    if(self.currentPlayer == self.player1)
    {
        self.currentPlayer = self.player2;
    }
    else
    {
        self.currentPlayer = self.player1;
    }
}

-(bool)checkAnswer:(int)answer
{
    return answer == self.answer;
}

//@property
-(NSString*)GenerateQuestion
{
    self.leftValue = arc4random_uniform(20) + 1;
    self.rightValue = arc4random_uniform(20) + 1;
    
    int questionType = arc4random_uniform(4) + 1;
    
    switch (questionType)
    {
        case 1:
            self.answer = self.leftValue + self.rightValue;
            self.question = [NSString stringWithFormat:@"%ld + %ld",(long)self.leftValue,(long)self.rightValue];
            break;
        case 2:
            self.answer = self.leftValue - self.rightValue;
            self.question = [NSString stringWithFormat:@"%ld - %ld",(long)self.leftValue,(long)self.rightValue];
            break;
        case 3:
            self.answer = self.leftValue * self.rightValue;
            self.question = [NSString stringWithFormat:@"%ld * %ld",(long)self.leftValue,(long)self.rightValue];
            break;
        case 4:
            self.answer = self.leftValue / self.rightValue;
            self.question = [NSString stringWithFormat:@"%ld / %ld",(long)self.leftValue,(long)self.rightValue];
            break;
        default:
            break;
    }
    
    return self.question;
}

@end
