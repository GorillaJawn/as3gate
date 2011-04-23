package com.gorillajawn.gate.parallel.support {

    import com.gorillajawn.gate.ParallelGate;

    public class MyParallelGate extends ParallelGate {

        override protected function register():void {
            this.commands = [];
            this.commands.push(new ParallelCommand(1000));
            this.commands.push(ParallelCommand);
            this.commands.push(ParallelCommand);
            this.commands.push(ParallelCommand);
            this.commands.push(new ParallelCommand(2500));
        }

    }
}
