#import "PalindromeSolver.h"

@implementation PalindromeSolver

- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    int numberOfDigits = n.intValue;
    int availableChanges = k.intValue;
    
    NSMutableString *resultString = [NSMutableString stringWithString:s];
    

    int necessaryChangesCounter = 0;
    for (int i = 0; i < numberOfDigits/2; i++) {
        
        NSString *firstNumber = [s substringWithRange:NSMakeRange(i, 1)];
        NSString *secondNumber = [s substringWithRange:NSMakeRange(numberOfDigits - (i + 1) , 1)];
        
        if (![firstNumber isEqualToString:secondNumber]) {
            necessaryChangesCounter++;
        }
    }
    int freeChanges = availableChanges - necessaryChangesCounter;
    
    
    if (freeChanges < 0) {
        return @"-1";
    }
    
    for (int i = 0; i<numberOfDigits/2; i++) {
        
        NSRange rangeOfFirstNumber = NSMakeRange(i, 1);
        NSRange rangeOfSecondNumber = NSMakeRange(numberOfDigits - (i + 1) , 1);
        
        NSString *firstNumber = [s substringWithRange:NSMakeRange(i, 1)];
        NSString *secondNumber = [s substringWithRange:NSMakeRange(numberOfDigits - (i + 1) , 1)];
        
        if (![firstNumber isEqualToString:secondNumber]) {
            if ([firstNumber isEqualToString:@"9"]) {
                [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfSecondNumber withString:@"9"]];
            } else if ([secondNumber isEqualToString:@"9"]) {
                [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfFirstNumber withString:@"9"]];
            } else if (freeChanges > 0) {
                [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfFirstNumber withString:@"9"]];
                [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfSecondNumber withString:@"9"]];
                freeChanges--;
            } else {
                if (firstNumber.intValue > secondNumber.intValue) {
                    [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfFirstNumber withString:firstNumber]];
                    [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfSecondNumber withString:firstNumber]];
                } else {
                    [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfFirstNumber withString:secondNumber]];
                    [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfSecondNumber withString:secondNumber]];
                }
            }
        } else if (freeChanges > 1) {
            [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfFirstNumber withString:@"9"]];
            [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfSecondNumber withString:@"9"]];
            freeChanges -= 2;
        } else {
            [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfFirstNumber withString:firstNumber]];
            [resultString setString:[resultString stringByReplacingCharactersInRange:rangeOfSecondNumber withString:secondNumber]];
        }
    }
    return resultString;
}

@end
