#ifndef _FUNC_TEST_H
#define _FUNC_TEST_H

#include <gtest/gtest.h>
#include "../func.h"

TEST(TestSuit, Add){

    EXPECT_EQ(pot(9,2),81);
}

#endif
