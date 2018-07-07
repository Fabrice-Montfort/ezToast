//
//  ezToast.h
//  ezToast
//
//  Created by Fabrice Montfort on 29/01/2015.
//  Copyright (c) 2015 Fabrice Montfort. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "WToast.h"

@interface ezToast : NSObject

@end

void ezToastContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);
void ezToastContextFinalizer(FREContext ctx);

void ezToastInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);
void ezToastFinalizer(void* extData);