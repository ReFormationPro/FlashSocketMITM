const MITM = {
    initialize: function() {
        this.createMITMListeners();
        this.messageArr = new FixedLengthArray(this.MAX_MESSAGE_COUNT);
    },
    createMITMListeners: function() {
        // Create listeners from HOOKED_METHODS
        this.HOOKED_METHODS.forEach(l => {
            this[l] = listener.bind(null, l);
        });
        function listener(methodName) {
    		var packet = Array.prototype.map.call(arguments, (a) => {return a});
		    return MITM.mainListener(methodName, packet);
        }
    },
    // All listeners are redirected to here for now.
    // Packet is the arguments of the hooked method in the same order with flash.net.Socket method arguments.
    // You can change return value (original is packet[0] to alter behaviour.
    mainListener: function(methodName, packet) {
        this.messageArr.push(packet);
        console.log.apply(null, packet);
        return packet[0];
        //TODO: GUI
    },
    MAX_MESSAGE_COUNT: 100,
    // Hooked Methods Array
    HOOKED_METHODS: ["readBoolean","readByte","readBytes","readDouble","readFloat","readInt","readMultiByte","readObject","readShort","readUnsignedByte","readUnsignedInt","readUnsignedShort","readUTF","readUTFBytes","writeBoolean","writeByte","writeBytes","writeDouble","writeFloat","writeInt","writeMultiByte","writeObject","writeShort","writeUnsignedInt","writeUTF","writeUTFBytes"]
};
/**
  * If one adds elements in a way like arr[arr.length], we can do nothing about it.
  */
class FixedLengthArray extends Array {
    constructor(size) {
        super();
        this.size = size;
    }
    push(element) {
        while (this.size >= this.length) {
            super.shift();
        }
        super.push(element);
    }
    unshift(element) {
        while (this.size >= this.length) {
            super.pop();
        }
        super.unshift(element);
    }
}
MITM.initialize();
