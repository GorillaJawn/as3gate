package com.gorillajawn.gate.parallel {

    import com.gorillajawn.gate.GateCommand;
    import com.gorillajawn.gate.GateTestAbstract;
    import com.gorillajawn.gate.parallel.support.MyParallelGate;

    import org.flexunit.asserts.fail;
    import org.flexunit.async.Async;

    /**
     * Test to validate execution is parallel and takes longer than longest item, but timeouts if 500 ms longer
     */
    public class ParallelGateTest extends GateTestAbstract {

        public function ParallelGateTest() {
            expectedRuntime = 2500;
        }

        [Test(async)]
        public function testStandardParallel():void {
            asyncHandler = Async.asyncHandler(this, standardAsyncHandler, 3000);

            var gate:MyParallelGate = new MyParallelGate();
            gate.successHandler = standardSuccess;
            gate.faultHandler = standardFailure;
            gate.run();
        }

        private function standardSuccess():void {
            finishTime = new Date();
            runtime = finishTime.time - startTime.time;
            asyncHandler();
        }

        private function standardFailure(errorCmd:GateCommand = null, msg:String = null):void {
            fail("Gate Failed: " + msg);
        }

    }
}
