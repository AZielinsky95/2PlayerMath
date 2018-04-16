//
//  ViewController.m
//  2PlayerMath
//
//  Created by Alejandro Zielinsky on 2018-04-16.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *player1Score;

@property (weak, nonatomic) IBOutlet UILabel *player2Score;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (nonatomic) GameModel *gameModel;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property (nonatomic) NSString* answer;

@property (weak, nonatomic) IBOutlet UILabel *correctOrFalseLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _gameModel = [[GameModel alloc] init];
    _answer = [[NSString alloc] init];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self displayQuestion];
}

-(void)restartGame
{
    [self.gameModel restartGame];
    self.player1Score.text = @"Player 1 : 0";
    self.player2Score.text = @"Player 2 : 0";
    [self displayQuestion];
}

-(void)displayQuestion
{
    self.questionLabel.text = [self.gameModel.currentPlayer name];
    self.questionLabel.text = [self.gameModel GenerateQuestion];
}

- (IBAction)numberButton:(UIButton *)sender
{
    NSInteger num = sender.tag;
    self.answerLabel.text = [ self.answerLabel.text stringByAppendingString:[@(num) stringValue]];
}

- (IBAction)EnterButton:(UIButton *)sender
{
    if([self.gameModel checkAnswer:[self.answerLabel.text intValue]])
    {
        [self.gameModel.currentPlayer incrementScore];
      //  self.questionLabel.text = @"Correct!";
        self.answerLabel.text =  @"";
        
        self.correctOrFalseLabel.textColor = [UIColor greenColor];
        self.correctOrFalseLabel.text = @"Correct";
        self.correctOrFalseLabel.alpha = 1.0;
        
        [UIView animateWithDuration:0.25 animations:^{
            self.correctOrFalseLabel.alpha = 0.0;
        }];
        
        if([self.gameModel.currentPlayer.name isEqualToString:self.gameModel.player1.name])
        {
            self.player1Score.text = [NSString stringWithFormat:@"Player 1 : %d",self.gameModel.player1.score];
        }
        else
        {
           self.player2Score.text = [NSString stringWithFormat:@"Player 2 : %d",self.gameModel.player2.score];
        }
        
        [self.gameModel nextPlayer];
        [self displayQuestion];
    }
    else
    {
        
        self.correctOrFalseLabel.textColor = [UIColor redColor];
        self.correctOrFalseLabel.text = @"False";
        self.correctOrFalseLabel.alpha = 1.0;
      //  [self.correctOrFalseLabel setAlpha:1.0f];
        [UIView animateWithDuration:0.25 animations:^{
            self.correctOrFalseLabel.alpha = 0.0;
        }];
       
        self.answerLabel.text = @"";
        [self.gameModel.currentPlayer loseLife];
        
        if(self.gameModel.currentPlayer.lives == 0)
        {
             self.questionLabel.text = [NSString stringWithFormat:@"%@ LOST ALL HIS LIVES",self.gameModel.currentPlayer.name];
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:self.questionLabel.text
                                                                           message:@"Would you like to Restart?."
                                                                    preferredStyle:UIAlertControllerStyleAlert];

            UIAlertAction *restart = [UIAlertAction actionWithTitle:@"Restart" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action){
                                    [self restartGame];
                                 }];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
            
            [alert addAction:restart];
            [alert addAction:cancel];
            [self presentViewController:alert animated:NO completion:nil];
        }
        else
        {
            [self displayQuestion];
            [self.gameModel nextPlayer];
        }
    }
}

@end
