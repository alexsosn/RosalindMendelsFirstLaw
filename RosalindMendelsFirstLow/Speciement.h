//
//  Speciement.h
//  FirstMendelsLow
//
//  Created by Aleksander Sosnovshchenko on 08.03.13.
//  Copyright (c) 2013 Aleksander Sosnovshchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Genotype.h"
@interface Speciement : NSObject

@property (nonatomic, retain) Genotype *genotype;
@property (nonatomic) float numberOfSpeciement;
-(void)pick;
-(void)reverse;
-(id)initWithNumberOfSpeciement:(float)numberOfSpeciement andGenotype:(Genotype *)genotype;
@end
