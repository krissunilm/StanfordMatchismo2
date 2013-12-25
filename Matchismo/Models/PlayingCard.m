//
//  PlayingCard.m
//  Matchismo
//
//  Created by sunil maganti on 12/24/13.
//  Copyright (c) 2013 sunil maganti. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()


@end

@implementation PlayingCard

@synthesize suit = _suit;


- (int) match:(NSArray *)otherCards {
    
    int score = 0;

    NSLog(@"Inside Playing Card Match");
    //match only one card array need to change for assignment
    if ( [otherCards count] == 1) {
        
         NSLog(@"Inside Playing Card Match [otherCards count] == 1");
        
        //firstObject gets the first object in array if empty array then nil
        //without crashing vs. othercards[0];
        PlayingCard *otherCard = [otherCards firstObject];
        
        if( [self.suit isEqualToString:[otherCard suit]]) {
            NSLog(@"Inside Playing Card Match Matched Suit += 1");
            score = 1;
        } else if (self.rank == otherCard.rank ) {
            
            score = 4;
             NSLog(@"Inside Playing Card Match Matched Rank += 4");
            
        }
        
        
    }
    
    
    return score;
    
    
}


- (NSString *) contents {
    
    NSArray *rankString = [PlayingCard rankStrings];
    
    //NSArray *rankString = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    
    return [rankString[self.rank] stringByAppendingString:self.suit ];
    
   // not elegant as it will return 11Club for JackClub
   // return [NSString stringWithFormat:@"%d%@",self.rank,self.suit];
}

//set getter for suit to handle not being set return ?
-(NSString *) suit {
    
    return _suit ? _suit : @"?" ;
    
}

//static method for max rank

+ (NSUInteger ) maxRank {
    
    
    return [[self rankStrings] count] - 1;
    
}


//Create a static method for rankStrings

+ (NSArray *) rankStrings {
    
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}


//creating a static method for array of suits

+ (NSArray *) validSuits {
    
    
    return @[@"♣️",@"♠️",@"♥️",@"♦️"];
}


//protecting the setSuit method
- (void) setSuit:(NSString *) suit {
    
    
    if ( [ [PlayingCard validSuits] containsObject:suit] )
    {
        _suit = suit;
    }

}


- (void) setRank:(NSInteger) rank{
    
    if ( [PlayingCard maxRank] >= rank) {
        
        _rank = rank;
    }
    
    
}


@end
