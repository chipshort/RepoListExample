package example.module.git.view;

import example.module.git.data.GitRepo;
import example.module.git.message.GitModuleMessage;
import example.module.git.model.IGitModelListener;
import example.module.git.model.IGitModelRO;
import hex.event.BasicEvent;
import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author Christoph Otter
 */
class GitViewHelper extends ViewHelper<IGitView> implements IGitModelListener
{
	@Inject var model : IGitModelRO;

	public function new ()
	{
		super ();
	}
	
	override function _initialize():Void 
	{
		model.addListener (this);
		this._view.onLoadClick.addEventListener (onClick);
	}
	
	public function onReposLoaded (repos : Array<GitRepo>) : Void
	{
		this._view.setRepos (repos);
	}
	
	public function getUser () : String
	{
		return this._view.getUser ();
	}
	
	function onClick (e : BasicEvent) : Void
	{
		this._view.getUser ();
		this.dispatcher.dispatch (GitModuleMessage.LOAD_REPOS);
	}
	
}