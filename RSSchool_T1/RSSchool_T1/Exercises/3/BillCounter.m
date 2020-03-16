#import "BillCounter.h"

@implementation BillCounter

- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    int sumWithoutAlergicProduct = 0;
    
    for (int i = 0; i < bill.count; i++) {
        
        if (i == index) {
            continue;
        }
        sumWithoutAlergicProduct += bill[i].intValue;
    }
    
    int sharedBill = sumWithoutAlergicProduct / 2;
    
    if (sharedBill == sum.intValue) {
        return @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%d", sum.intValue - sharedBill];
    }
}

@end
