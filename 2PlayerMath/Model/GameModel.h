//
//  GameModel.h
//  2PlayerMath
//
//  Created by Alejandro Zielinsky on 2018-04-16.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
@interface GameModel : NSObject

@property NSString *question;
@property (nonatomic) NSInteger answer;

@property (nonatomic) NSInteger rightValue;
@property (nonatomic) NSInteger leftValue;
@property (nonatomic) Player *currentPlayer;

@property (nonatomic) Player *player1;
@property (nonatomic) Player *player2;


-(NSString*)GenerateQuestion;
-(bool)checkAnswer:(int)answer;
-(void)nextPlayer;
-(void)restartGame;

@end
