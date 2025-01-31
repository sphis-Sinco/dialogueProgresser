package;

import DialogueJSON;
import FileManager;
import flixel.FlxState;

class PlayState extends FlxState
{
	var dialogueFile:DialogueJSON;

	override public function create()
	{
		dialogueFile = FileManager.getJSON(FileManager.getDataFile('dummy.json'));

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
