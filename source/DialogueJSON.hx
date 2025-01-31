typedef DialogueJSON =
{
	var first_page:Int;
	var pages:Array<Page>;
}

typedef Page =
{
	var dialogue:String;
	var ?next_page:Int;
}