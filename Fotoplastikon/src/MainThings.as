package  
{
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;	
	import flash.net.URLRequest;
	import net.flashpunk.World;
	import flash.filesystem.File;
	
	/**
	 * ...
	 * @author Tomasz Chodakowski
	 */
	public class MainThings extends World 
	{
		
		private var _bitmaps:Array;
		private var _fileCount:uint;
		
		public function MainThings() 
		{
			_bitmaps = [];
			_fileCount = 0;
		}
		
		override public function begin():void
		{
			super.begin();
			var f:File = new File();
			f.browseForDirectory("SELECT YOUR PHOTO THINGS");
			f.addEventListener(Event.SELECT, _onDirectorySelected);
			f.addEventListener(Event.CANCEL, _onDirectoryCanceled);
			f.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
		}
		
		private function _onIOError(e:IOErrorEvent):void
		{
			trace(e);
		}
		
		private function _onDirectorySelected(e:Event):void
		{
			var f:File = e.target as File;
			
			_openFiles(f.nativePath);
		}
		
		private function _onDirectoryCanceled(e:Event):void
		{
			trace(e);
		}
		
		private function _openFiles(path:String):void
		{
			var f:File = new File(path);
			
			var contents:Array = f.getDirectoryListing();
			_fileCount = contents.length;
			
			for (var i:int = 0; i < contents.length; i++)
			{
				var imageFile:File = contents[i];
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onLoaderComplete);
				loader.load(new URLRequest(imageFile.url));
			}
		}
		
		private function _onLoaderComplete(e:Event):void
		{
			var bitmap:Bitmap = Bitmap(LoaderInfo(e.target).content);
			_bitmaps.push(bitmap);
			if (_bitmaps.length == _fileCount)
			{
				_allFilesLoaded();
			}
		}
		
		private function _allFilesLoaded():void
		{
			var targetWidth:uint = 400;
			var targetHeight:uint = 400;
			
			
		}
		
	}

}