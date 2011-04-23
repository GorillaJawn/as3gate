package com.gorillajawn.gate {

    import com.gorillajawn.gate.parallel.ParallelGateFailedContinueTest;
    import com.gorillajawn.gate.parallel.ParallelGateFailedTest;
    import com.gorillajawn.gate.parallel.ParallelGateTest;
    import com.gorillajawn.gate.serial.SerialGateFailedContinueTest;
    import com.gorillajawn.gate.serial.SerialGateFailureTest;
    import com.gorillajawn.gate.serial.SerialGateTest;

    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class AS3GateSuite {

        public var test1:ParallelGateTest;
        public var test2:ParallelGateFailedTest;
        public var test3:ParallelGateFailedContinueTest;

        public var test4:SerialGateTest;
        public var test5:SerialGateFailureTest;
        public var test6:SerialGateFailedContinueTest;

    }

}
