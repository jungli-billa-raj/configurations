#include "space_age.h"


// 31,557,600
static const float orbital_period[PLANET_COUNT] = {
    0.2408467,
    0.61519726,
    1.0,
    1.8808158,
    11.862615,
    29.447498,
    84.016846,
    164.79132
};

float age(planet_t planet, int64_t seconds){
  if(planet<0 || planet>7){
    return -1;
  }
  float earth_age = seconds/31557600;
  return earth_age/orbital_period[planet];
}
