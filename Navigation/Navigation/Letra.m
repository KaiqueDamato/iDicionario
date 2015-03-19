//
//  Letra.m
//  Navigation
//
//  Created by Kaique Damato on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Letra.h"

@implementation Letra

- (instancetype)initWithPalavra:(NSString *)palavra {
    self = [super init];
    if (self) {
        _palavra = palavra;
    }
    return self;
}

@end
