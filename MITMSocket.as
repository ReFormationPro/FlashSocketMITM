package
{
   import flash.net.Socket;
   
   public class MITMSocket extends Socket
   {
        public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void {
            //
            super.addEventListener(type, this.MITMListener, useCapture, priority, useWeakReference);
            super.addEventListener(type, listener, useCapture, priority, useWeakReference);
        }
        
        public function MITMListener(evt:Event):void {
            //
            switch(evt.type) {
                case
                    ...
            }
        }
   }
}
