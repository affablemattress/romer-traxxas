#pragma once 

#include <chrono>

namespace tu {
    namespace chr = std::chrono;
    typedef chr::steady_clock clock;
    typedef chr::time_point<clock> time_point;

    /**
     * @brief returns (t1 - t2) in millis.
     */
    inline static int64_t deltaT(const tu::time_point& t1, const tu::time_point& t2) {
        int64_t millis_t1 = tu::chr::duration_cast<tu::chr::milliseconds>(t1.time_since_epoch()).count();
        int64_t millis_t2 = tu::chr::duration_cast<tu::chr::milliseconds>(t2.time_since_epoch()).count();

        return millis_t1 - millis_t2;
    }
}

