#import "Parser.h"

@implementation Parser

- (NSArray <NSString*>*)parseString:(NSString*)string {
 
    NSMutableString *inputString = [NSMutableString stringWithString:string];
    NSMutableArray *resultArray = [NSMutableArray array];
    
    NSCharacterSet *openSet = [NSCharacterSet characterSetWithCharactersInString:@"[(<"];
    
    
    for (int i = 0; i < inputString.length; i++) {
        
        NSString *currentChar = [inputString substringWithRange:NSMakeRange(i, 1)];
        
        if ([currentChar rangeOfCharacterFromSet:openSet].location != NSNotFound) {
            
            NSMutableString *substring = [NSMutableString string];
            int repeatCounter = 0;
            
            for (int j = i + 1; j < inputString.length; j++) {
                
                NSString *substringCharacter = [inputString substringWithRange:NSMakeRange(j, 1)];
                
                if ([substringCharacter isEqualToString:[self closedBracketFor:currentChar]] && repeatCounter == 0) {
                    [resultArray addObject:substring];
                    break;
                }
                if ([substringCharacter isEqualToString:[self closedBracketFor:currentChar]] && repeatCounter != 0){
                    [substring appendString:substringCharacter];
                    repeatCounter--;
                    continue;
                }
                if ([substringCharacter isEqualToString:currentChar]) {
                    repeatCounter++;
                    [substring appendString:substringCharacter];
                    continue;
                }
                [substring appendString:substringCharacter];
            }
        }
    }
    return resultArray;
}

- (NSString *)closedBracketFor:(NSString *)openBracket {
    
    if ([openBracket isEqualToString:@"["]) {
        return @"]";
    } else if ([openBracket isEqualToString:@"("]) {
        return @")";
    } else if ([openBracket isEqualToString:@"<"]) {
        return @">";
    } else {
        return @"";
    }
}

@end
