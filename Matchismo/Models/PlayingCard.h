//
//  PlayingCard.h
//  Matchismo
//
//  Created by sunil maganti on 12/24/13.
//  Copyright (c) 2013 sunil maganti. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property ( nonatomic) NSInteger rank;


+ (NSArray *) validSuits;

+ (NSUInteger) maxRank;

//differ from prof i feel if you override it should be made public to let reader know what we have done
- (int) match:(NSArray *)otherCards ;

@end
