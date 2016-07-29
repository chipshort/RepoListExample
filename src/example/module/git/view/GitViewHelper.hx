package example.module.git.view;

import example.module.git.data.GitRepo;
import example.module.git.model.GitModel;
import example.module.git.model.IGitModelListener;
import example.module.git.model.IGitModelRO;
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
	}
	
	public function onReposLoaded (repos : Array<GitRepo>) : Void
	{
		this._view.setRepos (repos);
	}
	
}