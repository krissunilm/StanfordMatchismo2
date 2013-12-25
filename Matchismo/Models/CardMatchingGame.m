//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by sunil maganti on 12/24/13.
//  Copyright (c) 2013 sunil maganti. All rights reserved.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame()

@property ( nonatomic, readwrite) NSInteger score;

@property (nonatomic, strong) NSMutableArray *cards; //of Card

@end

@implementation CardMatchingGame


//lazy initialization of cards
- (NSMutableArray *) cards {
    
    
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
    
}

//designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    
    self = [super init];
    
    if ( self) {
        
        for( int i =0 ; i < count; i++) {
            
            Card *card = [deck drawRandomCard];
            if(card) {
            //self.cards[i] = card;  same as below line just clearer
            [self.cards addObject:card];
            
            } else {
                
                self = nil;
                break; // out of for loop
            }
        }
        
        
    }
    
    return self;
}


//no arg initializer to return nil

- (instancetype) init {
    
    return nil;
}



- (Card *) cardAtIndex:(NSUInteger)index {
    
    
    
    return  (index < [self.cards count]) ?  self.cards[index] : nil;
}

// alternate way to define constants
//#define is just substituting
//const is typed
//#define MISMATCH_PENALTY = 2;
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


- (void) chooseCardAtIndex:(NSUInteger)index        {
 
    Card *card = [self cardAtIndex:index];
    
    if(!card.isMatched) {
        
        if( card.isChosen) {
            card.chosen = NO;
        } else {
            //match against other card
            //go through internal data structure cards and see if there is a match
            
            for (Card *otherCard in self.cards)  {
                
                //for n card match need to store them in an array vs right now 2 card match
                if(otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    
                    if ( matchScore) {
                        
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                        
                    } else {
                        
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    
                 // break out of for once a match is found as only doing 2 card match
                    break;
                }
                
             }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
    
}

















@end
