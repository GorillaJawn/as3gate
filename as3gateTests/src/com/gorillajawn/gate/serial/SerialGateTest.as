package com.gorillajawn.gate.serial {

    import com.gorillajawn.gate.GateCommand;
    import com.gorillajawn.gate.GateTestAbstract;
    import com.gorillajawn.gate.serial.support.MySerialGate;

    import org.flexunit.asserts.fail;
    import org.flexunit.async.Async;

    /**
     * Test to validate serial execution, validates that runtime is greater than the total of all commands
     */
    public class SerialGateTest extends GateTestAbstract {

        public function SerialGateTest() {
            expectedRuntime = 4500;
        }

        [Test(async)]
        public function testStandardParallel():void {
            asyncHandler = Async.asyncHandler(this, standardAsyncHandler, 5000);

            var gate:MySerialGate = new MySerialGate();
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
