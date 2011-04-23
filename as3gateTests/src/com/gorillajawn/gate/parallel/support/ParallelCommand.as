package com.gorillajawn.gate.parallel.support {

    import com.gorillajawn.gate.GateCommand;

    import flash.utils.setTimeout;

    public class ParallelCommand extends GateCommand {

        private var timeout:int;

        public function ParallelCommand(timeout:int = 500):void {
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
