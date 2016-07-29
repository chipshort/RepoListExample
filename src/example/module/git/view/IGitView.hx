package example.module.git.view;
import example.module.git.data.GitRepo;
import hex.view.IView;

/**
 * @author Christoph Otter
 */
interface IGitView extends IView
{
	function setRepos (repos : Array<GitRepo>) : Void;
}