# Data Format Notes

This directory contains reference material for the decoded output format.

## SBET Output

`src/SbetPrinter.hpp` prints one line per SBET entry with this header:

`Time Latitude Longitude Altitude SpeedX SpeedY SpeedZ Heading Pitch Roll Wander ForceX ForceY ForceZ AngularRateX AngularRateY AngularRateZ`

Values for latitude and longitude are converted from radians to degrees.

Reference image:
- `doc/sbet-format.png`

## Accuracy Output

`src/AccuracyPrinter.hpp` prints one line per accuracy entry with this header:

`Time NorthingSD EastingSD AltitudeSD SpeedNorthSD SpeedEastSD SpeedAltitudeSD RollSd PitchSd HeadingSd`

Roll, pitch, and heading standard deviations are scaled by `1/60`.

Reference image:
- `doc/accuracy-out-format.png`
