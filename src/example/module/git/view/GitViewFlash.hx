package example.module.git.view;

import example.module.git.data.GitRepo;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.text.TextField;
import hex.event.BasicEvent;
import hex.event.MonoTypeClosureDispatcher;
import hex.view.BasicView;

/**
 * ...
 * @author Christoph Otter
 */
class GitViewFlash extends BasicView implements IGitView
{
	public var onLoadClick : MonoTypeClosureDispatcher<BasicEvent>;
	
	var container : DisplayObjectContainer;
	var repoList : Sprite;
	
	public function new (element : DisplayObjectContainer)
	{
		super ();
		
		onLoadClick = new MonoTypeClosureDispatcher<BasicEvent> (GitViewEvent.LoadClicked, this);
		
		container = element;
		
		createMessage ();
	}
	
	public function setRepos (repos : Array<GitRepo>) : Void
	{
		if (repoList != null)
			container.removeChild (repoList);
		
		repoList = new Sprite ();
		
		for (repo in repos) {
			var text = new TextField ();
			text.htmlText = '<a href="' + repo.url + '">' + repo.name + '</a>';
			repoList.addChild (text);
		}
		
		container.addChild (repoList);
		
	}
	
	inline function createMessage () : Void
	{
		var text = new flash.text.TextField ();
		text.text = "Press 'r' key to load repos";
		
		container.addEventListener (flash.events.KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	function onKeyUp (e : flash.events.KeyboardEvent) : Void
	{
		if (e.keyCode == flash.ui.Keyboard.R)
		onLoadClick.dispatchEvent ();
	}
	
}