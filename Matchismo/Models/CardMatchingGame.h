//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by sunil maganti on 12/24/13.
//  Copyright (c) 2013 sunil maganti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *) deck;

//reddeals the cards , sets the score to 0
// and get new cards
- (void) reDeal;

-(void) chooseCardAtIndex:(NSUInteger) index;

-(Card *)cardAtIndex:(NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;

@end
