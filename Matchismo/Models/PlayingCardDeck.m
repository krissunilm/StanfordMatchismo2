//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by sunil maganti on 12/24/13.
//  Copyright (c) 2013 sunil maganti. All rights reserved.
//

#import "PlayingCardDeck.h"

@interface PlayingCardDeck()


@end


@implementation PlayingCardDeck


- (instancetype) init {
    
    self = [super init];
    
    if(self) {
        
        
        for ( NSString *suit in [PlayingCard validSuits]) {
            
                for( NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++ ) {
                    
                    
                    PlayingCard *card = [[PlayingCard alloc] init];
                    card.rank = rank;
                    card.suit = suit;
                    
                    [self addCard:card];
                    
                }
            
             
        }
            
        
        
    }
    
    return self;
    
}

@end
