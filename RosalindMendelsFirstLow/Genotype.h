//
//  Genotype.h
//  FirstMendelsLow
//
//  Created by Aleksander Sosnovshchenko on 09.03.13.
//  Copyright (c) 2013 Aleksander Sosnovshchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Genotype : NSObject

@property (nonatomic) BOOL firstAllele;
@property (nonatomic) BOOL secondAllele;

- (Genotype *)initWithFirstAllele:(BOOL)fAllele andSecond:(BOOL)sAllele;
- (BOOL)isHomozygote;
- (float)probabilityOfDominantFenotypeWithMateGenotype:(Genotype*)genotype;

@end
