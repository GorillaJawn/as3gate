package com.gorillajawn.gate.serial.support {

    import com.gorillajawn.gate.GateCommand;

    public class SerialCommandFailure extends GateCommand {

        override public function execute():void {
            this.error("test failure");
        }

    }
}
