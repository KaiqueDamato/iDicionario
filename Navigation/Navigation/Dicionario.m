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
    Letra *letraA = [[Letra alloc] init];
    letraA.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/arara.imageset/arara.png"];
    letraA.palavra = @"arara";
    [_dicionario addObject:letraA];
    
    Letra *letraB = [[Letra alloc] init];
    letraB.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/baleia.imageset/baleia.png"];
    letraB.palavra = @"baleia";
    [_dicionario addObject:letraB];
    
    Letra *letraC = [[Letra alloc] init];
    letraC.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/cachorro.imageset/cachorro.png"];
    letraC.palavra = @"cachorro";
    [_dicionario addObject:letraC];
    
    Letra *letraD = [[Letra alloc] init];
    letraD.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/dinossauro.imageset/dinossauro.png"];
    letraD.palavra = @"dinossauro";
    [_dicionario addObject:letraD];
    
    Letra *letraE = [[Letra alloc] init];
    letraE.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/elefante.imageset/elefante.png"];
    letraE.palavra = @"elefante";
    [_dicionario addObject:letraE];
    
    Letra *letraF = [[Letra alloc] init];
    letraF.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/foca.imageset/foca.png"];
    letraF.palavra = @"foca";
    [_dicionario addObject:letraF];
    
    Letra *letraG = [[Letra alloc] init];
    letraG.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/gato.imageset/gato.png"];
    letraG.palavra = @"gato";
    [_dicionario addObject:letraG];
    
    Letra *letraH = [[Letra alloc] init];
    letraH.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/hiena.imageset/hiena.png"];
    letraH.palavra = @"hiena";
    [_dicionario addObject:letraH];
    
    Letra *letraI = [[Letra alloc] init];
    letraI.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/iguana.imageset/iguana.png"];
    letraI.palavra = @"iguana";
    [_dicionario addObject:letraI];
    
    Letra *letraJ = [[Letra alloc] init];
    letraJ.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/jacare.imageset/jacare.png"];
    letraJ.palavra = @"jacare";
    [_dicionario addObject:letraJ];
    
    Letra *letraK = [[Letra alloc] init];
    letraK.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/kiwi.imageset/kiwi.png"];
    letraK.palavra = @"kiwi";
    [_dicionario addObject:letraK];
    
    Letra *letraL = [[Letra alloc] init];
    letraL.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/leao.imageset/leao.png"];
    letraL.palavra = @"leao";
    [_dicionario addObject:letraL];
    
    Letra *letraM = [[Letra alloc] init];
    letraM.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/macaco.imageset/macaco.png"];
    letraM.palavra = @"macaco";
    [_dicionario addObject:letraM];
    
    Letra *letraN = [[Letra alloc] init];
    letraN.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/naja.imageset/naja.png"];
    letraN.palavra = @"naja";
    [_dicionario addObject:letraN];
    
    Letra *letraO = [[Letra alloc] init];
    letraO.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/ovelha.imageset/ovelha.png"];
    letraO.palavra = @"ovelha";
    [_dicionario addObject:letraO];
    
    Letra *letraP = [[Letra alloc] init];
    letraP.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/peixe.imageset/peixe.png"];
    letraP.palavra = @"peixe";
    [_dicionario addObject:letraP];
    
    Letra *letraQ = [[Letra alloc] init];
    letraQ.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/queroquero.imageset/queroquero.png"];
    letraQ.palavra = @"queroquero";
    [_dicionario addObject:letraQ];
    
    Letra *letraR = [[Letra alloc] init];
    letraR.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/rato.imageset/rato.png"];
    letraR.palavra = @"rato";
    [_dicionario addObject:letraR];
    
    Letra *letraS = [[Letra alloc] init];
    letraS.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/sapo.imageset/sapo.png"];
    letraS.palavra = @"sapo";
    [_dicionario addObject:letraS];
    
    Letra *letraT = [[Letra alloc] init];
    letraT.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/tatu.imageset/tatu.png"];
    letraT.palavra = @"tatu";
    [_dicionario addObject:letraT];
    
    Letra *letraU = [[Letra alloc] init];
    letraU.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/urso.imageset/urso.png"];
    letraU.palavra = @"urso";
    [_dicionario addObject:letraU];
    
    Letra *letraV = [[Letra alloc] init];
    letraV.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/vaca.imageset/vaca.png"];
    letraV.palavra = @"vaca";
    [_dicionario addObject:letraV];
    
    Letra *letraW = [[Letra alloc] init];
    letraW.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/wolf.imageset/wolf.png"];
    letraW.palavra = @"wolf";
    [_dicionario addObject:letraW];
    
    Letra *letraX = [[Letra alloc] init];
    letraX.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/xareu.imageset/xareu.png"];
    letraX.palavra = @"xareu";
    [_dicionario addObject:letraX];
    
    Letra *letraY = [[Letra alloc] init];
    letraY.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/yorkshire.imageset/yorkshire.png"];
    letraY.palavra = @"yorkshire";
    [_dicionario addObject:letraY];
    
    Letra *letraZ = [[Letra alloc] init];
    letraZ.imagem = [UIImage imageWithContentsOfFile:@"/Users/kaiquedamato/Documents/iDicionario/Navigation/Navigation/Images.xcassets/zebra.imageset/zebra.png"];
    letraZ.palavra = @"zebra";
    [_dicionario addObject:letraZ];
}

@end
