#ifndef HICKER_SPEC_INCLUDE
#define HICKER_SPEC_INCLUDE

#include "hiker.hpp"
#include <CppSpec/CppSpec.h>

class Life_the_universe_and_everythings:
  public CppSpec::Specification<int, Life_the_universe_and_everythings>
{
public:
  Life_the_universe_and_everythings()
  {
    REGISTER_BEHAVIOUR(Life_the_universe_and_everythings, should_answer_with_42);
  }

  int* createContext() 
  {
    return new int(answer());
  }


  void should_answer_with_42 ()
  {
    specify(context(), should.equal(42));
  }
} life_the_universe_and_everything;

#endif
