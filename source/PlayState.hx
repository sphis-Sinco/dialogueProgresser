package;

import DialogueJSON;
import FileManager;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var dialogueFile:DialogueJSON;

	var dialogueBox:FlxSprite = new FlxSprite();

	override public function create()
	{
		dialogueFile = FileManager.getJSON(FileManager.getDataFile('dummy.json'));

		dialogueBox.makeGraphic(Std.int(FlxG.width / 1.05), Std.int(FlxG.height / 2));
		dialogueBox.screenCenter();
		dialogueBox.y += dialogueBox.height / 2;
		add(dialogueBox);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
