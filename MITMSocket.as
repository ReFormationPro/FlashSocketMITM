package com.MITM
{
    import flash.net.Socket;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.utils.ByteArray;

    public class MITMSocket extends Socket
    {
        
        public function MITMSocket(host:String=null, port:int=0) 
        {
            super(host, port);
            ExternalInterface.call("console.log", "MITMSocket Constructor");
            ExternalInterface.addCallback("consoleLog", consoleLog);
        }
        
        public static function consoleLog(str:String):void {
            ExternalInterface.call("console.log", str);
            trace(str);
        }
        
        override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void {
            ExternalInterface.call("console.log", "addEventListener, type:", type, ", listener:", listener);
            
            super.addEventListener(type, listener, useCapture, priority, useWeakReference);
            super.addEventListener(type, this.MITMListener, useCapture, priority, useWeakReference);
        }
        
        override public function writeBytes(bytes:ByteArray, offset:uint = 0, length:uint = 0):void {
            ExternalInterface.call("console.verbose", "writeBytes: length:", length, " offset:", offset, ", bytes:", bytes.toString());
            super.writeBytes(bytes, offset, length);
        }
        
        private function MITMListener(event:Event):void {
            consoleLog(event.toString());
            
            var socket:Socket = event.target as Socket 
                 
            /*  This is how to read from the socket. However, if we read it, the application will not be able to read it.
             *  We need a workaround...
             */
            //var message:String = socket.readUTFBytes( socket.bytesAvailable ); 
            //consoleLog( "Received: " + message); 
            
            switch(event.type) {
                case "":
                    break;
            }
        }
    }
}
