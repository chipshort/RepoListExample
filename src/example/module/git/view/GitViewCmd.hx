package example.module.git.view;
import example.module.git.data.GitRepo;
import hex.view.BasicView;

/**
 * ...
 * @author Christoph Otter
 */
class GitViewCmd extends BasicView implements IGitView
{

	public function new() 
	{
		super ();
	}
	
	public function setRepos (repos : Array<GitRepo>) : Void
	{
		for (repo in repos) {
			Sys.println (repo.name + " : " + repo.url);
		}
	}
	
}