package com.gorillajawn.gate.serial.support {

    import com.gorillajawn.gate.SerialGate;

    public class MySerialGateFailure extends SerialGate {

        public function MySerialGateFailure(proceedOnFault:Boolean = false) {
            this.proceedOnFault = proceedOnFault;
        }

        override protected function register():void {
            this.commands = [];
            this.commands.push(new SerialCommand(2000));
            this.commands.push(SerialCommand);
            this.commands.push(SerialCommand);
            this.commands.push(SerialCommandFailure);
            this.commands.push(SerialCommand);
            this.commands.push(new SerialCommand(1000));
        }

    }
}
