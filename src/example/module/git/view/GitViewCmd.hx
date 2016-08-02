package example.module.git.view;
import example.module.git.data.GitRepo;
import hex.event.BasicEvent;
import hex.event.MonoTypeClosureDispatcher;
import hex.view.BasicView;

/**
 * ...
 * @author Christoph Otter
 */
class GitViewCmd extends BasicView implements IGitView
{
	public var onLoadClick : MonoTypeClosureDispatcher<BasicEvent>;
	
	var user : String;

	public function new ()
	{
		super ();
		onLoadClick = new MonoTypeClosureDispatcher<BasicEvent> (GitViewEvent.LoadClicked, this);
		
		askUser ();
	}
	
	public function getUser () : String
	{
		return user;
	}
	
	public function setRepos (repos : Array<GitRepo>) : Void
	{
		for (repo in repos) {
			Sys.println (repo.name + " : " + repo.url);
		}
		Sys.println ("");
		askUser ();
	}
	
	inline function askUser () : Void
	{
		Sys.print ("Please enter user name: ");
		user = Sys.stdin ().readLine ();
		
		onLoadClick.dispatchEvent (); //no listeners yet :(
	}
	
}