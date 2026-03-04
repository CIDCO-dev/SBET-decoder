/*
 * Copyright 2017 (c) Centre Interdisciplinaire de developpement en Cartographie des Oceans (CIDCO), All rights reserved.
 */

/* 
 * File:   AccuracyPrinter.hpp
 * Author: jordan
 */

#ifndef ACCURACYPRINTER_HPP
#define ACCURACYPRINTER_HPP

#include "AccuracyProcessor.hpp"
#include <cstdio>
#include <string>

/*!
 * \brief AccuracyPrinter class extends of AccuracyProcessor class
 */
class AccuracyPrinter : public AccuracyProcessor {
public:

    /**
     * Create a AccuracyPrinter class
     */
    AccuracyPrinter() {
        printf("Time NorthingSD EastingSD AltitudeSD SpeedNorthSD SpeedEastSD SpeedAltitudeSD RollSd PitchSd HeadingSd\n");
    }

    /**
     * Print the information of the AccuracyEntry receive in parameter 
     * 
     * @param entry The AccuracyEntry 
     */
    void processEntry(AccuracyEntry * entry) {
        printf("%lf %lf %lf %lf %lf %lf %lf %lf %lf %lf\n",
                entry->time,
                entry->northingSd,
                entry->eastingSd,
                entry->altitudeSd,
                entry->speedNorthSd,
                entry->speedEastSd,
                entry->speedAltitudeSd,
                entry->rollSd / 60,
                entry->pitchSd / 60,
                entry->headingSd / 60
                );
    }
    
    /**
     * Data is simply printed, nothing to do at the end of IO
     * 
     * @param entry The AccuracyEntry 
     */
    void done() {
        
    }
    
    
    
};

#endif /* ACCURACYPRINTER_HPP */
