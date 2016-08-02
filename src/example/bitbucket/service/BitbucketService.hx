package example.bitbucket.service;

import example.module.git.data.GitRepo;
import example.module.git.service.IGitService;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author Christoph Otter
 */
class BitbucketService extends HTTPService implements IGitService
{
	@gitUser("user")
	var user : String;

	public function new() 
	{
		super();
	}
	
	@PostConstruct
	override public function createConfiguration():Void 
	{
		this.setConfiguration (new HTTPServiceConfiguration ("https://api.bitbucket.org/2.0/repositories/" + user));
		this.setParser (new BitbucketParser ());
	}
		
	public function getRepos():Array<GitRepo> 
	{
		return this.getResult ();
	}
	
}