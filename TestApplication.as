package
{
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.net.Socket;
    
    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.utils.*;
   
   import flash.external.ExternalInterface;

    public class TestApplication extends Sprite 
    {
        
        public function TestApplication() 
        {
            if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event = null):void 
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            /* Append loadMITM here. It is better to call this function as soon as possible (we could use TestApplication constructor for example)
             * but I wanted to show how to restore a program flow with taking care of race conditions.
             * Note that this is overcomplicated, I am looking for a sort of sleep() function currently. "while(now - start > delay)" does not work.
             */
            loadMITM();
            /* Append return to make sure our MITM library swf is loaded before we continue */
            return;
            /* For the application to run normally, we need to return here somehow (We return to this function at onComplete callback) */
            normalProgramFlow();
        }
        
        private function loadMITM():void {
            var myLoader = new Loader();
            var myCtx = new LoaderContext();
            myCtx.applicationDomain = ApplicationDomain.currentDomain;
            var url:URLRequest = new URLRequest("MITM.swf");
            myLoader.load(url, myCtx);  
            myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleted);
        }
        private function onCompleted(e:Event):void {
            consoleLog("onCompleted");
            //Restore application flow
            normalProgramFlow();
        }
        
        private function normalProgramFlow():void {
            var mitmSocket:Class = null;
            try {
                mitmSocket = ApplicationDomain.currentDomain.getDefinition("com.MITM.MITMSocket") as Class;
                /* We remove */
                //var socket = new Socket();
                /* And add */
                var socket = new mitmSocket();
                consoleLog("Success");
                return;
            } catch(e:Error) {
                consoleLog(e.getStackTrace());
            }
            consoleLog("Failed");
        }
        
        public static function consoleLog(str:String):void {
            ExternalInterface.call("console.log", str);
            trace(str);
        }
        
    }
    
}
