//
//  Player.m
//  2PlayerMath
//
//  Created by Alejandro Zielinsky on 2018-04-16.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _score = 0;
        _lives = 3;
        _name = @"";
    }
    return self;
}

-(void)loseLife
{
    self.lives--;
}

-(void)incrementScore
{
    self.score++;
}

@end
