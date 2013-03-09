//
//  AppDelegate.m
//  FirstMendelsLow
//
//  Created by Aleksander Sosnovshchenko on 07.03.13.
//  Copyright (c) 2013 Aleksander Sosnovshchenko. All rights reserved.
//

#import "AppDelegate.h"
#import "Speciement.h"
#import "Genotype.h"

@interface AppDelegate()
@property (weak) IBOutlet NSFormCell *aCell;
@property (weak) IBOutlet NSFormCell *bCell;
@property (weak) IBOutlet NSFormCell *cCell;
@property (weak) IBOutlet NSFormCell *answerCell;
- (IBAction)calculateButtonDidPress:(id)sender;


@end


@implementation AppDelegate

- (float)probabilityOfDominantFirstMate:(NSArray*)firstMate secondMate:(NSArray*)secondMate
{
    float probability = 0.f;
    int counter = 0;
    for (id allelX in firstMate) {
        for (id allelY in secondMate) {
            probability += (((NSNumber *)allelX).boolValue || ((NSNumber *)allelY).boolValue);
            counter++;
        }
    }
    probability = probability / ([firstMate count]+[secondMate count]);
    return probability;
}

- (IBAction)calculateButtonDidPress:(id)sender {
    Genotype *AA = [[Genotype alloc] initWithFirstAllele:YES andSecond:YES];
    Genotype *Aa = [[Genotype alloc] initWithFirstAllele:YES andSecond:NO];
    Genotype *aa = [[Genotype alloc] initWithFirstAllele:NO andSecond:NO];
    
    Speciement *kSp = [[Speciement alloc] initWithNumberOfSpeciement:self.aCell.floatValue andGenotype:AA];
    Speciement *mSp = [[Speciement alloc] initWithNumberOfSpeciement:self.bCell.floatValue andGenotype:Aa];
    Speciement *nSp = [[Speciement alloc] initWithNumberOfSpeciement:self.cCell.floatValue andGenotype:aa];
    
    NSArray *populationArray = @[kSp, mSp, nSp];
    
    float probabilityForTree = 0.f;
    for (Speciement *firstMate in populationArray) {
        
        if (firstMate.numberOfSpeciement != 0) {
            float probabilityForFirstMate = firstMate.numberOfSpeciement / (kSp.numberOfSpeciement + mSp.numberOfSpeciement + nSp.numberOfSpeciement);
            [firstMate pick];
            
            for (Speciement *secondMate in populationArray) {
                
                if (secondMate.numberOfSpeciement != 0){
                    
                    float probabilityForSecondMate = secondMate.numberOfSpeciement / (kSp.numberOfSpeciement + mSp.numberOfSpeciement + nSp.numberOfSpeciement);
                    
                    float probabilityForGenotype = [firstMate.genotype probabilityOfDominantFenotypeWithMateGenotype:secondMate.genotype];
                    
                    probabilityForTree += (probabilityForFirstMate * probabilityForSecondMate * probabilityForGenotype);
                }
            }
            [firstMate reverse];
        }
    }
    NSString *answer = [NSString stringWithFormat:@"%f", probabilityForTree];
    [self.answerCell setStringValue:answer];
}
@end
