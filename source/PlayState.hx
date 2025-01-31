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
	var dialogue_currentPage:Int = 0;

	override public function create()
	{
		dialogueSetup();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justReleased.SPACE)
		{
			updateDialogueText();
		}

		super.update(elapsed);
	}

	public function dialogueSetup()
	{
		dialogueFile = FileManager.getJSON(FileManager.getDataFile('dummy.json'));

		dialogueBox.makeGraphic(Std.int(FlxG.width / 1.05), Std.int(FlxG.height / 2));
		dialogueBox.screenCenter();
		dialogueBox.y = FlxG.height - dialogueBox.height - 16;
		add(dialogueBox);

		dialogue_currentPage = dialogueFile.first_page - 1;

		dialogueText.size = 16;
		dialogueText.color = 0x000000;
		dialogueText.setPosition(dialogueBox.x, dialogueBox.y);
		dialogueText.fieldWidth = dialogueBox.width;
		dialogueText.fieldHeight = dialogueBox.height;
		add(dialogueText);
		updateDialogueText();
	}

	public function updateDialogueText()
	{
		try
		{
			dialogue_currentPage = dialogueFile.pages[dialogue_currentPage].next_page - 1;
			dialogueText.text = dialogueFile.pages[dialogue_currentPage].dialogue;
		}
		catch (e) {}
	}
}
