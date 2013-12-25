//
//  Deck.h
//  Matchismo
//
//  Created by sunil maganti on 12/24/13.
//  Copyright (c) 2013 sunil maganti. All rights reserved.
//

//#import <Foundation/Foundation.h>
@import Foundation;

#import "Card.h"

@interface Deck : NSObject


- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;


- (Card *)drawRandomCard;

@end
