package com.gorillajawn.gate.serial {

    import com.gorillajawn.gate.GateCommand;
    import com.gorillajawn.gate.GateTestAbstract;
    import com.gorillajawn.gate.serial.support.MySerialGateFailure;

    import org.flexunit.asserts.fail;
    import org.flexunit.async.Async;

    /**
     * Test to validate that failure is reported on serial execution
     */
    public class SerialGateFailureTest extends GateTestAbstract {

        public function SerialGateFailureTest() {
            expectedRuntime = 4500;
        }

        [Test(async)]
        public function testStandardParallel():void {
            asyncHandler = Async.asyncHandler(this, expectedFailureAsyncHandler, 5000);

            var gate:MySerialGateFailure = new MySerialGateFailure();
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
