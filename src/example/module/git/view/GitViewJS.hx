package example.module.git.view;

import example.module.git.data.GitRepo;
import example.module.git.view.IGitView;
import hex.event.BasicEvent;
import hex.event.MonoTypeClosureDispatcher;
import hex.view.BasicView;
import js.Browser;
import js.html.DOMElement;
import js.html.InputElement;
import js.html.KeyEvent;
import js.html.KeyboardEvent;
import js.html.UListElement;

/**
 * ...
 * @author Christoph Otter
 */
class GitViewJS extends BasicView implements IGitView
{
	public var onLoadClick : MonoTypeClosureDispatcher<BasicEvent>;
	
	var container : DOMElement;
	var repoList : UListElement;
	var text : InputElement;
	
	public function new (element : DOMElement)
	{
		super ();
		
		onLoadClick = new MonoTypeClosureDispatcher<BasicEvent> (GitViewEvent.LoadClicked, this);
		
		container = element;
		
		createButton ();
	}
	
	public function setRepos (repos : Array<GitRepo>) : Void
	{
		if (repoList != null) {
			container.removeChild (repoList);
		}
			
		if (repos == null) {
			return;
		}
		
		repoList = Browser.document.createUListElement ();
		
		for (repo in repos) {
			var li = Browser.document.createLIElement ();
			var a = Browser.document.createAnchorElement ();
			
			a.href = repo.url;
			a.innerText = repo.name;
			li.appendChild (a);
			
			repoList.appendChild (li);
		}
		
		container.appendChild (repoList);
	}
	
	public function getUser () : String
	{
		return text.value;
	}
	
	inline function createButton () : Void
	{
		var controls = Browser.document.createDivElement ();
		text = Browser.document.createInputElement ();
		text.type = "text";
		text.onkeypress = function (e : KeyboardEvent) {
			if (e.keyCode == KeyboardEvent.DOM_VK_RETURN) {
				onPressed ();
			}
		}
		text.value = "chipshort";
		controls.appendChild (text);
		
		var btn = Browser.document.createButtonElement ();
		btn.innerText = "Load Repos";
		btn.onclick = onPressed;
		controls.appendChild (btn);
		
		container.appendChild (controls);
		container.appendChild (Browser.document.createBRElement ());
	}
	
	function onPressed ()
	{
		onLoadClick.dispatchEvent ();
	}
	
}