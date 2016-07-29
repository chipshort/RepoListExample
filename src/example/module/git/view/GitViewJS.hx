package example.module.git.view;

import example.module.git.data.GitRepo;
import example.module.git.view.IGitView;
import hex.view.BasicView;
import js.Browser;
import js.html.AnchorElement;
import js.html.BRElement;
import js.html.DOMElement;

/**
 * ...
 * @author Christoph Otter
 */
class GitViewJS extends BasicView implements IGitView
{
	var container : DOMElement;
	
	public function new (element : DOMElement)
	{
		super ();
		
		container = element;
	}
	
	public function setRepos (repos : Array<GitRepo>) : Void
	{
		container.innerHTML = "";
		
		for (repo in repos) {
			var a = Browser.document.createAnchorElement ();
			a.href = repo.url;
			a.innerText = repo.name;
			container.appendChild (a);
			container.appendChild (Browser.document.createBRElement ());
		}
		
	}
	
}