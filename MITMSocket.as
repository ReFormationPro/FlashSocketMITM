package com.MITM
{
    import flash.net.Socket;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.utils.ByteArray;

    public class MITMSocket extends Socket
    {
		var verbose:Boolean = true;
		
        public function MITMSocket(host:String=null, port:int=0)
        {
            super(host, port);
            ExternalInterface.call("console.log", "MITMSocket Constructor");
            ExternalInterface.addCallback("consoleLog", consoleLog);
			ExternalInterface.addCallback("setVerbose", setVerbose);
			function setVerbose(value:Boolean) {
				
				verbose = value;
			}
        }

        public static function consoleLog(str:String):void {
            ExternalInterface.call("console.log", str);
            trace(str);
        }

        // For Information
        override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void {
            ExternalInterface.call("console.log", "addEventListener, type:", type, ", listener:", listener);
            super.addEventListener(type, listener, useCapture, priority, useWeakReference);
        }

        // ------- Overriden functions Start ------
        override public function readBoolean():Boolean {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var b:Boolean = super.readBoolean();
            var data = ExternalInterface.call("MITM.readBoolean", b) as Boolean;
            return data;
        }
        override public function readByte():int {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readByte();
            ExternalInterface.call("MITM.readByte", data);
            return data;
        }
        override public function readBytes(bytes:ByteArray, offset:uint = 0, length:uint = 0):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            super.readBytes(bytes, offset, length);
            ExternalInterface.call("MITM.readBytes", bytes, offset, length);
        }
        override public function readDouble():Number {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readDouble();
            ExternalInterface.call("MITM.readDouble", data);
            return data;
        }
        override public function readFloat():Number {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readFloat();
            ExternalInterface.call("MITM.readFloat", data);
            return data;
        }
        override public function readInt():int {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readInt();
            ExternalInterface.call("MITM.readInt", data);
            return data;
        }
        override public function readMultiByte(length:uint, charSet:String):String {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readMultiByte(length, charSet);
            ExternalInterface.call("MITM.readMultiByte", data, length, charSet);
            return data;
        }
        override public function readObject():* {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readObject();
            ExternalInterface.call("MITM.readObject", data);
            return data;
        }
        override public function readShort():int {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readShort();
            ExternalInterface.call("MITM.readShort", data);
            return data;
        }
        override public function readUnsignedByte():uint {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readUnsignedByte();
            ExternalInterface.call("MITM.readUnsignedByte", data);
            return data;
        }
        override public function readUnsignedInt():uint {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readUnsignedInt();
            ExternalInterface.call("MITM.readUnsignedInt", data);
            return data;
        }
        override public function readUnsignedShort():uint {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readUnsignedShort();
            ExternalInterface.call("MITM.readUnsignedShort", data);
            return data;
        }
        override public function readUTF():String {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readUnsignedShort();
            ExternalInterface.call("MITM.readUnsignedShort", data);
            return data;
        }
        override public function readUTFBytes(length:uint):String {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = super.readUTFBytes(length) as String;
            ExternalInterface.call("MITM.readUTFBytes", data, length);
            return data;
        }
        override public function writeBoolean(value:Boolean):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeBoolean", value) as Boolean;
            super.writeBoolean(value);
        }
        override public function writeByte(value:int):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeByte", value) as int;
            super.writeByte(value);
        }
        // Expects new bytes array to have an offset of 0
        // Could be optimized by reducing array size.
        override public function writeBytes(bytes:ByteArray, offset:uint = 0, length:uint = 0):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeBytes", bytes, offset, length) as ByteArray;
            super.writeBytes(bytes, 0, length);
        }
        override public function writeDouble(value:Number):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeDouble", value) as Number;
            super.writeDouble(value);
        }
        override public function writeFloat(value:Number):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeFloat", value) as Number;
            super.writeFloat(value);
        }
        override public function writeInt(value:int):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeInt", value) as int;
            super.writeInt(value);
        }
        override public function writeMultiByte(value:String, charSet:String):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeMultiByte", value, charSet) as String;
            super.writeMultiByte(value, charSet);
        }
        override public function writeObject(object:*):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeObject", object);
            super.writeObject(object);
        }
        override public function writeShort(value:int):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeShort", value) as int;
            super.writeShort(value);
        }
        override public function writeUnsignedInt(value:uint):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeUnsignedInt", value) as uint;
            super.writeUnsignedInt(value);
        }
        override public function writeUTF(value:String):void {
            if (verbose)
                ExternalInterface.call("console.log", arguments.toString());

            var data = ExternalInterface.call("MITM.writeUTF", value) as String;
            super.writeUTF(value);
        }
        // ------- Overriden functions End ------
		
    }
}
