package example.module.git.model;
import example.module.git.data.GitRepo;

/**
 * @author Christoph Otter
 */
interface IGitModel extends IGitModelRO 
{
	function setRepos (repos : Array<GitRepo>) : Void;
}