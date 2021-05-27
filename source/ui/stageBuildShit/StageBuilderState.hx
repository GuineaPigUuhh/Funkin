package ui.stageBuildShit;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup;
import flixel.input.mouse.FlxMouseButton.FlxMouseButtonID;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

class StageBuilderState extends MusicBeatState
{
	private var hudGrp:FlxGroup;

	private var sprGrp:FlxGroup;

	// var snd:Sound;
	// var sndChannel:SoundChannel;

	override function create()
	{
		super.create();

		FlxG.mouse.visible = true;

		// var alsoSnd:FlxSound = new FlxSound();

		// snd = new Sound();

		// var swagBytes:ByteArray = new ByteArray(8192);

		// for (shit in 0...8192)
		// {
		// swagBytes.writeFloat(Math.sin((shit) / Math.PI) * 0.25);
		// swagBytes.writeFloat(Math.sin((shit) / Math.PI) * 0.25);
		// trace('wweseosme???');
		// }

		// snd.__buffer = AudioBuffer.fromBytes(swagBytes);
		// snd.dispatchEvent(new Event(Event.COMPLETE));

		// swagBytes.writeFloat(Math.sin((shit + event.position) / Math.PI) * 0.25);
		// swagBytes.writeFloat(Math.sin((shit + event.position) / Math.PI) * 0.25);

		// function sineShit(event:SampleDataEvent):Void
		// {
		// 	for (shit in 0...8192)
		// 	{
		// 		event.data.writeFloat(Math.sin((shit + event.position) / Math.PI) * 0.25);
		// 		event.data.writeFloat(Math.sin((shit + event.position) / Math.PI) * 0.25);
		// 		trace('wweseosme???');
		// 	}
		// }

		// snd.addEventListener(SampleDataEvent.SAMPLE_DATA, sineShit);
		// snd.__buffer.
		// snd = Assets.getSound(Paths.music('freakyMenu'));
		// for (thing in snd.load)
		// thing = Std.int(thing / 2);
		// snd.play();
		// trace(snd.__buffer.data.toBytes().getData().bytes);

		var bg:FlxSprite = FlxGridOverlay.create(10, 10);
		add(bg);

		sprGrp = new FlxGroup();
		add(sprGrp);

		hudGrp = new FlxGroup();
		add(hudGrp);

		var imgBtn:FlxButton = new FlxButton(20, 20, "Load Image", loadImage);
		hudGrp.add(imgBtn);

		var saveSceneBtn:FlxButton = new FlxButton(20, 50, "Save Scene", saveScene);
		hudGrp.add(saveSceneBtn);

		FlxMouseEventManager.init();

		#if desktop
		FlxG.stage.window.onDropFile.add(function(path:String)
		{
			trace("DROPPED FILE FROM: " + Std.string(path));

			var fileName:String = path.split('\\').pop();
			var fileNameNoExt:String = fileName.split('.')[0];

			var newPath = './' + Paths.image('stageBuild/' + fileNameNoExt);
			// sys.io.File.copy(path, newPath);
			// trace(sys.io.File.getBytes(Std.string(path)).toString());

			// FlxG.bitmap.add('assets/preload/images/stageBuild/eltonJohn.png');

			sys.io.File.copy(path, './' + Paths.image('stageBuild/stageTempImg'));

			var fo = sys.io.File.write(newPath);

			fo.write(sys.io.File.getBytes(path));

			new FlxTimer().start(0.2, function(tmr)
			{
				var awesomeImg:SprStage = new SprStage(FlxG.mouse.x, FlxG.mouse.y);
				awesomeImg.loadGraphic(Paths.image('stageBuild/stageTempImg'), false, 0, 0, true);

				sprGrp.add(awesomeImg);

				// FlxMouseEventManager.add(awesomeImg, swagMousePress, null, null, null, false, true, false, [FlxMouseButtonID.LEFT, FlxMouseButtonID.RIGHT]);
			});

			// Load the image shit by
			// 1. reading the image file names
			// 2. copy to stage temp like normal?

			// var awesomeImg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stageBuild/swag'));
			// sprGrp.add(awesomeImg);
			// var swag = Paths.image('characters/temp');

			// if (bf != null)
			// remove(bf);
			// FlxG.bitmap.removeByKey(Paths.image('characters/temp'));

			// bf.loadGraphic(Paths.image('characters/temp'));
			// add(bf);
		});
		#end
	}

	function swagMousePress(spr:SprStage)
	{
		// spr.setPosition(FlxG.mouse.x, FlxG.mouse.y);
	}

	function loadImage():Void
	{
		var img:FlxSprite = new FlxSprite().loadGraphic(Paths.image('newgrounds_logo'));
		img.scrollFactor.set(0.5, 2);
		sprGrp.add(img);
	}

	function saveScene():Void
	{
		// trace();
	}

	override function update(elapsed:Float)
	{
		// trace(sndChannel.position);
		// trace(snd

		CoolUtil.mouseCamDrag();

		if (FlxG.keys.pressed.CONTROL)
			CoolUtil.mouseWheelZoom();

		super.update(elapsed);
	}
}