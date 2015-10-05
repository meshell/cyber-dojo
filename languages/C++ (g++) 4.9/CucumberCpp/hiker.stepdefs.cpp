#include "hiker.hpp"
#include <gtest/gtest.h>
#include <cucumber-cpp/defs.hpp>


using cucumber::ScenarioScope;

namespace {

struct HikerCtx
{
    int result{};
};

GIVEN("^the hitch-hiker selects some tiles$")
{

}

WHEN("^they spell (\\d+) times (\\d+)$")
{
    REGEX_PARAM(int, x);
    REGEX_PARAM(int, y);
    ScenarioScope<HikerCtx> context{};
    context->result = answer(x, y);
}

THEN("^the score is (\\d+)$")
{
    REGEX_PARAM(int, score);
    ScenarioScope<HikerCtx> context{};
    ASSERT_EQ(score, context->result);
}

}
