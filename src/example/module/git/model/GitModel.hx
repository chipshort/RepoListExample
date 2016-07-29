package example.module.git.model;
import example.module.git.data.GitRepo;
import hex.model.Model;
import hex.model.ModelDispatcher;

/**
 * ...
 * @author Christoph Otter
 */
class GitModel extends Model<GitModelDispatcher, IGitModelListener> implements IGitModel
{
	var _repos : Array<GitRepo>;
	
	public function new ()
	{
		super ();
	}
	
	public function getRepos () : Array<GitRepo>
	{
		return _repos;
	}
	
	public function setRepos (repos : Array<GitRepo>) : Void
	{
		_repos = repos;
		dispatcher.onReposLoaded (repos);
	}
	
}

private class GitModelDispatcher extends ModelDispatcher<IGitModelListener> implements IGitModelListener
{
	public function new ()
	{
		super ();
	}
	
	public function onReposLoaded (repos : Array<GitRepo>) : Void
	{
		//macro places dispatch calls inside
	}
}