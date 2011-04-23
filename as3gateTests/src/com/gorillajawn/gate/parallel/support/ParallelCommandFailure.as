package com.gorillajawn.gate.parallel.support {

    import com.gorillajawn.gate.GateCommand;

    public class ParallelCommandFailure extends GateCommand {

        override public function execute():void {
            this.error("test failure");
        }

    }

}
