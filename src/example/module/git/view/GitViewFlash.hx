package example.module.git.view;

import example.module.git.data.GitRepo;
import flash.display.DisplayObjectContainer;
import flash.text.TextField;
import hex.view.BasicView;

/**
 * ...
 * @author Christoph Otter
 */
class GitViewFlash extends BasicView implements IGitView
{
	var container : DisplayObjectContainer;
	
	public function new (element : DisplayObjectContainer)
	{
		super ();
		
		container = element;
	}
	
	public function setRepos (repos : Array<GitRepo>) : Void
	{
		for (repo in repos) {
			var text = new TextField ();
			text.htmlText = '<a href="' + repo.url + '">' + repo.name + '</a>';
			container.addChild (text);
		}
		
	}
	
}