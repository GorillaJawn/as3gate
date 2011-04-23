package com.gorillajawn.gate.serial.support {

    import com.gorillajawn.gate.GateCommand;

    import flash.utils.setTimeout;

    public class SerialCommand extends GateCommand {

        private var timeout:int;

        public function SerialCommand(timeout:int = 500):void {
            this.timeout = timeout;
        }

        override public function execute():void {
            setTimeout(finish, timeout);
        }

        private function finish():void {
            this.proceed();
        }

    }
}
