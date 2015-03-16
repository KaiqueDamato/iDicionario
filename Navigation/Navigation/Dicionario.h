//
//  Dicionario.h
//  Navigation
//
//  Created by Kaique Damato on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Letra;

@interface Dicionario : NSObject

@property NSMutableArray *dicionario;
@property NSUInteger contador;

+ (Dicionario *)sharedInstance;
- (instancetype)init;
- (void)addObjetos;

@end
