//
//  main.m
//  ColumnNames


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *line = @"702";
        
        NSDictionary *alphabetValuesDict = [NSDictionary dictionaryWithObjectsAndKeys:@"A", @"1", @"B", @"2", @"C", @"3", @"D", @"4", @"E", @"5", @"F", @"6", @"G", @"7", @"H", @"8", @"I", @"9", @"J", @"10", @"K", @"11", @"L", @"12", @"M", @"13", @"N", @"14", @"O", @"15", @"P", @"16", @"Q", @"17", @"R", @"18", @"S", @"19", @"T", @"20", @"U", @"21", @"V", @"22", @"W", @"23", @"X", @"24", @"Y", @"25", @"Z", @"26", nil];
        
        NSInteger lineInt = [line integerValue];
        NSInteger numberOfPlaces = 0;
        NSInteger sumOfPlaces = 0;
        
        NSMutableString *solutionString = [[NSMutableString alloc]init];

        while ([line integerValue] > sumOfPlaces) {
            numberOfPlaces ++ ;
            // build power of 26 without pow()
            NSInteger pow26 = 1;
            NSInteger m = 0;
            for (m = 0; m < numberOfPlaces; m++) {
                pow26 *= 26;
            }
            
            sumOfPlaces = sumOfPlaces + pow26 ;
        }
        NSLog(@"numberOfPlaces: %ld", numberOfPlaces);
        
        
        
        NSInteger i = 1;
        NSInteger loopCount = numberOfPlaces + 1;
        for (i = 1; i < loopCount; i++) {
        
            // must build pow() CodeEval does not allow pow()
            NSInteger twentySixToPower = 1;
            NSInteger k = 0;
            for (k = 0; k < i; k++) {
                twentySixToPower *= 26;
            }
            NSLog(@"twentySixToPower: %ld", twentySixToPower);
            // must build pow() CodeEval does not allow pow()
            NSInteger twentySixToOneLessPower = 1;
            NSInteger l = 0;
            for (l = 0; l < i - 1; l++) {
                twentySixToOneLessPower *= 26;
            }
            NSLog(@"twentySixToOneLessPower: %ld", twentySixToOneLessPower);
            
            if (lineInt % twentySixToPower == 0) {
                [solutionString insertString:[alphabetValuesDict valueForKey:@"26"] atIndex:0];
                NSLog(@"lineInt: %ld", lineInt);
                lineInt = lineInt - 26;
                numberOfPlaces = numberOfPlaces - 1;
                NSLog(@"lineInt: %ld", lineInt);
            }
            
            else {
                NSString *modulo = [NSString stringWithFormat:@"%ld", (lineInt % twentySixToPower) / twentySixToOneLessPower];
                [solutionString insertString:[alphabetValuesDict valueForKey:modulo] atIndex:0];
                NSLog(@"lineInt: %ld", lineInt);
                lineInt = lineInt - (lineInt % twentySixToPower);
                numberOfPlaces = numberOfPlaces - 1;
                NSLog(@"lineInt: %ld", lineInt);
            }
            
            if (numberOfPlaces == 1) {
                NSString *numString = [NSString stringWithFormat:@"%ld", lineInt / twentySixToPower];
                [solutionString insertString:[alphabetValuesDict valueForKey:numString] atIndex:0];
                break;
            }
        }

        NSLog(@"solutionString:%@", solutionString);
    }
    return 0;
}