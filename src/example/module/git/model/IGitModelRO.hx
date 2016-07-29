package example.module.git.model;
import example.module.git.data.GitRepo;
import hex.model.IModelRO;

/**
 * @author Christoph Otter
 */
interface IGitModelRO extends IModelRO<IGitModelListener>
{
	function getRepos () : Array<GitRepo>;
}