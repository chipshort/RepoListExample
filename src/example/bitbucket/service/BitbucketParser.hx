package example.bitbucket.service;
import example.module.git.data.GitRepo;
import haxe.Json;

/**
 * ...
 * @author Christoph Otter
 */
class BitbucketParser
{

	public function new ()
	{
		
	}
	
	public function parse (serializedContent : Dynamic) : Array<GitRepo>
	{
		try {
			var data : Dynamic = Json.parse (serializedContent);
			var array : Array<Dynamic> = data.values;
			
			var repos = new Array<GitRepo> ();
			
			for (r in array) {
				repos.push (new GitRepo (r.links.html.href, r.name));
			}
			
			return repos;
		}
		catch (e : Dynamic) {
		}
		
		return [];
		
	}
	
}