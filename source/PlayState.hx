package;

import DialogueJSON;
import FileManager;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var dialogueFile:DialogueJSON;

	var dialogueBox:FlxSprite = new FlxSprite();
	var dialogueText:FlxText = new FlxText();

	override public function create()
	{
		dialogueFile = FileManager.getJSON(FileManager.getDataFile('dummy.json'));

		dialogueBox.makeGraphic(Std.int(FlxG.width / 1.05), Std.int(FlxG.height / 2));
		dialogueBox.screenCenter();
		dialogueBox.y = FlxG.height - dialogueBox.height - 16;
		add(dialogueBox);

		dialogueText.text = dialogueFile.pages[dialogueFile.first_page - 1].dialogue;
		dialogueText.size = 16;
		dialogueText.color = 0x000000;
		dialogueText.setPosition(dialogueBox.x, dialogueBox.y);
		dialogueText.fieldWidth = dialogueBox.width;
		dialogueText.fieldHeight = dialogueBox.height;
		add(dialogueText);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
