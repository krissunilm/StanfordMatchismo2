//
//  Card.m
//  Matchismo
//
//  Created by sunil maganti on 12/24/13.
//  Copyright (c) 2013 sunil maganti. All rights reserved.
//

#import "Card.h"


//private properties can go in @interface in the .m file
@interface Card()


@end




@implementation Card



- (int)match:(NSArray *)otherCards {
    
    int score = 0;
    
    for( Card *card in otherCards) {
        
        
        if( [self.contents isEqualToString:card.contents]) {
            
            score = 1;
        }
        
        
    }
    
    
    
  
    return score;
    
}

@end
