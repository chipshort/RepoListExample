package example.module.git.view;

import example.module.git.data.GitRepo;
import example.module.git.view.IGitView;
import hex.event.BasicEvent;
import hex.event.MonoTypeClosureDispatcher;
import hex.view.BasicView;
import js.Browser;
import js.html.DOMElement;
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
	
	public function new (element : DOMElement)
	{
		super ();
		
		onLoadClick = new MonoTypeClosureDispatcher<BasicEvent> (GitViewEvent.LoadClicked, this);
		
		container = element;
		
		createButton ();
	}
	
	public function setRepos (repos : Array<GitRepo>) : Void
	{
		container.innerHTML = "";
		
		var list = Browser.document.createUListElement ();
		
		for (repo in repos) {
			var li = Browser.document.createLIElement ();
			var a = Browser.document.createAnchorElement ();
			
			a.href = repo.url;
			a.innerText = repo.name;
			li.appendChild (a);
			
			list.appendChild (li);
		}
		
		container.appendChild (list);
	}
	
	inline function createButton () : Void
	{
		var text = Browser.document.createInputElement ();
		text.type = "text";
		text.value = "chipshort";
		container.appendChild (text);
		
		var btn = Browser.document.createButtonElement ();
		btn.innerText = "Load Repos";
		btn.onclick = onPressed;
		container.appendChild (btn);
	}
	
	function onPressed ()
	{
		onLoadClick.dispatchEvent ();
	}
	
}