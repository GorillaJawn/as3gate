package com.gorillajawn.gate.parallel {

    import com.gorillajawn.gate.GateCommand;
    import com.gorillajawn.gate.GateTestAbstract;
    import com.gorillajawn.gate.parallel.support.MyParallelGateFailure;

    import org.flexunit.asserts.fail;
    import org.flexunit.async.Async;

    /**
     * Test to validate failure is reported
     */
    public class ParallelGateFailedTest extends GateTestAbstract {

        public function ParallelGateFailedTest() {
            expectedRuntime = 4000;
        }

        [Test(async)]
        public function testStandardParallel():void {
            asyncHandler = Async.asyncHandler(this, expectedFailureAsyncHandler, 4500);

            var gate:MyParallelGateFailure = new MyParallelGateFailure();
            gate.successHandler = standardSuccess;
            gate.faultHandler = standardFailure;
            gate.run();
        }

        private function standardSuccess():void {
            this.unexpectedSuccess = true;
            asyncHandler();
        }

        private function standardFailure(errorCmd:GateCommand = null, msg:String = null):void {
            this.failureMessage = msg;
            asyncHandler();
        }

    }
}
