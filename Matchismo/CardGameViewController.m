//
//  CardGameViewController.m
//  Matchismo
//
//  Created by sunil maganti on 12/24/13.
//  Copyright (c) 2013 sunil maganti. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipLabel;

@property (nonatomic) int flipCount;


@property (nonatomic) Deck *myDeck;

@end

@implementation CardGameViewController


- (Deck *) myDeck {
    
    if( !_myDeck) _myDeck = [[ PlayingCardDeck alloc] init];
    
    return _myDeck;
    
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@" Flips : %d", self.flipCount];
    
    NSLog(@"FlipCount = %d", self.flipCount);
    
    
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    
    
    

    
    
    
    if([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        
        [sender setTitle:@"" forState:UIControlStateNormal];
    
    } else {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        
        
        //original now need to get it from PlayingCardDeck
        //[sender setTitle:@"A♣️" sforState:UIControlStateNormal];
        
        
        //ok but if user clicks 105 times then we will run out of cards
        //[sender setTitle:[self.myDeck drawRandomCard].contents forState:UIControlStateNormal];
        
        PlayingCard *currentCard = (PlayingCard *)[self.myDeck drawRandomCard];
        
        if(currentCard) {
            [sender setTitle:currentCard.contents forState:UIControlStateNormal];
            
        } else {
            _myDeck = [[ PlayingCardDeck alloc] init];
            [sender setTitle:[self.myDeck drawRandomCard].contents forState:UIControlStateNormal];
        }
        
    }
    
    self.flipCount++;
    
    
    
    
    
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
