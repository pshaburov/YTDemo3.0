// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from MELCodes.djinni

#import "MRDataFormat.h"
#import "MRSize.h"
#import <Foundation/Foundation.h>

@interface MROptions : NSObject
- (nonnull instancetype)initWithFormat:(MRDataFormat)format
                                  size:(nonnull MRSize *)size;
+ (nonnull instancetype)OptionsWithFormat:(MRDataFormat)format
                                     size:(nonnull MRSize *)size;

@property (nonatomic, readonly) MRDataFormat format;

@property (nonatomic, readonly, nonnull) MRSize * size;

@end