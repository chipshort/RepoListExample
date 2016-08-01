package example.module.git.model;
import example.module.git.data.GitRepo;
import hex.event.BasicEvent;
import hex.event.MonoTypeClosureDispatcher;

/**
 * @author Christoph Otter
 */
interface IGitModelListener 
{
	function onReposLoaded (repos : Array<GitRepo>) : Void;
}