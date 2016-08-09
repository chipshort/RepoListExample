package example.module.git.view;

import example.module.git.data.GitRepo;
import example.module.git.data.UserSetting;
import example.module.git.message.GitModuleMessage;
import example.module.git.model.IGitModelListener;
import example.module.git.model.IGitModelRO;
import hex.control.Request;
import hex.control.payload.ExecutionPayload;
import hex.event.BasicEvent;
import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author Christoph Otter
 */
class GitViewHelper extends ViewHelper<IGitView> implements IGitModelListener
{
	@Inject var model : IGitModelRO;
	@Inject var userSettings : UserSetting;
	
	public function new ()
	{
		super ();
	}
	
	override function _initialize() : Void 
	{
		model.addListener (this);
		this._view.onLoadClick.addEventListener (onClick);
		this._view.setUser (userSettings.defaultName);
		this._view.initialize ();
	}
	
	public function onReposLoaded (repos : Array<GitRepo>) : Void
	{
		this._view.setRepos (repos);
	}
	
	function onClick (e : BasicEvent) : Void
	{
		var request = new Request ([new ExecutionPayload (this._view.getUser (), String)]);
		this.dispatcher.dispatch (GitModuleMessage.LOAD_REPOS, [request]);
	}
	
}