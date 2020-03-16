#import "T1Array.h"

@implementation T1Array

bool isArrayHappy = NO;

- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    if (sadArray.count < 3) {
        return sadArray;
    }
    
    NSUInteger currentIndex = 1;
    NSMutableArray<NSNumber *> *happyArray = [NSMutableArray arrayWithArray:sadArray];
    
    while (currentIndex < happyArray.count - 1) {
        NSInteger nearestElementsSum = [happyArray[currentIndex - 1] intValue] + [happyArray[currentIndex + 1] intValue];
        
        if ([happyArray[currentIndex] intValue] > nearestElementsSum) {
            [happyArray removeObjectAtIndex:currentIndex];
            currentIndex = 1;
        } else {
            currentIndex++;
        }
    }
    
    return [NSArray arrayWithArray: happyArray];
}
@end
