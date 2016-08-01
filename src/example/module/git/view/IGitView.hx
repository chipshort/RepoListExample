package example.module.git.view;
import example.module.git.data.GitRepo;
import hex.event.BasicEvent;
import hex.event.MonoTypeClosureDispatcher;
import hex.view.IView;

/**
 * @author Christoph Otter
 */
interface IGitView extends IView
{
	var onLoadClick : MonoTypeClosureDispatcher<BasicEvent>;
	function setRepos (repos : Array<GitRepo>) : Void;
	function getUser () : String;
}