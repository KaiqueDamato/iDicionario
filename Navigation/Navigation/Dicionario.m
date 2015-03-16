//
//  Dicionario.m
//  Navigation
//
//  Created by Kaique Damato on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Dicionario.h"
#import "Letra.h"

@implementation Dicionario

static Dicionario *SINGLETON = nil;

static bool isFirstAccess = YES;

+ (id)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _dicionario = [[NSMutableArray alloc] init];
        [self addObjetos];
        _contador = 0;
    }
    return self;
}

- (void)addObjetos {
    Letra *letraA = [[Letra alloc] init];
    letraA.imagem = [UIImage imageNamed:@"arara"];
    letraA.palavra = @"arara";
    [_dicionario addObject:letraA];
    
    Letra *letraB = [[Letra alloc] init];
    letraB.imagem = [UIImage imageNamed:@"baleia"];
    letraB.palavra = @"baleia";
    [_dicionario addObject:letraB];
    
    Letra *letraC = [[Letra alloc] init];
    letraC.imagem = [UIImage imageNamed:@"cachorro"];
    letraC.palavra = @"cachorro";
    [_dicionario addObject:letraC];
    
    Letra *letraD = [[Letra alloc] init];
    letraD.imagem = [UIImage imageNamed:@"dinossauro"];
    letraD.palavra = @"dinossauro";
    [_dicionario addObject:letraD];
    
    Letra *letraE = [[Letra alloc] init];
    letraE.imagem = [UIImage imageNamed:@"elefante"];
    letraE.palavra = @"elefante";
    [_dicionario addObject:letraE];
}

@end
