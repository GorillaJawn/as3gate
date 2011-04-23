package com.gorillajawn.gate.parallel {

    import com.gorillajawn.gate.GateCommand;
    import com.gorillajawn.gate.GateTestAbstract;
    import com.gorillajawn.gate.parallel.support.MyParallelGateFailure;

    import org.flexunit.asserts.fail;
    import org.flexunit.async.Async;

    /**
     * Test to validate parallel run continues when failure occurs, with flag stet
     */
    public class ParallelGateFailedContinueTest extends GateTestAbstract {

        public function ParallelGateFailedContinueTest() {
            expectedRuntime = 4000;
        }

        [Test(async)]
        public function testStandardParallel():void {
            asyncHandler = Async.asyncHandler(this, standardAsyncHandler, 4500);

            var gate:MyParallelGateFailure = new MyParallelGateFailure(true);
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
