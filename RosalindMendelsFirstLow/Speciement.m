//
//  Speciement.m
//  FirstMendelsLow
//
//  Created by Aleksander Sosnovshchenko on 08.03.13.
//  Copyright (c) 2013 Aleksander Sosnovshchenko. All rights reserved.
//

#import "Speciement.h"

@implementation Speciement

-(id)initWithNumberOfSpeciement:(float)numberOfSpeciement andGenotype:(Genotype *)genotype {
    self = [super init];
    self.genotype = genotype;
    self.numberOfSpeciement = floor(abs(numberOfSpeciement));
    return self;
}

-(void)pick {
    self.numberOfSpeciement -= 1;
}

-(void)reverse {
    self.numberOfSpeciement += 1;
}

@end
