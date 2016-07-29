package example.github.service;

import example.module.git.data.GitRepo;
import example.module.git.service.IGitService;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author Christoph Otter
 */
class GithubService extends HTTPService implements IGitService
{

	public function new ()
	{
		super ();
	}
	
	@PostConstruct
	override public function createConfiguration() : Void
	{
		this.setConfiguration (new HTTPServiceConfiguration ("https://api.github.com/users/mralexgray/repos"));
		this.setParser (new GithubParser ());
	}
	
	public function getRepos () : Array<GitRepo> 
	{
		return this.getResult ();
	}
	
}