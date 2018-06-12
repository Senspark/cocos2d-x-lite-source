/*
 Copyright (C) 2012-2014 Soomla Inc.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "KeyValueStorage.h"
#import "KeyValDatabase.h"
#import "SoomlaEncryptor.h"
#import "KeyValDatabase.h"
#import "SoomlaConfig.h"
#import "SoomlaUtils.h"
#import "Soomla.h"

@interface KeyValueStorage()

@property(nonatomic) KeyValDatabase *kvDatabase;
@property(nonatomic) NSString *storageName;
@property(nonatomic) NSString *key;

@end

@implementation KeyValueStorage

+ (NSString*)getValueForKey:(NSString*)key {
    return [[self getDefaultStorage] getValueForKey:key];
}

+ (void)setValue:(NSString*)val forKey:(NSString*)key {
    [[self getDefaultStorage] setValue:val forKey:key];
}

+ (void)deleteValueForKey:(NSString*)key {
    [[self getDefaultStorage] deleteValueForKey:key];
}

+ (NSDictionary*)getKeysValuesForNonEncryptedQuery:(NSString*)query {
    return [[self getDefaultStorage] getKeysValuesForNonEncryptedQuery:query];
}

+ (NSArray*)getValuesForNonEncryptedQuery:(NSString*)query {
    return [[self getDefaultStorage] getValuesForNonEncryptedQuery:query];
}

+ (NSArray*)getValuesForNonEncryptedQuery:(NSString*)query withLimit:(int)limit {
    return [[self getDefaultStorage] getValuesForNonEncryptedQuery:query withLimit:limit];
}

+ (NSString*)getOneForNonEncryptedQuery:(NSString*)query {
    return [[self getDefaultStorage] getOneForNonEncryptedQuery:query];
}

+ (int)getCountForNonEncryptedQuery:(NSString*)query {
    return [[self getDefaultStorage] getCountForNonEncryptedQuery:query];
}

+ (NSString*)getValueForNonEncryptedKey:(NSString*)key {
    return [[self getDefaultStorage] getValueForNonEncryptedKey:key];
}

+ (NSArray *)getEncryptedKeys {
    return [[self getDefaultStorage] getEncryptedKeys];
}

+ (void)setValue:(NSString*)val forNonEncryptedKey:(NSString*)key {
    [[self getDefaultStorage] setValue:val forNonEncryptedKey:key];
}

+ (void)deleteValueForNonEncryptedKey:(NSString*)key {
    [[self getDefaultStorage] deleteValueForNonEncryptedKey:key];
}

+ (void)purge {
    [[self getDefaultStorage] purge];
}

+ (KeyValueStorage*)getDefaultStorage {
    static KeyValueStorage* defaultStorage;
    if (!defaultStorage) {
        defaultStorage = [[KeyValueStorage alloc] initWithName:SOOMLA_DATABASE_NAME andSecret:SOOMLA_SECRET];
    }
    
    return defaultStorage;
}


- (id)initWithName:(NSString*)storageName andSecret:(NSString*)secret {
    @synchronized(self) {
        if (self = [super init]) {
            if (!secret || [secret length]==0) {
                [NSException raise:@"Invalid secret value" format:@"You must initialize KeyValueStorage with a secret. storageName: %@", storageName];
            }
            self.storageName = storageName;
            self.key = [SoomlaUtils keyFromSecret:secret];
            self.kvDatabase = [[KeyValDatabase alloc] initWithName:storageName];
        }
        return self;
    }
}

- (NSString*)getValueForKey:(NSString*)key {
    key = [SoomlaEncryptor encryptString:key withKey:self.key];
    NSString* val = [self.kvDatabase getValForKey:key];
    if (val && [val length]>0){
        return [SoomlaEncryptor decryptToString:val withKey:self.key];
    }
    
    return NULL;
}

- (void)setValue:(NSString*)val forKey:(NSString*)key {
    key = [SoomlaEncryptor encryptString:key withKey:self.key];
    [self.kvDatabase setVal:[SoomlaEncryptor encryptString:val withKey:self.key] forKey:key];
}

- (void)deleteValueForKey:(NSString*)key {
    key = [SoomlaEncryptor encryptString:key withKey:self.key];
    [self.kvDatabase deleteKeyValWithKey:key];
}

- (NSDictionary*)getKeysValuesForNonEncryptedQuery:(NSString*)query {
    NSDictionary* dbResults = [self.kvDatabase getKeysValsForQuery:query];
    NSMutableDictionary* results = [NSMutableDictionary dictionary];
    NSArray* keys = [dbResults allKeys];
    for (NSString* key in keys) {
        NSString* val = dbResults[key];
        if (val && [val length]>0){
            NSString* valDec = [SoomlaEncryptor decryptToString:val withKey:self.key];
            if (valDec && [valDec length]>0){
                [results setObject:valDec forKey:key];
            }
        }
    }
    
    return results;
}
- (NSArray*)getValuesForNonEncryptedQuery:(NSString*)query {
    return [self getValuesForNonEncryptedQuery:query withLimit:0];
}

- (NSArray*)getValuesForNonEncryptedQuery:(NSString*)query withLimit:(int)limit {
    NSArray* vals = [self.kvDatabase getValsForQuery:query withLimit:limit];
    NSMutableArray* results = [NSMutableArray array];
    for (NSString* val in vals) {
        if (val && [val length]>0){
            NSString* valDec = [SoomlaEncryptor decryptToString:val withKey:self.key];
            if (valDec && [valDec length]>0){
                [results addObject:valDec];
            }
        }
    }
    
    return results;
}

- (NSString*)getOneForNonEncryptedQuery:(NSString*)query {
    NSString* val = [self.kvDatabase getOneForQuery:query];
    if (val && [val length]>0){
        NSString* valDec = [SoomlaEncryptor decryptToString:val withKey:self.key];
        if (valDec && [valDec length]>0){
            return valDec;
        }
    }
    
    return NULL;
}

- (int)getCountForNonEncryptedQuery:(NSString*)query {
    return [self.kvDatabase getCountForQuery:query];
}

- (NSString*)getValueForNonEncryptedKey:(NSString*)key {
    NSString* val = [self.kvDatabase getValForKey:key];
    if (val && [val length]>0){
        return [SoomlaEncryptor decryptToString:val withKey:self.key];
    }
    
    return NULL;
}

- (NSArray *)getEncryptedKeys {
    NSArray *encryptedKeys = [self.kvDatabase getAllKeys];
    NSMutableArray *resultKeys = [NSMutableArray array];
    
    for (NSString *encryptedKey in encryptedKeys) {
        @try {
            NSString *unencryptedKey = [SoomlaEncryptor decryptToString:encryptedKey withKey:self.key];
            if (unencryptedKey) {
                [resultKeys addObject:unencryptedKey];
            }
        }
        @catch (NSException *exception) {
            LogDebug(TAG, ([NSString stringWithFormat:@"Exception while decrypting all keys: %@", exception.description]));
        }
    }
    
    return resultKeys;
}

- (void)setValue:(NSString*)val forNonEncryptedKey:(NSString*)key {
    [self.kvDatabase setVal:[SoomlaEncryptor encryptString:val withKey:self.key] forKey:key];
}

- (void)deleteValueForNonEncryptedKey:(NSString*)key {
    [self.kvDatabase deleteKeyValWithKey:key];
}

- (void)purge {
    [self.kvDatabase purgeDatabase];
}

static NSString* TAG = @"SOOMLA KeyValueStorage";

@end
