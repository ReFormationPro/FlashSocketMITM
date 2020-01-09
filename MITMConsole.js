var MITM = {
  // Logs its arguments. Arguments are in the same order with flash.net.Socket method arguments
  // and they are followed by the method name.
	mainListener: function() {
		console.log(arguments);
		return arguments[0];
	}
	
}
// Hooked Methods Array
var methods = ["readBoolean","readByte","readBytes","readDouble","readFloat","readInt","readMultiByte","readObject","readShort","readUnsignedByte","readUnsignedInt","readUnsignedShort","readUTF","readUTFBytes","writeBoolean","writeByte","writeBytes","writeDouble","writeFloat","writeInt","writeMultiByte","writeObject","writeShort","writeUnsignedInt","writeUTF","writeUTFBytes"];
methods.forEach(m => {
  // Creates method listeners. If you want to disable some of them, remove them from the array above.
  // Or you may type "delete MITM.methodName" into your console later.
	MITM[m] = function () {
		var arr = Array.prototype.map.call(arguments, (a) => {return a});
		arr.push(m);
		return MITM.mainListener.apply(null, arr);
	};
});
