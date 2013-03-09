//
//  Genotype.m
//  FirstMendelsLow
//
//  Created by Aleksander Sosnovshchenko on 09.03.13.
//  Copyright (c) 2013 Aleksander Sosnovshchenko. All rights reserved.
//

#import "Genotype.h"

@implementation Genotype
- (Genotype *)initWithFirstAllele:(BOOL)fAllele andSecond:(BOOL)sAllele {
    self = [super init];
    self.firstAllele = fAllele;
    self.secondAllele = sAllele;
    return self;
}

- (BOOL)isHomozygote {
    return self.firstAllele == self.secondAllele;
}

- (float)probabilityOfDominantFenotypeWithMateGenotype:(Genotype*)genotype
{
    float probability = 0.f;
    int counter = 0;    
    NSArray *firstMate = @[@(self.firstAllele), @(self.secondAllele)];
    NSArray *secondMate = @[@(genotype.firstAllele), @(genotype.secondAllele)];
    for (id allelX in firstMate) {
        for (id allelY in secondMate) {
            probability += (((NSNumber *)allelX).boolValue || ((NSNumber *)allelY).boolValue);
            counter++;
        }
    }
    probability = probability / ([firstMate count]+[secondMate count]);
    return probability;
}

@end
