package com.gorillajawn.gate.serial {

    import com.gorillajawn.gate.GateCommand;
    import com.gorillajawn.gate.GateTestAbstract;
    import com.gorillajawn.gate.serial.support.MySerialGateFailure;

    import org.flexunit.asserts.fail;
    import org.flexunit.async.Async;

    /**
     * Test to validate serial execution continues when there is failure and flag is set
     */
    public class SerialGateFailedContinueTest extends GateTestAbstract {

        public function SerialGateFailedContinueTest() {
            expectedRuntime = 4500;
        }

        [Test(async)]
        public function testStandardParallel():void {
            asyncHandler = Async.asyncHandler(this, standardAsyncHandler, 5000);

            var gate:MySerialGateFailure = new MySerialGateFailure(true);
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
