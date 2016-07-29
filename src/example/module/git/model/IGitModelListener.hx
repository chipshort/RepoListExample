package example.module.git.model;
import example.module.git.data.GitRepo;

/**
 * @author Christoph Otter
 */
interface IGitModelListener 
{
	function onReposLoaded (repos : Array<GitRepo>) : Void;
}