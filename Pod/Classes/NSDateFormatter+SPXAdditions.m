/*
   Copyright (c) 2014 Snippex. All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY Snippex `AS IS' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL Snippex OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "NSDateFormatter+SPXAdditions.h"

static NSString * const SPXNSDateFormatterThreadDictionaryKey = @"SPXNSDateFormatterThreadDictionaryKey";

@implementation NSDateFormatter (SPXAdditions)

+ (instancetype)dateFormatterForFormat:(NSString *)format
{
  NSMutableDictionary *dateFormatters = [self dateFormattersForCurentThread];
  NSDateFormatter *formatter = dateFormatters[format];
  
  if (!formatter) {
    formatter = [NSDateFormatter new];
    formatter.dateFormat = format;
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"us"];
    dateFormatters[format] = formatter;
  }
  
  return formatter;
}

+ (instancetype)relativeDateFormatter
{
  NSMutableDictionary *dateFormatters = [self dateFormattersForCurentThread];
  NSDateFormatter *formatter = dateFormatters[@"relative"];
  
  if (!formatter) {
    formatter = [NSDateFormatter new];
    formatter.doesRelativeDateFormatting = YES;
    dateFormatters[@"relative"] = formatter;
  }
  
  return formatter;
}

+ (NSMutableDictionary *)dateFormattersForCurentThread
{
  NSMutableDictionary *dateFormatters = [NSThread currentThread].threadDictionary[SPXNSDateFormatterThreadDictionaryKey];
  
  if (!dateFormatters) {
    dateFormatters = [NSMutableDictionary new];
    [NSThread currentThread].threadDictionary[SPXNSDateFormatterThreadDictionaryKey] = dateFormatters;
  }
  
  return dateFormatters;
}

@end
