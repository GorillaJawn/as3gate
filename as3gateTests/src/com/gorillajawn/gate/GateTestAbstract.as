package com.gorillajawn.gate {

    import flash.events.Event;
    import flash.utils.getQualifiedClassName;

    import org.flexunit.Assert;
    import org.flexunit.asserts.fail;

    public class GateTestAbstract {

        protected var startTime:Date;
        protected var finishTime:Date;
        protected var runtime:int;
        protected var asyncHandler:Function;
        protected var expectedRuntime:int = 2500;

        protected var unexpectedSuccess:Boolean = false;
        protected var failureMessage:String;

        [Before(async)]
        public function setUp():void {
            startTime = new Date();
        }

        [After(async)]
        public function teardown():void {
        }

        protected function standardAsyncHandler(event:Event = null, passThrough:Object = null):void {
            trace(" >>> Test Done (standard): " + getQualifiedClassName(this) + " <<<< ");

            //Assert
            trace("startTime: " + startTime.time);
            trace("finishTime: " + finishTime.time);
            trace("runtime: " + runtime);
            trace("expectedRuntime: " + expectedRuntime);

            Assert.assertTrue("Runtime shorter than expected enough", (runtime > expectedRuntime));
        }

        protected function expectedFailureAsyncHandler(event:Event = null, passThrough:Object = null):void {
            trace(" >>> Test Done (expected failure): " + getQualifiedClassName(this) + " <<<< ");

            if (this.unexpectedSuccess) {
                fail("Expected Failure, but Gate was Successful");
            } else {
                trace("failureMessage: " + failureMessage);
                Assert.assertNotNull("Failure Message Not Null", failureMessage);
            }
        }

    }
}
