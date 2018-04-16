//
//  Player.h
//  2PlayerMath
//
//  Created by Alejandro Zielinsky on 2018-04-16.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property int score;
@property int lives;
@property NSString* name;

-(void)loseLife;

-(void)incrementScore;

@end
