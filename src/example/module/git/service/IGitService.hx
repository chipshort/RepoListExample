package example.module.git.service;
import example.module.git.data.GitRepo;
import hex.service.stateless.IAsyncStatelessService;

/**
 * ...
 * @author Christoph Otter
 */
interface IGitService extends IAsyncStatelessService
{
	function getRepos () : Array<GitRepo>;
}