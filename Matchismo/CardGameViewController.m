//
//  CardGameViewController.m
//  Matchismo
//
//  Created by sunil maganti on 12/24/13.
//  Copyright (c) 2013 sunil maganti. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"


@interface CardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *redealButton;

@end

@implementation CardGameViewController


- (CardMatchingGame *) game {
    
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    
    return _game;
}



- (void) reDeal {
    
  //This needs to call a reDEal method in the game that should reset the cards
    
    [self updateUI];
    
}

- (Deck *) createDeck {
    
    return [[PlayingCardDeck alloc ] init];
}


- (IBAction)touchRedealButton:(id)sender {
    
    [self reDeal];
    
}



- (IBAction)touchCardButton:(UIButton *)sender {
    
    
    
    int cardIndex = [self.cardButtons indexOfObject:sender];
    
    
    [self.game chooseCardAtIndex:cardIndex];
    
    [self updateUI];
    
  
    
    
    
    
}


- (void) updateUI {
    
    //go though UIButtons and basically keep the view updated with the model
    
    for ( UIButton *cardButton in self.cardButtons){
        
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
        
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    
    
}


- (NSString *) titleForCard:(Card *)card {
    
    return card.isChosen ? card.contents : nil;
    
    
    
}

- (UIImage *) backgroundImageForCard:(Card *) card {
    
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
