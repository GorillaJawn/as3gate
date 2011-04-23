package com.gorillajawn.gate.parallel.support {

    import com.gorillajawn.gate.ParallelGate;

    public class MyParallelGateFailure extends ParallelGate {

        public function MyParallelGateFailure(proceedOnFault:Boolean = false) {
            this.proceedOnFault = proceedOnFault;
        }

        override protected function register():void {
            this.commands = [];
            this.commands.push(new ParallelCommand(4000));
            this.commands.push(ParallelCommand);
            this.commands.push(ParallelCommand);
            this.commands.push(ParallelCommand);
            this.commands.push(new ParallelCommandFailure());
        }

    }
}
