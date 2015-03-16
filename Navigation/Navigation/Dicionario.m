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
    }
    return self;
}

- (Letra *)proximo {
    if (contador == 25) {
        contador = 0;
    } else {
        contador++;
    }
    _letraAtual = [_dicionario objectAtIndex:contador];
    return _letraAtual;
}

- (Letra *)anterior {
    if (contador == 0) {
        contador = 25;
    } else {
        contador--;
    }
    _letraAtual = [_dicionario objectAtIndex:contador];
    return _letraAtual;
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
    
    Letra *letraF = [[Letra alloc] init];
    letraF.imagem = [UIImage imageNamed:@"foca"];
    letraF.palavra = @"foca";
    [_dicionario addObject:letraF];
    
    Letra *letraG = [[Letra alloc] init];
    letraG.imagem = [UIImage imageNamed:@"gato"];
    letraG.palavra = @"gato";
    [_dicionario addObject:letraG];
    
    Letra *letraH = [[Letra alloc] init];
    letraH.imagem = [UIImage imageNamed:@"hiena"];
    letraH.palavra = @"hiena";
    [_dicionario addObject:letraH];
    
    Letra *letraI = [[Letra alloc] init];
    letraI.imagem = [UIImage imageNamed:@"iguana"];
    letraI.palavra = @"iguana";
    [_dicionario addObject:letraI];
    
    Letra *letraJ = [[Letra alloc] init];
    letraJ.imagem = [UIImage imageNamed:@"jacare"];
    letraJ.palavra = @"jacare";
    [_dicionario addObject:letraJ];
    
    Letra *letraK = [[Letra alloc] init];
    letraK.imagem = [UIImage imageNamed:@"kiwi"];
    letraK.palavra = @"kiwi";
    [_dicionario addObject:letraK];
    
    Letra *letraL = [[Letra alloc] init];
    letraL.imagem = [UIImage imageNamed:@"leao"];
    letraL.palavra = @"leao";
    [_dicionario addObject:letraL];
    
    Letra *letraM = [[Letra alloc] init];
    letraM.imagem = [UIImage imageNamed:@"macaco"];
    letraM.palavra = @"macaco";
    [_dicionario addObject:letraM];
    
    Letra *letraN = [[Letra alloc] init];
    letraN.imagem = [UIImage imageNamed:@"naja"];
    letraN.palavra = @"naja";
    [_dicionario addObject:letraN];
    
    Letra *letraO = [[Letra alloc] init];
    letraO.imagem = [UIImage imageNamed:@"ovelha"];
    letraO.palavra = @"ovelha";
    [_dicionario addObject:letraO];
    
    Letra *letraP = [[Letra alloc] init];
    letraP.imagem = [UIImage imageNamed:@"peixe"];
    letraP.palavra = @"peixe";
    [_dicionario addObject:letraP];
    
    Letra *letraQ = [[Letra alloc] init];
    letraQ.imagem = [UIImage imageNamed:@"queroquero"];
    letraQ.palavra = @"queroquero";
    [_dicionario addObject:letraQ];
    
    Letra *letraR = [[Letra alloc] init];
    letraR.imagem = [UIImage imageNamed:@"rato"];
    letraR.palavra = @"rato";
    [_dicionario addObject:letraR];
    
    Letra *letraS = [[Letra alloc] init];
    letraS.imagem = [UIImage imageNamed:@"sapo"];
    letraS.palavra = @"sapo";
    [_dicionario addObject:letraS];
    
    Letra *letraT = [[Letra alloc] init];
    letraT.imagem = [UIImage imageNamed:@"tatu"];
    letraT.palavra = @"tatu";
    [_dicionario addObject:letraT];
    
    Letra *letraU = [[Letra alloc] init];
    letraU.imagem = [UIImage imageNamed:@"urso"];
    letraU.palavra = @"urso";
    [_dicionario addObject:letraU];
    
    Letra *letraV = [[Letra alloc] init];
    letraV.imagem = [UIImage imageNamed:@"vaca"];
    letraV.palavra = @"vaca";
    [_dicionario addObject:letraV];
    
    Letra *letraW = [[Letra alloc] init];
    letraW.imagem = [UIImage imageNamed:@"wolf"];
    letraW.palavra = @"wolf";
    [_dicionario addObject:letraW];
    
    Letra *letraX = [[Letra alloc] init];
    letraX.imagem = [UIImage imageNamed:@"xareu"];
    letraX.palavra = @"xareu";
    [_dicionario addObject:letraX];
    
    Letra *letraY = [[Letra alloc] init];
    letraY.imagem = [UIImage imageNamed:@"yorkshire"];
    letraY.palavra = @"yorkshire";
    [_dicionario addObject:letraY];
    
    Letra *letraZ = [[Letra alloc] init];
    letraZ.imagem = [UIImage imageNamed:@"zebra"];
    letraZ.palavra = @"zebra";
    [_dicionario addObject:letraZ];
}

@end
