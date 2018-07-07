//
//  ezToast.m
//  ezToast
//
//  Created by Fabrice Montfort on 29/01/2015.
//  Copyright (c) 2015 Fabrice Montfort. All rights reserved.
//

#import "ezToast.h"

@implementation ezToast

@end

FREObject init (FREContext context, void* functionData, uint32_t argc, FREObject argv[]) {
    
    @autoreleasepool {
        
        return nil;
    }
}

FREObject isSupported (FREContext context, void* functionData, uint32_t argc, FREObject argv[]) {
    
    @autoreleasepool {
        
        NSArray *vComp = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
        
        int32_t boolValue;
        
        FREObject returnValue;
        
        if ([[vComp objectAtIndex:0] intValue] >= 6) {
            boolValue = true;
        } else {
            boolValue = false;
        }
        
        FRENewObjectFromBool(boolValue, &returnValue);
        
        return returnValue;
    }
}

FREObject show (FREContext context, void* functionData, uint32_t argc, FREObject argv[]) {
    
    @autoreleasepool {
        
        uint32_t stringLength;
        const uint8_t *stringText;
        
        if (FREGetObjectAsUTF8(argv[0], &stringLength, &stringText) == FRE_OK)
        {
            NSString *ObjCString = [NSString stringWithUTF8String:(char*)stringText];
            [WToast showWithText:ObjCString];
        }
        
        return nil;
    }
}

void ezToastContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    
    *numFunctionsToTest = 3;
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToTest));
    
    func[0].name = (const uint8_t*) "init";
    func[0].functionData = NULL;
    func[0].function = &init;
    
    func[1].name = (const uint8_t*) "isSupported";
    func[1].functionData = NULL;
    func[1].function = &isSupported;
    
    func[2].name = (const uint8_t*) "show";
    func[2].functionData = NULL;
    func[2].function = &show;
    
    *functionsToSet = func;
    
}

void ezToastContextFinalizer(FREContext ctx)
{
    return;
}

void ezToastInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    *extDataToSet = NULL;
    *ctxInitializerToSet = &ezToastContextInitializer;
    *ctxFinalizerToSet = &ezToastContextFinalizer;
}

void ezToastFinalizer(void* extData)
{
    return;
}
