//
//  Dicionario.m
//  Navigation
//
//  Created by Kaique Damato on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Dicionario.h"
#import "Letra.h"

@implementation Dicionario {
    NSUInteger contador;
}

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
        contador = 0;
        _letraAtual = [_dicionario objectAtIndex:contador];
        _navigation = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)proximo {
    if (contador == 25) {
        contador = 0;
    } else {
        contador++;
    }
    _letraAtual = [_dicionario objectAtIndex:contador];
}

- (void)anterior {
    if (contador == 0) {
        contador = 25;
    } else {
        contador--;
    }
    _letraAtual = [_dicionario objectAtIndex:contador];
}

- (void)addObjetos {
    Letra *letraA = [[Letra alloc] initWithPalavra:@"arara"];
    [_dicionario addObject:letraA];
    
    Letra *letraB = [[Letra alloc] initWithPalavra:@"baleia"];
    [_dicionario addObject:letraB];
    
    Letra *letraC = [[Letra alloc] initWithPalavra:@"cachorro"];
    [_dicionario addObject:letraC];
    
    Letra *letraD = [[Letra alloc] initWithPalavra:@"dinossauro"];
    [_dicionario addObject:letraD];
    
    Letra *letraE = [[Letra alloc] initWithPalavra:@"elefante"];
    [_dicionario addObject:letraE];
    
    Letra *letraF = [[Letra alloc] initWithPalavra:@"foca"];
    [_dicionario addObject:letraF];
    
    Letra *letraG = [[Letra alloc] initWithPalavra:@"gato"];
    [_dicionario addObject:letraG];
    
    Letra *letraH = [[Letra alloc] initWithPalavra:@"hiena"];
    [_dicionario addObject:letraH];
    
    Letra *letraI = [[Letra alloc] initWithPalavra:@"iguana"];
    [_dicionario addObject:letraI];
    
    Letra *letraJ = [[Letra alloc] initWithPalavra:@"jacare"];
    [_dicionario addObject:letraJ];
    
    Letra *letraK = [[Letra alloc] initWithPalavra:@"kiwi"];
    [_dicionario addObject:letraK];
    
    Letra *letraL = [[Letra alloc] initWithPalavra:@"leao"];
    [_dicionario addObject:letraL];
    
    Letra *letraM = [[Letra alloc] initWithPalavra:@"macaco"];
    [_dicionario addObject:letraM];
    
    Letra *letraN = [[Letra alloc] initWithPalavra:@"naja"];
    [_dicionario addObject:letraN];
    
    Letra *letraO = [[Letra alloc] initWithPalavra:@"ovelha"];
    [_dicionario addObject:letraO];
    
    Letra *letraP = [[Letra alloc] initWithPalavra:@"peixe"];
    [_dicionario addObject:letraP];
    
    Letra *letraQ = [[Letra alloc] initWithPalavra:@"queroquero"];
    [_dicionario addObject:letraQ];
    
    Letra *letraR = [[Letra alloc] initWithPalavra:@"rato"];
    [_dicionario addObject:letraR];
    
    Letra *letraS = [[Letra alloc] initWithPalavra:@"sapo"];
    [_dicionario addObject:letraS];
    
    Letra *letraT = [[Letra alloc] initWithPalavra:@"tatu"];
    [_dicionario addObject:letraT];
    
    Letra *letraU = [[Letra alloc] initWithPalavra:@"urso"];
    [_dicionario addObject:letraU];
    
    Letra *letraV = [[Letra alloc] initWithPalavra:@"vaca"];
    [_dicionario addObject:letraV];
    
    Letra *letraW = [[Letra alloc] initWithPalavra:@"wolf"];
    [_dicionario addObject:letraW];
    
    Letra *letraX = [[Letra alloc] initWithPalavra:@"xareu"];
    [_dicionario addObject:letraX];
    
    Letra *letraY = [[Letra alloc] initWithPalavra:@"yorkshire"];
    [_dicionario addObject:letraY];
    
    Letra *letraZ = [[Letra alloc] initWithPalavra:@"zebra"];
    [_dicionario addObject:letraZ];
}

@end
