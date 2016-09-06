package example.bitbucket.service;

import example.module.git.data.GitRepo;
import example.module.git.service.IGitService;
import hex.service.AbstractService;
import hex.service.stateless.AsyncStatelessService;
import hex.service.stateless.StatelessServiceMessage;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author Christoph Otter
 */
class BitbucketService extends HTTPService implements IGitService
{
	public function new ()
	{
		super ();
	}
	
	@PostConstruct
	override public function createConfiguration () : Void
	{
		this.setConfiguration (new HTTPServiceConfiguration ());
		this.setParser (new BitbucketParser ());
	}
	
	public function getRepos () : Array<GitRepo> 
	{
		return this.getResult ();
	}
	
	public function setUser (user : String) : Void
	{
		this.setURL ("https://api.bitbucket.org/2.0/repositories/" + user);
	}
	
}